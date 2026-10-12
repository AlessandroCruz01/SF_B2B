---
name: 'step-01b-continue'
description: 'Retomar sessão de code review interrompida'

# File References
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
step01: './step-01-init.md'
step02a: './step-02a-collect-pr-info.md'
step02b: './step-02b-collect-story.md'
step03: './step-03-analyze-changes.md'
step04: './step-04-code-review.md'
step05: './step-05-test-analysis.md'
step06: './step-06-generate-output.md'
step07: './step-07-summary.md'
---

# Step 1b: Retomar Code Review

## STEP GOAL:

Detectar o estado da sessão anterior de code review e retomar do ponto onde
parou.

## MANDATORY EXECUTION RULES (READ FIRST):

### Universal Rules:

- NEVER generate content without user input
- CRITICAL: Read the complete step file before taking any action
- YOU ARE A FACILITATOR, not a content generator

### Role Reinforcement:

- You are a **Code Reviewer / Tech Lead** especializado em Salesforce B2B
  Commerce
- We engage in collaborative dialogue, not command-response
- Maintain professional, objective tone throughout

### Step-Specific Rules:

- Focus ONLY on loading state and routing
- FORBIDDEN to modify state without user consent
- Properly route to the correct step based on sidecar state

## CONTINUATION SEQUENCE:

### 1. Carregar Estado da Sessão

Ler o arquivo sidecar em `{sidecarFile}`:

```json
{
    "session_id": "uuid",
    "branch": "feature/xxx",
    "card": "NPCV-XXX",
    "desenvolvedor": "Nome do Dev",
    "reviewer": "Nome do Reviewer",
    "started_at": "ISO-date",
    "current_step": 4,
    "files_reviewed": ["file1.cls", "file2.cls"],
    "files_pending": ["file3.cls"],
    "observations": {}
}
```

### 2. Validar Consistência de Branch

**CRÍTICO:** Verificar se a branch do git está alinhada com a branch do sidecar.

```bash
SIDECAR_BRANCH=$(jq -r '.branch' < "${sidecarFile}")
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
```

**Se branches são diferentes:**

Exibir aviso:

```
⚠️ INCONSISTÊNCIA DETECTADA

Sidecar indica: ${SIDECAR_BRANCH}
Branch atual:   ${CURRENT_BRANCH}

Você está em uma branch diferente da sessão anterior!

O que deseja fazer?

[1] Fazer checkout de ${SIDECAR_BRANCH} e continuar sessão
[2] Abandonar sessão anterior e começar novo review em ${CURRENT_BRANCH}
[3] Cancelar

Escolha [1/2/3]:
```

**Processar escolha:**

- **Se [1]:**

    ```bash
    # Verificar mudanças não commitadas
    if [ -n "$(git status --porcelain)" ]; then
      echo "⚠️ Você tem mudanças não commitadas."
      echo "Deseja fazer stash? [S/N]"

      if [ "${STASH_CHOICE}" = "S" ]; then
        git stash push -m "Auto-stash before continuing code review"
        echo "✅ Mudanças salvas em stash"
      else
        echo "❌ Operação cancelada. Commit ou descarte as mudanças primeiro."
        exit 1
      fi
    fi

    # Fazer checkout
    git checkout "${SIDECAR_BRANCH}"
    git pull origin "${SIDECAR_BRANCH}"
    echo "✅ Checkout de ${SIDECAR_BRANCH} realizado"
    ```

    Continuar para seção 3.

- **Se [2]:**

    ```bash
    # Deletar sidecar antigo
    rm "${sidecarFile}"
    echo "✅ Sessão anterior abandonada"
    echo ""
    echo "Iniciando novo review em ${CURRENT_BRANCH}..."
    # Retornar ao step-01-init-routing para selecionar PR
    ```

    Exit e retornar ao routing.

- **Se [3]:**
    ```bash
    echo "❌ Operação cancelada"
    exit 1
    ```

**Se branches são iguais:**

- Prosseguir para seção 3.

### 3. Exibir Resumo da Sessão

```
# Code Review - Sessão em Andamento

Encontrei uma sessão de code review anterior:

| Campo | Valor |
|-------|-------|
| **Card** | {card} |
| **Branch** | {branch} |
| **Desenvolvedor** | {desenvolvedor} |
| **Reviewer** | {reviewer} |
| **Iniciado em** | {started_at} |
| **Step atual** | {current_step} |

## Progresso
- Arquivos revisados: {files_reviewed.length}
- Arquivos pendentes: {files_pending.length}

O que deseja fazer?
```

### 4. Apresentar Opções

Display: **Selecione uma Opção:** `[C]` Continuar de onde parou `[R]` Reiniciar
do zero `[A]` Abandonar sessão

#### Menu Handling Logic:

- **IF C (Continuar)**: Carregar o step correspondente ao `current_step` do
  sidecar
    - current_step = 2 → carregar `{step02}`
    - current_step = 3 → carregar `{step03}`
    - current_step = 4 → carregar `{step04}`
    - current_step = 5 → carregar `{step05}`
    - current_step = 6 → carregar `{step06}`
    - current_step = 7 → carregar `{step07}`

- **IF R (Reiniciar)**:
    - Deletar sidecar file
    - Carregar `{step02}` para iniciar do zero

- **IF A (Abandonar)**:
    - Deletar sidecar file
    - Exibir "Sessão abandonada. Execute o workflow novamente para iniciar um
      novo review."
    - Encerrar workflow

#### EXECUTION RULES:

- ALWAYS halt and wait for user input after presenting menu
- ONLY proceed when user makes a selection
- Properly route based on user choice

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- Sidecar state properly loaded and displayed
- **Branch consistency validated** ✅
- **Branch mismatch handled gracefully** ✅
- User informed of session status
- Correct routing based on user choice
- State preserved for continuation

### SYSTEM FAILURE:

- Not loading sidecar properly
- **Not validating branch consistency** ❌
- Not showing session summary
- Routing to wrong step
- Losing state during continuation

**Master Rule:** Skipping steps, optimizing sequences, or not following exact
instructions is FORBIDDEN and constitutes SYSTEM FAILURE.

## NOTES

**IMPORTANT CHANGES (2026-02-04):**

- ✅ **ADDED**: Branch consistency validation (Section 2)
- ✅ **ADDED**: Auto-checkout option when branch mismatch detected
- ✅ **ADDED**: Stash management for uncommitted changes
- ✅ **ADDED**: Option to abandon old session and start fresh
