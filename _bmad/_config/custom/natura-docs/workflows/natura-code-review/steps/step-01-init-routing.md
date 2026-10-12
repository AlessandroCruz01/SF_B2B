---
name: 'step-01-init-routing'
description:
    'Detectar tipo de review (re-review/bug) e rotear para fluxo apropriado'

# File References
continueFile: './step-01b-continue.md'
reReviewPath: './step-01b-load-previous-report.md'
bugFlowPath: './step-02a-collect-pr-info-bug.md'
normalFlowPath: './step-02a-collect-pr-info.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 1.1: Análise de Contexto e Roteamento

## STEP GOAL:

Detectar o tipo de review em andamento (novo/re-review/bug) e rotear para o
fluxo apropriado com base no contexto do PR.

## ROUTING LOGIC:

### 1. Verificar Sessão Anterior em Andamento

**Se arquivo sidecar existe:**

```bash
test -f "docs/code-reviews/.code-review-state.json"
# Result: true
```

- **AÇÃO**: Carregar imediatamente `{continueFile}` (step-01b-continue.md)
- **MOTIVO**: Continuação de sessão anterior em andamento
- **STOP**: Não prosseguir com detecções abaixo
- CONTINUAR para o arquivo de continuação

---

**Se arquivo sidecar NÃO existe:**

- Prosseguir para seleção de PR abaixo

### 2. Selecionar PR para Revisar

**CRITICAL:** Usuário deve escolher qual PR revisar ANTES de qualquer detecção.

**2.1 Detectar Branch Atual**

```bash
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
```

**2.2 Apresentar Menu Interativo**

Mostrar ao usuário:

```
🔍 Qual PR você deseja revisar?

[1] Branch atual: ${CURRENT_BRANCH}
[2] Listar PRs abertos no repositório
[3] Digitar branch ou número do PR manualmente

Escolha uma opção [1/2/3]:
```

**2.3 Processar Escolha do Usuário**

**Se escolheu [1] - Branch Atual:**

```bash
SELECTED_BRANCH="${CURRENT_BRANCH}"
```

Confirmar: "✅ Revisar branch: ${SELECTED_BRANCH}. Continuar? [S/N]"

- Se N: Retornar ao menu
- Se S: Prosseguir

**Se escolheu [2] - Listar PRs:**

```bash
# Buscar PRs abertos
gh pr list --state open --json number,title,headRefName,author --limit 20
```

Mostrar tabela:

```
PRs Abertos:
#123  feature/npcv-538--csv-import      Import CSV functionality
#124  bugfix/npcv-540--fix-validation   Fix validation error
...

Digite o número do PR ou branch [ou C para cancelar]:
```

Validar entrada:

```bash
# Se digitou número (ex: 123)
if [[ "${USER_INPUT}" =~ ^[0-9]+$ ]]; then
  SELECTED_BRANCH=$(gh pr view ${USER_INPUT} --json headRefName --jq '.headRefName')
fi

# Se digitou branch
if [[ "${USER_INPUT}" =~ ^[a-zA-Z] ]]; then
  SELECTED_BRANCH="${USER_INPUT}"
fi
```

**Se escolheu [3] - Digitar Manualmente:**

Perguntar: "Digite a branch ou número do PR (Ex: feature/npcv-538 ou #123):"

```bash
USER_INPUT="${USER_PROVIDED_VALUE}"

# Se começou com #, remover e tratar como número
if [[ "${USER_INPUT}" =~ ^# ]]; then
  PR_NUMBER="${USER_INPUT#\#}"
  SELECTED_BRANCH=$(gh pr view ${PR_NUMBER} --json headRefName --jq '.headRefName')
else
  SELECTED_BRANCH="${USER_INPUT}"
fi
```

**2.4 Validar PR Selecionado**

```bash
# Verificar se PR existe
gh pr view ${SELECTED_BRANCH} --json number,title,state 2>/dev/null

if [ $? -ne 0 ]; then
  echo "❌ ERRO: PR não encontrado para branch '${SELECTED_BRANCH}'"
  echo "Deseja tentar novamente? [S/N]"
  # Se S: Retornar ao menu 2.2
  # Se N: Sair do workflow
fi
```

Exibir confirmação:

```
✅ PR Selecionado:
   Branch: ${SELECTED_BRANCH}
   PR: #${PR_NUMBER} - ${PR_TITLE}
   Status: ${PR_STATE}
```

**2.5 Fazer Checkout da Branch Selecionada**

```bash
# Verificar se precisa fazer checkout
if [ "$(git rev-parse --abbrev-ref HEAD)" != "${SELECTED_BRANCH}" ]; then

  # Verificar mudanças não commitadas
  if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️ Você tem mudanças não commitadas."
    echo "Deseja fazer stash? [S] Sim  [N] Não (cancelar)"

    if [ "${STASH_CHOICE}" = "S" ]; then
      git stash push -m "Auto-stash before code review of ${SELECTED_BRANCH}"
      echo "✅ Mudanças salvas em stash"
    else
      echo "❌ Code review cancelado"
      exit 1
    fi
  fi

  # Fazer checkout
  echo "🔄 Fazendo checkout de ${SELECTED_BRANCH}..."
  git checkout "${SELECTED_BRANCH}"
  git pull origin "${SELECTED_BRANCH}"
  echo "✅ Branch atualizada"
else
  echo "✅ Já está na branch ${SELECTED_BRANCH}"
  git pull origin "${SELECTED_BRANCH}"
fi
```

---

### 3. Detectar Re-Review (Usando Branch SELECIONADA)

Um re-review ocorre quando desenvolvedor corrige um PR reprovado:

