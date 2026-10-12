---
name: 'step-06-re-review-report'
description:
    'Gerar relatório atualizado consolidando achados anteriores + novos'

# File References
nextStepFile: './step-07a-present-summary.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 6 (Re-Review): Consolidar Relatório Atualizado

## STEP GOAL:

Para re-reviews, gerar um relatório ATUALIZADO que:

1. Preserva e marca o status dos problemas anteriores (FIXED / STILL PRESENT)
2. Adiciona novos problemas encontrados nesta review
3. Documenta regressões (problemas que voltaram)
4. Compara estado antes vs depois da correção

## RE-REVIEW REPORT STRUCTURE

Diferente do relatório normal, um relatório de re-review deve incluir:

```markdown
# Code Review Re-Analysis: {CARD}

## Review Information

- Original Review: {date}
- Original Reviewer: {name}
- Re-Review Date: {today}
- Re-Reviewer: {current_reviewer}

## Previous Findings Status

### Problemas Anteriores - STATUS FINAL

| Problema       | Severity | Anterior   | Atual      | Status      |
| -------------- | -------- | ---------- | ---------- | ----------- |
| Unused import  | LOW      | ❌ Present | ✅ Fixed   | FIXED ✓     |
| Coverage < 80% | CRITICAL | ❌ Present | ⚠️ Now 78% | IN PROGRESS |
| Missing test   | HIGH     | ❌ Present | ✅ Added   | FIXED ✓     |

### Problemas Corrigidos: 2/3 (66%)

- ✅ Unused imports removidos
- ✅ Novos testes adicionados
- ⚠️ Cobertura ainda abaixo de 80%

## Novos Problemas Encontrados (Re-Review)

🆕 ClassA.cls: Missing @Override (linha 42) 🆕 LwcComponent.js: Hardcoded
strings (5 instâncias) 🆕 ClassB.cls: Comentário óbvio removido, mas coverage
ainda baixa

## Regressões Detectadas

❌ Cobertura de testes regrediu de 78% → 76% Análise: Novo teste remoto foi
adicionado mas removido outro

## Validação de Acceptance Criteria

| AC  | Status                                       |
| --- | -------------------------------------------- |
| AC1 | ✅ OK - Não alterado                         |
| AC2 | ⏳ PARTIAL - Alterado, requer nova validação |
| AC3 | ✅ OK - Novas testes cobrem                  |
```

## MANDATORY EXECUTION RULES:

### Universal Rules:

- CRITICAL: Preserve ALL previous findings
- CRITICAL: Mark status of each previous issue clearly
- CRITICAL: Distinguish new findings from previous
- CRITICAL: Document all regressions
- YOU ARE A REPORTER, not a finisher

### Re-Review Specific Rules:

- Compare previous vs current state for each issue
- Use consistent status markers: FIXED / STILL PRESENT / REGRESSION
- Tag new findings with "🆕 RE-REVIEW"
- Summarize progress percentage
- Highlight remaining blockers

## REPORT GENERATION SEQUENCE:

### 1. Carregar Contexto da Re-Review

From sidecar:

```bash
PREVIOUS_FINDINGS=$(jq '.previous_review.technical_issues +
                        .previous_review.functional_issues' \
  docs/code-reviews/.code-review-state.json)

PREVIOUS_COVERAGE=$(jq '.previous_review.test_coverage_percentage' \
  docs/code-reviews/.code-review-state.json)

CURRENT_FINDINGS=$(jq '.technical_issues + .functional_issues' \
  docs/code-reviews/.code-review-state.json)

CURRENT_COVERAGE=$(jq '.test_coverage_percentage' \
  docs/code-reviews/.code-review-state.json)
```

### 2. Analisar Status de Cada Problema Anterior

Para cada problema anterior:

```bash
for ISSUE in $(echo "${PREVIOUS_FINDINGS}" | jq -r '.[] | @base64'); do
  _jq() {
    echo ${ISSUE} | base64 --decode | jq -r ${1}
  }

  ISSUE_ID=$(_jq '.id')
  ISSUE_DESC=$(_jq '.description')
  ISSUE_FILE=$(_jq '.file')

  # Check if issue still exists in current findings
  if grep -q "${ISSUE_DESC}" current_findings.json; then
    STATUS="STILL PRESENT"
    MARKER="❌"
  else
    STATUS="FIXED"
    MARKER="✅"
  fi

  # Store for report
  echo "${MARKER} ${ISSUE_DESC} → ${STATUS}"
done
```

### 3. Criar Tabela de Status dos Problemas

```
## Validação de Correções

| # | Problema | Severity | Anterior | Atual | Status |
|----|----------|----------|----------|-------|--------|
| 1 | Unused imports | LOW | ❌ 3 imports | ✅ 0 imports | FIXED ✓ |
| 2 | Coverage < 80% | CRITICAL | ❌ 65% | ⚠️ 78% | IN PROGRESS |
| 3 | Missing @Override | MEDIUM | ❌ 2 methods | ✅ 0 methods | FIXED ✓ |
| 4 | Hardcoded strings | LOW | ✅ 0 | 🆕 5 instances | NEW ISSUE |

### Resumo de Progresso
- ✅ Problemas Corrigidos: 2/3 (66%)
- ⚠️ Parcialmente Resolvidos: 1/3 (33%)
- 🆕 Novos Problemas: 1
- ❌ Regressões: 1
```

