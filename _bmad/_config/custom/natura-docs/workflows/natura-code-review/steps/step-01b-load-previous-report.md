---
name: 'step-01b-load-previous-report'
description: 'Carregar relatório anterior para re-review'

# File References
nextStepFile: './step-03-re-review-diff-analysis.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 1B: Carregar Relatório Anterior (Re-Review)

## STEP GOAL:

Carregar relatório do code review anterior e preparar workflow otimizado para
validar apenas mudanças e correções.

## CRITICAL: RE-REVIEW vs NORMAL

| Aspecto         | Normal       | Re-Review          |
| --------------- | ------------ | ------------------ |
| Coleta de PR    | ✅ Completa  | ⏭️ Do relatório    |
| Coleta de story | ✅ Completa  | ⏭️ Do relatório    |
| Análise         | ✅ Todos     | ⏳ Apenas mudanças |
| Testes          | ✅ Cobertura | ⏳ Novos testes    |
| Auto-fix        | ✅ Todos     | ⏳ Alterados       |

## MANDATORY RULES:

- NEVER modify previous findings without documentation
- CRITICAL: Preserve all previous data
- Mark new findings with "RE-REVIEW" tag
- Clearly mark fixes vs unresolved issues

## LOAD SEQUENCE:

### 1. Locate Previous Report

**IMPORTANTE:** Usar a branch SELECIONADA pelo usuário no routing, não a branch
atual do git.

```bash
# Usar branch selecionada (propagada do step-01-init-routing)
BRANCH="${SELECTED_BRANCH}"

# Extract card number from branch
# Exemplos: feature/NPCV-123, bugfix/NPCV-456
CARD=$(echo "${BRANCH}" | grep -oE 'NPCV-[0-9]+' | head -1)

if [ -z "${CARD}" ]; then
  CARD=$(git log -1 --pretty=%B | grep -oE 'NPCV-[0-9]+' | head -1)
fi

REPORT_FILE="docs/code-reviews/${CARD}--code-review.md"

if [ ! -f "${REPORT_FILE}" ]; then
  echo "❌ ERROR: Previous report not found: ${REPORT_FILE}"
  exit 1
fi
```

Display:

```
## Re-Review Initialization

Card: ${CARD}
Previous Report: ${REPORT_FILE}
✅ Relatório localizado

Carregando achados anteriores...
```

### 2. Extract Previous Data

Parse report to extract:

- PR Number, Branch, Developer, Story Card
- Previous findings (technical, functional)
- Test coverage from previous run
- Previous decision and justification

### 3. Create Sidecar

```json
{
  "is_re_review": true,
  "pr_number": "${REPORT_PR_NUM}",
  "pr_branch": "${REPORT_BRANCH}",
  "story_card": "${REPORT_STORY}",
  "previous_review": {
    "decision": "reprovado|com ressalvas",
    "reviewer": "${PREVIOUS_REVIEWER}",
    "timestamp": "${PREVIOUS_TIME}",
    "technical_issues": [...],
    "functional_issues": [...],
    "test_coverage": ${REPORT_COVERAGE}
  },
  "current_review": {
    "focused_validation": true,
    "changed_files_only": true
  },
  "current_step": "01b"
}
```

### 4. Validate Critical Data

Verificar que todos os dados foram carregados:

```bash
REQUIRED=("pr_number" "story_card" "pr_branch" "previous_review")

for FIELD in "${REQUIRED[@]}"; do
  if ! jq -e ".${FIELD}" docs/code-reviews/.code-review-state.json > /dev/null; then
    echo "❌ VALIDATION FAILED: Missing field: ${FIELD}"
    exit 1
  fi
done

echo "✅ Sidecar validated"
```

### 5. Display Previous Findings

```
## Re-Review: Análise de Correções

**PR:** #${PR_NUMBER}
**Card:** ${STORY_CARD}
**Revisão anterior:** ${PREVIOUS_TIME} (${PREVIOUS_REVIEWER})

### Problemas Anteriores

#### Críticos
- {lista de problemas críticos}

#### Avisos
- {lista de avisos}

Vamos validar se foram corrigidos...
```

### 6. Confirm & Continue

Menu: `[C]` Continuar `[E]` Editar `[R]` Novo review `[X]` Cancelar

- **[C]**: Prosseguir para análise de mudanças
- **[E]**: Editor para ajustar dados
- **[R]**: Voltar para novo review completo
- **[X]**: Cancelar

### 7. Load Next Step

Update sidecar `current_step: 03` and load: `{nextStepFile}`

---

## SUCCESS METRICS

- Previous report located and validated
- Critical data extracted correctly
- Sidecar created with previous + new context
- User confirmed re-review start
- Data preservation verified
