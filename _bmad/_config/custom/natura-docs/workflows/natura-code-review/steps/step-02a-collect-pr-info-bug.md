---
name: 'step-02a-collect-pr-info-bug'
description:
    'Confirmar informações do PR já selecionado para bug review (otimizado)'
nextStepFile: './step-03-analyze-changes.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 2a (Bug Review): Confirmação de Informações - OTIMIZADO

## 🐛 BUG REVIEW OPTIMIZATION

Optimized for bug fixes:

- **Story/Card**: Optional (bugs may not have formal tickets)
- **Acceptance Criteria**: Skipped
- **Focus**: "O bug está realmente corrigido?"
- **Time**: 2-3 minutos (vs 5-10 minutos normal review)

## STEP GOAL

Confirmar informações do PR já selecionado, coletar responsáveis e avaliar
severidade do bug.

**CONTEXT:** O usuário já selecionou a branch e o PR no step-01-init-routing.
Este step apenas confirma e complementa as informações específicas de bug
review.

## MANDATORY RULES

- NEVER ask for branch again (already selected in routing)
- CRITICAL: Read complete file before action
- YOU ARE A FACILITATOR
- Story/Card OPTIONAL para bugs
- Foco: "O bug está realmente corrigido?"

## SEQUENCE

### 1. Recuperar Informações do PR Selecionado

**A branch já foi selecionada e detectada como bug no step-01-init-routing.**

```bash
# Branch atual deve ser a selecionada
SELECTED_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Buscar informações do PR
gh pr view ${SELECTED_BRANCH} --json number,title,state,author,body
```

Extrair:

- `PR_NUMBER`
- `PR_TITLE`
- `PR_STATE`
- `PR_AUTHOR`
- `PR_BODY` (descrição do bug)

Exibir confirmação:

```
🐛 Bug Fix Review - PR Selecionado:
   Branch: ${SELECTED_BRANCH}
   PR: #${PR_NUMBER} - ${PR_TITLE}
   Status: ${PR_STATE}
```

### 2. Exibir Descrição do Bug

Mostrar descrição do PR:

```
📋 Descrição do Bug:
${PR_BODY}
```

### 3. Confirmar Desenvolvedor

### 3. Confirmar Desenvolvedor

```bash
DEVELOPER=$(gh pr view --json author --jq '.author.login')
```

Perguntar: "Desenvolvedor responsável: **${DEVELOPER}**. Correto? [S/N]"

- Se **N**: "Digite o nome correto do desenvolvedor:"
    - Ler input do usuário
    - Atualizar `DEVELOPER`

### 4. Detectar Reviewer

### 4. Detectar Reviewer

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

### 5. Avaliar Severidade do Bug

### 5. Avaliar Severidade do Bug

Perguntar:

```
🔴 CRITICAL - Crash, data loss, security
🟠 HIGH     - Feature não funciona
🟡 MEDIUM   - Workaround existente
🟢 LOW      - Cosmético

Qual a severidade deste bug? [CRITICAL/HIGH/MEDIUM/LOW]:
```

Ler input do usuário e validar que é uma das opções válidas.

### 6. Card/Story Opcional

### 6. Card/Story Opcional

Tentar extrair da branch:

```bash
CARD_FROM_BRANCH=$(echo "${SELECTED_BRANCH}" | grep -oE 'NPCV-[0-9]+' | head -1)
```

**Se encontrado:** Perguntar: "Card detectado: **${CARD_FROM_BRANCH}**. Correto?
[S/N/Branco]"

- Se **S**: Usar `CARD_FROM_BRANCH`
- Se **N**: "Digite o Card correto ou deixe em branco:"
- Se **Branco**: Usar `BUG-${SELECTED_BRANCH}` como identificador

**Se NÃO encontrado:** Perguntar: "Card/Ticket associado ao bug? (Ex: NPCV-538
ou deixe em branco):"

- Se fornecido: Usar como `CARD`
- Se branco: Usar `BUG-${SELECTED_BRANCH}` como identificador

### 7. Criar Sidecar

### 7. Criar Sidecar

Criar arquivo de estado:

```json
{
  "is_bug_review": true,
  "bug_severity": "${SEVERITY}",
  "branch": "${SELECTED_BRANCH}",
  "pr_number": ${PR_NUMBER},
  "pr_title": "${PR_TITLE}",
  "card": "${CARD}",
  "desenvolvedor": "${DEVELOPER}",
  "reviewer": "${REVIEWER}",
  "selected_at_routing": true,
  "current_step": "02a-bug",
  "skip_functional_review": true,
  "skip_ac_validation": true,
  "lightweight_test_validation": true,
  "files_reviewed": [],
  "observations": {}
}
```

Save to: `{sidecarFile}`

**Confirmação:**

```
✅ Arquivo de estado criado: docs/code-reviews/.code-review-state.json
```

### 8. Summary & Confirm

### 8. Summary & Confirm

Exibir resumo completo:

```
✅ Confirmação Final - Bug Review

╔════════════════════════════════════════════╗
║  Campo           │  Valor                  ║
╠════════════════════════════════════════════╣
║  Branch          │  ${SELECTED_BRANCH}     ║
║  PR              │  #${PR_NUMBER}          ║
║  Título          │  ${PR_TITLE}            ║
║  🐛 Severidade   │  ${SEVERITY}            ║
║  Desenvolvedor   │  ${DEVELOPER}           ║
║  Reviewer        │  ${REVIEWER}            ║
║  Card/Ticket     │  ${CARD}                ║
╚════════════════════════════════════════════╝

Otimizações Aplicadas:
- ⏭️ Story/AC: Pulado
- ⏭️ Análise Funcional: Pulada
- ⚡ Testes: Validação leve

Todas as informações estão corretas? [S/N]
```

**Se N:**

- Perguntar: "Qual campo deseja corrigir?
  [Severidade/Dev/Reviewer/Card/Cancelar]"
- Retornar à seção específica para correção
- Re-exibir summary após correção

**Se S:**

- Prosseguir para análise de mudanças

### 9. Proceed to Analysis

Display:

```
✅ Informações confirmadas!

[C] Continue para análise de mudanças (skip story collection)
```

**Menu Handling:**

- **IF C**: Update sidecar, then load, read entire file, and execute
  `{nextStepFile}` (step-03-analyze-changes.md)
- **Else**: Help user respond, then redisplay menu

**IMPORTANTE:** Pulamos o step-02b-collect-story.md pois bugs não requerem
validação de ACs.

---

## SUCCESS METRICS

✅ PR information retrieved from already-selected branch ✅ Developer confirmed
or corrected ✅ Reviewer confirmed or corrected ✅ Bug severity assessed ✅ Card
extracted or optional identifier used ✅ Sidecar created with bug review flags
✅ Ready to skip to code analysis ✅ NO duplicate branch selection (already done
in routing)

## BUG REVIEW BEST PRACTICES

1. **Focus**: "Is the bug fixed?"
2. **Speed**: Minimal info collection (2-3 min)
3. **Severity**: Always assess impact
4. **Simplicity**: Usually 1-5 files changed
5. **Decision**: Approve quickly if fix is good

## NOTES

**IMPORTANT CHANGES from previous version:**

- ❌ **REMOVED**: "Ask for branch" (now done in step-01-init-routing)
- ❌ **REMOVED**: "Verify PR exists" (now done in step-01-init-routing)
- ❌ **REMOVED**: "Extract bug description separately" (now in step 1)
- ✅ **ADDED**: Context awareness that branch was already selected
- ✅ **ADDED**: `selected_at_routing: true` flag in sidecar
- ✅ **ADDED**: Skip to step-03 instead of step-02b
