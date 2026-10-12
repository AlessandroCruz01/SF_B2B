---
name: 'step-02a-collect-pr-info'
description: 'Confirmar informações do PR já selecionado e coletar responsáveis'

# File References
nextStepFile: './step-02b-collect-story.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 2a: Confirmação de Informações do PR

## STEP GOAL:

Confirmar informações do PR já selecionado no routing e coletar informações de
responsáveis (Desenvolvedor, Reviewer, Card).

**CONTEXT:** O usuário já selecionou a branch e o PR no step-01-init-routing.
Este step apenas confirma e complementa as informações.

## MANDATORY RULES:

- NEVER ask for branch again (already selected in routing)
- CRITICAL: Read complete step file before action
- YOU ARE A FACILITATOR
- Validate all inputs before proceeding
- Create sidecar file before next step

## SEQUENCE:

### 1. Recuperar Informações do PR Selecionado

**A branch já foi selecionada e checkout foi feito no step-01-init-routing.**

```bash
# Branch atual deve ser a selecionada
SELECTED_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Buscar informações do PR
gh pr view ${SELECTED_BRANCH} --json number,title,state,author
```

Extrair:

- `PR_NUMBER`
- `PR_TITLE`
- `PR_STATE`
- `PR_AUTHOR`

Exibir confirmação:

```
📋 Informações do PR Selecionado:
   Branch: ${SELECTED_BRANCH}
   PR: #${PR_NUMBER} - ${PR_TITLE}
   Status: ${PR_STATE}
   Autor: ${PR_AUTHOR}
```

### 2. Confirmar Desenvolvedor (Author)

```bash
DEVELOPER=$(gh pr view --json author --jq '.author.login')
```

Perguntar: "Desenvolvedor responsável: **${DEVELOPER}**. Correto? [S/N]"

- Se **N**: "Digite o nome correto do desenvolvedor:"
    - Ler input do usuário
    - Atualizar `DEVELOPER`

### 3. Detectar Reviewer (Current User)

```bash
REVIEWER=$(git config user.name)
```

Perguntar: "Reviewer: **${REVIEWER}**. Correto? [S/N/E]"

- Se **N**: "Digite o nome correto do reviewer:"
    - Ler input do usuário
    - Atualizar `REVIEWER`
- Se **E**: "Digite o email do reviewer:"
    - Ler input do usuário
    - Atualizar `REVIEWER`

### 4. Extrair ou Confirmar Card Number

Tentar extrair da branch:

```bash
CARD_FROM_BRANCH=$(echo "${SELECTED_BRANCH}" | grep -oE 'NPCV-[0-9]+' | head -1)
```

**Se encontrado:** Perguntar: "Card detectado: **${CARD_FROM_BRANCH}**. Correto?
[S/N]"

- Se **S**: Usar `CARD_FROM_BRANCH`
- Se **N**: "Digite o Card correto (Ex: NPCV-538):"

**Se NÃO encontrado:** Perguntar: "Qual é o Card/Ticket? (Ex: NPCV-538):"

- Ler input do usuário
- Validar formato `NPCV-XXX`

### 5. Summary & Confirm

Exibir resumo completo:

```
✅ Confirmação Final das Informações

╔════════════════════════════════════════════╗
║  Campo           │  Valor                  ║
╠════════════════════════════════════════════╣
║  Branch          │  ${SELECTED_BRANCH}     ║
║  PR              │  #${PR_NUMBER}          ║
║  Título          │  ${PR_TITLE}            ║
║  Desenvolvedor   │  ${DEVELOPER}           ║
║  Reviewer        │  ${REVIEWER}            ║
║  Card/Ticket     │  ${CARD}                ║
╚════════════════════════════════════════════╝

Todas as informações estão corretas? [S/N]
```

**Se N:**

- Perguntar: "Qual campo deseja corrigir? [Branch/Dev/Reviewer/Card/Cancelar]"
- Retornar à seção específica para correção
- Re-exibir summary após correção

**Se S:**

- Prosseguir para criação do sidecar

### 6. Create Sidecar File

Criar arquivo de estado:

```json
{
  "branch": "${SELECTED_BRANCH}",
  "pr_number": ${PR_NUMBER},
  "pr_title": "${PR_TITLE}",
  "card": "${CARD}",
  "desenvolvedor": "${DEVELOPER}",
  "reviewer": "${REVIEWER}",
  "selected_at_routing": true,
  "current_step": "2a",
  "files_reviewed": [],
  "observations": {}
}
```

Save to: `{sidecarFile}`

**Confirmação:**

```
✅ Arquivo de estado criado: docs/code-reviews/.code-review-state.json
```

### 7. Present Menu

Display:

```
✅ Informações confirmadas e salvas!

[C] Continue para coleta de história/ACs
```

**Menu Handling:**

- **IF C**: Update sidecar `current_step: "2b"`, then load, read entire file,
  and execute `{nextStepFile}`
- **Else**: Help user respond, then redisplay menu

---

## SUCCESS METRICS

- ✅ PR information retrieved from already-selected branch
- ✅ Developer confirmed or corrected
- ✅ Reviewer confirmed or corrected
- ✅ Card extracted or manually provided
- ✅ All information confirmed by user
- ✅ Sidecar file created successfully
- ✅ NO duplicate branch selection (already done in routing)

## NOTES

**IMPORTANT CHANGES from previous version:**

- ❌ **REMOVED**: "Ask for branch" (now done in step-01-init-routing)
- ❌ **REMOVED**: "Verify PR exists" (now done in step-01-init-routing)
- ❌ **REMOVED**: "Checkout PR branch" (now done in step-01-init-routing)
- ✅ **ADDED**: Context awareness that branch was already selected
- ✅ **ADDED**: `selected_at_routing: true` flag in sidecar