**3.1 Extrair número do card da BRANCH SELECIONADA**

```bash
# Usar a branch SELECIONADA pelo usuário (não a atual do git)
BRANCH="${SELECTED_BRANCH}"

# Extract card number from branch
# Exemplos: feature/NPCV-123, bugfix/NPCV-456
CARD_FROM_BRANCH=$(echo "${BRANCH}" | grep -oE 'NPCV-[0-9]+' | head -1)

# If not found in branch, try commit message
if [ -z "${CARD_FROM_BRANCH}" ]; then
  CARD_FROM_BRANCH=$(git log -1 --pretty=%B | grep -oE 'NPCV-[0-9]+' | head -1)
fi
```

**3.2 Verificar se relatório anterior existe**

```bash
if [ -n "${CARD_FROM_BRANCH}" ]; then
  REPORT_FILE="docs/code-reviews/${CARD_FROM_BRANCH}--code-review.md"
  if [ -f "${REPORT_FILE}" ]; then
    IS_RE_REVIEW="true"
  else
    IS_RE_REVIEW="false"
  fi
else
  IS_RE_REVIEW="false"
fi
```

**Se IS_RE_REVIEW = true:**

```
✅ Detectado: RE-REVIEW
   Card: ${CARD_FROM_BRANCH}
   Relatório anterior: docs/code-reviews/${CARD_FROM_BRANCH}--code-review.md

   Workflow otimizado para validar apenas as correções.
   Carregando contexto anterior...
```

- **AÇÃO**: Carregar `{reReviewPath}` (step-01b-load-previous-report.md)
- **MOTIVO**: Otimizar para validação de correções específicas
- **STOP**: Não continuar com detecção de bug

---

### 4. Detectar Bug Review (Usando Branch SELECIONADA)

Um bug review é otimizado quando:

**4.1 Branch indica bug**

```bash
# Usar branch SELECIONADA (não a atual do git)
BRANCH="${SELECTED_BRANCH}"

if [[ "${BRANCH}" =~ ^bugfix/ ]]; then
  IS_BUG_REVIEW="true"
  BUG_DETECTION_METHOD="branch"
fi
```

**4.2 PR title contém palavras-chave**

```bash
PR_TITLE=$(gh pr view --json title --jq '.title' 2>/dev/null || echo "")

if [ -z "${IS_BUG_REVIEW}" ]; then
  if [[ "${PR_TITLE}" =~ (bug|fix|hotfix|patch) ]]; then
    IS_BUG_REVIEW="true"
    BUG_DETECTION_METHOD="title"
  fi
fi
```

**4.3 Poucos arquivos modificados**

```bash
FILE_COUNT=$(git diff --name-only | wc -l)

if [ "${IS_BUG_REVIEW}" != "true" ]; then
  if [ "${FILE_COUNT}" -lt 6 ]; then
    echo "ℹ️ Detectado: Apenas ${FILE_COUNT} arquivo(s) modificado(s)"
    echo ""
    echo "Parece ser um bug fix/hotfix?"
    echo "   [Y] Sim, otimizar como bug review"
    echo "   [N] Não, executar review completo"
    # Read user input
    IS_BUG_REVIEW="${USER_INPUT:-false}"
    BUG_DETECTION_METHOD="manual"
  fi
fi

# Default if not detected
if [ -z "${IS_BUG_REVIEW}" ]; then
  IS_BUG_REVIEW="false"
fi
```

**Se IS_BUG_REVIEW = true:**

```
🐛 Detectado: BUG REVIEW
   Método: ${BUG_DETECTION_METHOD}

   Workflow otimizado:
   - Story/AC: ⏭️ Opcional
   - Análise Funcional: ⏭️ Pulada
   - Testes: Validação apenas (sem cobertura %)
   - Relatório: Simplificado
   - CSVs: Não serão atualizados

   Iniciando fluxo de bug review...
```

- **AÇÃO**: Carregar `{bugFlowPath}` (step-02a-collect-pr-info-bug.md)
- **MOTIVO**: Fluxo otimizado para correções rápidas

---

### 5. Review Normal (Padrão)

Se nenhuma das detecções acima ocorreu:

```
ℹ️ Review normal: Fluxo completo será executado

   Coletando informações do PR...
```

- **AÇÃO**: Carregar `{normalFlowPath}` (step-02a-collect-pr-info.md)
- **MOTIVO**: Novo review completo com todas as validações

---

## ROTEAMENTO FINAL

```
┌─────────────────────────────────────────┐
│  Sidecar exists?                        │
├─────────────────────────────────────────┤
│  YES → step-01b-continue.md             │
│  NO  → Continue below                   │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  Select PR (Menu Interactive)           │
├─────────────────────────────────────────┤
│  [1] Current branch                     │
│  [2] List open PRs                      │
│  [3] Manual input                       │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  Checkout SELECTED branch               │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  Is re-review?                          │
├─────────────────────────────────────────┤
│  YES → step-01b-load-previous-report.md │
│  NO  → Continue below                   │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  Is bug review?                         │
├─────────────────────────────────────────┤
│  YES → step-02a-collect-pr-info-bug.md  │
│  NO  → step-02a-collect-pr-info.md      │
└─────────────────────────────────────────┘
```

---

## SUCCESS METRICS

- Sidecar state detected correctly
- **PR selected by user BEFORE any detection** ✅
- **Branch checkout completed before routing** ✅
- Re-review detection working on SELECTED branch
- Bug review detection working on SELECTED branch (3 methods)
- User routed to correct next step
- Context preserved for next step (SELECTED_BRANCH variable)
