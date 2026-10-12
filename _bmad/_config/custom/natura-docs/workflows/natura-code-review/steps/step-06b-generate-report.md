---
name: 'step-06b-generate-report'
description: 'Gerar relatório Markdown consolidado do code review'

# File References
nextStepFile: './step-07a-present-summary.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
reportTemplate: '../templates/review-report-template.md'
---

# Step 6b: Geração de Relatório Markdown

## STEP GOAL:

Gerar o relatório Markdown completo consolidando todos os dados coletados.

## MANDATORY EXECUTION RULES:

- NEVER modify files without proper data
- CRITICAL: Read complete step file before action
- YOU ARE A FACILITATOR, not a content generator
- Use template structure provided

## REPORT GENERATION SEQUENCE:

### 1. Load Data & Template

Ler:

- `{sidecarFile}` para dados coletados
- `{reportTemplate}` para estrutura

### 2. Create Report File

**Output:** `{project-root}/docs/code-reviews/{card}--code-review.md`

### 3. Generate Report Sections

Use template and populate with actual data:

**Section 1: Informações Gerais**

- Branch, PR number, Developer, Date, Status

**Section 2: Resumo Executivo**

- Overview paragraph
- Statistics (files, approved, concerns, coverage%)

**Section 3: Aderência à História (se story_available)**

- AC mapping table
- Implementation summary

**Section 4: Arquivos Revisados**

- Apex Classes table
- LWC Components table
- Other Components table

**Section 5: Análise de Testes**

- Test execution table
- Summary (executed, passing, no-test classes)

**Section 6: Qualidades Identificadas**

- List of positive findings

**Section 7: Pontos de Atenção**

- Critical issues (blocking)
- Important issues (recommend fix)
- Suggestions (optional improvements)

**Section 8: Decisão**

- Status: Pendente (to be defined in next step)

**Footer:**

- Auto-generated notice with generation date

### 4. Save Report

Escrever arquivo em: `{project-root}/docs/code-reviews/{card}--code-review.md`

### 5. Update Sidecar

```json
{
    "report_generated": true,
    "report_path": "docs/code-reviews/{card}--code-review.md",
    "current_step": 6
}
```

### 6. Completion Message

```
📄 Relatório gerado com sucesso!

Arquivo: docs/code-reviews/{card}--code-review.md
Seções: 8 (Geral, Resumo, História, Arquivos, Testes, Qualidades, Atenção, Decisão)

Prosseguindo para apresentação...
```

### 7. Present Menu

Display: **Relatório gerado!** `[C]` Continue

#### Menu Handling Logic:

- IF C: Update sidecar `current_step: 7a`, load `{nextStepFile}`
- Else: Redisplay menu

---

## SUCCESS METRICS

- Report created with all sections
- Data correctly populated
- Markdown formatting valid
- File saved successfully
- Sidecar updated
- User confirmed continuation
