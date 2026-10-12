---
name: 'step-06a-update-csvs'
description: 'Roteamento para report (CSVs desativados)'

# File References
nextStepFile: './step-06b-generate-report.md'
reReviewPath: './step-06-re-review-report.md'
bugReportPath: './step-06-bug-report.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 6a: Roteamento → Report

## ⚠️ CRITICAL: BUG & RE-REVIEW

**Verificar tipo de review antes:**

Se `IS_RE_REVIEW = true`, load `{reReviewPath}`. Se `IS_BUG_REVIEW = true`, load
`{bugReportPath}`.

---

## STEP GOAL:

Rotear para o step correto. As planilhas CSV **não são mais preenchidas**.

## SEQUENCE:

### 1. Verificar tipo de review

Ler `{sidecarFile}` e checar os flags:

- `is_re_review = true` → load `{reReviewPath}` e encerrar este step
- `is_bug_review = true` → load `{bugReportPath}` e encerrar este step

### 2. Atualizar Sidecar

```json
{
    "csv_updates": "skipped",
    "current_step": 6
}
```

### 3. Continuar

Load `{nextStepFile}` imediatamente, sem exibir menu.
