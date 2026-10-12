---
name: 'step-06-bug-report'
description: 'Gerar relatório simplificado para bug review'

# File References
nextStepFile: './step-07a-present-summary.md'
normalReportPath: './step-06b-generate-report.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 6 (Bug Review): Relatório Simplificado

## 🐛 BUG REPORT - LIGHTWEIGHT

Para bug reviews, o relatório é muito mais simples:

- ✅ **O que era o bug?** (5 linhas max)
- ✅ **Como foi corrigido?** (5 linhas max)
- ✅ **Testes adicionados?** (SIM/NÃO)
- ✅ **Decisão** (APROVADO / SOLICITADO MUDANÇAS / REPROVADO)

**Sem CSVs, sem métricas extensas, sem documentação pesada.**

## STEP GOAL:

Gerar um relatório markdown SIMPLES do bug review com apenas o essencial:
localização do bug, fix aplicado, testes, e decisão final.

## MANDATORY EXECUTION RULES:

### Universal Rules:

- CRITICAL: Keep report short and simple
- CRITICAL: Focus on: "Was the bug fixed?"
- YOU ARE A REPORTER, not a documenter

### Bug-Specific Rules:

- SEM CSVs (bug fixes não aparecem em "releases")
- SEM métricas de cobertura
- SEM análise de AC (não há ACs para bugs)
- SEM seção de "componentes funcionais"
- SIM: Descrição do bug + fix + testes + decisão

## BUG REPORT GENERATION:

### 1. Carregar Contexto do Bug

From sidecar:

```bash
BUG_TITLE=$(jq -r '.pr_title' docs/code-reviews/.code-review-state.json)
BUG_SEVERITY=$(jq -r '.bug_context.severity' docs/code-reviews/.code-review-state.json)
PR_NUMBER=$(jq -r '.pr_number' docs/code-reviews/.code-review-state.json)
DEVELOPER=$(jq -r '.developer' docs/code-reviews/.code-review-state.json)
REVIEWER=$(jq -r '.reviewer' docs/code-reviews/.code-review-state.json)
FILES_CHANGED=$(jq -r '.files_reviewed[]' docs/code-reviews/.code-review-state.json)

TESTS_ADDED=$(jq -r '.bug_validation.tests_added' docs/code-reviews/.code-review-state.json)
FIX_STATUS=$(jq -r '.bug_validation.fix_status' docs/code-reviews/.code-review-state.json)
```

### 2. Criar Estrutura do Relatório

```markdown
# Bug Fix Review: {BUG_TITLE}

**PR:** #{PR_NUMBER}  
**Severidade:** 🔴 CRITICAL | 🟠 HIGH | 🟡 MEDIUM | 🟢 LOW  
**Desenvolvedor:** {DEVELOPER}  
**Revisor:** {REVIEWER}  
**Data:** {today}

---

## O Que Era o Bug

{Brief description, 2-3 linhas max}

### Impacto

- Severidade: {BUG_SEVERITY}
- Afetava: {feature/component}
- Usuários impactados: {data}

---

## Como Foi Corrigido

### Arquivos Modificados

{CHANGED_FILES com diff excerpt}

### A Correção

{2-3 linhas explicando o fix, não o código inteiro}
```

### 3. Listar Testes

```markdown
## Testes

| Teste           | Status   | Valida Fix? |
| --------------- | -------- | ----------- |
| testBugScenario | ✅ Added | ✅ Yes      |
| testRegression  | ✅ Added | ✅ Prevents |

Testes adicionados para prevenir regressão: ✅ YES
```

### 4. Análise Técnica Resumida

```markdown
## Análise Técnica (Resumida)

### Código Modificado

- ClassA.cls: 1 método alterado (15 linhas)
- ClassB.cls: 2 métodos alterados (20 linhas)

### Riscos

- Risco de regressão: LOW
- Dependências externas: NONE
- Performance impact: NONE
```

### 5. Decisão

```markdown
## Decisão do Review

| Critério                       | Status                       |
| ------------------------------ | ---------------------------- |
| Bug identificado e localizado? | ✅ YES                       |
| Correção completa e válida?    | ✅ YES / ⚠️ PARTIAL / ❌ NO  |
| Testes adicionados?            | ✅ YES / ⚠️ MINIMAL / ❌ NO  |
| Risco de regressão baixo?      | ✅ YES / ⚠️ MEDIUM / ❌ HIGH |

**Recomendação:** APROVAR / SOLICITAR MUDANÇAS / REJEITAR

**Justificativa:** {1-2 frases explicando a decisão}
```

### 6. Template Completo de Relatório

Create file: `docs/code-reviews/BUG-{BRANCH}--review.md`

```markdown
# Bug Fix Review: {BUG_TITLE}

**PR:** #{PR_NUMBER} **Severidade:** {BUG_SEVERITY} **Desenvolvedor:**
{DEVELOPER} **Revisor:** {REVIEWER} **Data:** {today}

---

## O Que Era o Bug

{Simple description}

## Como Foi Corrigido

Arquivos: {files}

## Testes

✅ Testes adicionados: {count}

## Decisão

**Status:** APROVADO | COM RESSALVAS | REPROVADO

{reason}
```

### 7. Atualizar Sidecar

```json
{
  ...existing,
  "current_step": "06-bug",
  "bug_report_generated": true,
  "bug_report_file": "docs/code-reviews/BUG-{branch}--review.md",
  "bugs_decision": "APPROVE|REQUEST CHANGES|REJECT"
}
```

### 8. Apresentar para User

```
## Bug Review Report Gerado

📄 Relatório: docs/code-reviews/BUG-{BRANCH}--review.md

Resumo:
- Bug: {TITLE}
- Severidade: {SEVERITY}
- Status: {FIX_VALIDATED}
- Testes: {TESTS_COUNT}

Próxima etapa: Decisão final
```

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- Bug clearly described
- Fix validated
- Tests added or noted
- Report is concise (< 50 lines)
- User ready for decision

### SYSTEM FAILURE:

- Lengthy report
- Missing bug description
- No validation of fix
- Complex format for simple bug
- CSV updates attempted

**Master Rule:** Bug reports are simple: 1 page, max.

## BUG REPORT BEST PRACTICES

1. **Simplicity**: One-page reports for bugs
2. **Clarity**: Everyone understands the bug
3. **Speed**: 5-minute max to generate
4. **Focus**: Fix, tests, decision - nothing else
5. **Format**: Markdown simple (no fancy tables)