### 4. Detectar e Documentar Regressões

```bash
# Check for metrics regressions
PREV_COV="${PREVIOUS_COVERAGE}"
CURR_COV="${CURRENT_COVERAGE}"

if [ "${CURR_COV}" -lt "${PREV_COV}" ]; then
  REGRESSION_RATE=$(echo "scale=2; ${PREV_COV} - ${CURR_COV}" | bc)
  echo "❌ REGRESSION: Coverage decreased from ${PREV_COV}% to ${CURR_COV}% (${REGRESSION_RATE}%)"
fi

# Check for reappearing issues
for FIXED_ISSUE in $(echo "${FIXED_ISSUES}"); do
  if grep -q "${FIXED_ISSUE}" current_findings.json; then
    echo "❌ REGRESSION: Issue '${FIXED_ISSUE}' reappeared"
  fi
done
```

### 5. Listar Novos Problemas Encontrados

```
## Novos Problemas Encontrados nesta Re-Review

### ClassA.cls
🆕 NEW: Missing @Override annotation (linha 42)
   Severity: MEDIUM
   File changed: SIM (código modificado nesta re-review)

### LwcComponent.js
🆕 NEW: Hardcoded API endpoint (linha 28)
   Severity: HIGH
   File type: Novo arquivo
   Impact: Requires fix

### ClassB.cls
🆕 NEW: Regression in coverage (78% → 76%)
   Severity: CRITICAL
   Reason: New test removed, but wasn't replaced
   Action: Requires immediate fix
```

### 6. Gerar Markdown Consolidado

Create final report file: `docs/code-reviews/{CARD}--code-review-re-review.md`

```markdown
# Code Review - Re-Analysis: {CARD}

## Overview

| Campo           | Revisão 1       | Re-Review          |
| --------------- | --------------- | ------------------ |
| Revisor         | {prev_reviewer} | {current_reviewer} |
| Data            | {prev_date}     | {today}            |
| Decisão         | REPROVADO       | ⏳ PENDENTE        |
| Análise Inicial | Completa        | Delta Analysis     |

---

## Status das Correções Solicitadas

### Problemas Anteriores vs Atuais

[Table showing all previous issues with FIXED/STILL PRESENT status]

### Progresso Alcançado: X/Y problemas corrigidos (Z%)

---

## Novos Problemas Encontrados

[List of new issues found in re-review, marked with 🆕]

---

## Regressões

[Any metrics or issues that went backwards]

---

## Decisão Recomendada

Com base na validação de correções:

- Todos os problemas críticos foram corrigidos → **APROVAR**
- Alguns problemas permanecem → **SOLICITAR MUDANÇAS**
- Novos problemas críticos encontrados → **REPROVAR**
- Regressão significativa → **REPROVAR**
```

### 7. Atualizar Sidecar com Status Final

```json
{
  ...existing,
  "current_step": "06-re-review",
  "re_review_report": {
    "timestamp": "2025-02-04T15:30:00Z",
    "previous_issues_total": 3,
    "previous_issues_fixed": 2,
    "previous_issues_remaining": 1,
    "fix_rate_percentage": 66.7,
    "new_issues_count": 1,
    "regressions": ["coverage"],
    "recommendation": "REQUEST CHANGES",
    "justification": "2/3 problemas corrigidos, mas 1 regress descoberta"
  }
}
```

### 8. Apresentar Relatório para User

```
## Re-Review Report Gerado

📊 Resumo de Correções:

Problemas Anteriores: 3
- ✅ Corrigidos: 2
- ⏳ Pendentes: 1
Taxa de Sucesso: 66%

🆕 Novos Problemas: 1
❌ Regressões: 1

📄 Relatório: docs/code-reviews/{CARD}--code-review-re-review.md

Próxima etapa: Decisão final baseada nas correções + novos achados.
```

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- All previous issues compared vs current state
- Status of each issue clearly marked
- New issues distinctly identified
- Regressions detected and documented
- Fix rate calculated accurately
- Report preserves full audit trail

### SYSTEM FAILURE:

- Losing track of original issues
- Not comparing previous vs current
- Merging old/new findings without distinction
- Missing regressions
- Incomplete status tracking
- Report doesn't show progress

**Master Rule:** Every finding must include: Where it came from, its current
status, and when it changes.

## RE-REVIEW REPORT BEST PRACTICES

1. **Traceability:** Each issue has: ID, original finding, current status
2. **Metrics:** Track fix rate, regression rate, new issue count
3. **Clarity:** FIXED / STILL PRESENT / REGRESSION markers consistent
4. **Completeness:** All findings from both reviews included
5. **Recommendation:** Clear next action based on changes
