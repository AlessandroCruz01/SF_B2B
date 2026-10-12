---
name: 'step-04b-functional-summary'
description: 'Validar cobertura de ACs e gerar resumo funcional consolidado'

# File References
nextStepFile: './step-05a-test-execution.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 4B.1: Functional Summary & AC Validation

## STEP GOAL:

Consolidar resultados da análise funcional, validar cobertura de Acceptance
Criteria e gerar resumo de discrepâncias antes de análise de testes.

---

## ACCEPTANCE CRITERIA VALIDATION:

### 1. Load File Review Results

Do sidecar carregar resultados de cada arquivo:

```
## Acceptance Criteria Validation

Resumo consolidado de implementação dos ACs...

| AC | Descrição | Status | Implementado em |
|----|-----------|--------|-----------------|
| AC-1 | {desc} | ✅/❌ | {arquivos} |
| AC-2 | {desc} | ✅/❌ | {arquivos} |
| AC-N | {desc} | ✅/❌ | {arquivos} |
```

### 2. AC Discrepancy Report

#### 2.1 Critical ACs Not Implemented

**🔴 Critical ACs (Não Implementados)**

ACs que bloqueiam a funcionalidade:

| AC   | Descrição | Motivo   | Severity    |
| ---- | --------- | -------- | ----------- |
| AC-N | {descr}   | {motivo} | 🔴 CRITICAL |

⚠️ {count} AC(s) crítico(s) não implementado(s).

**Ação requerida:** Implementar antes do merge.

#### 2.2 Partial ACs

**🟡 Partial ACs (Incomplete)**

ACs implementadas parcialmente:

| AC   | Descrição | Implementado | Faltando    | Severity  |
| ---- | --------- | ------------ | ----------- | --------- |
| AC-M | {descr}   | Feature A    | Edge case B | 🟡 MEDIUM |

⚠️ {count} AC(s) implementado(s) parcialmente.

**Ação requerida:** Completar ou documentar limitação.

### 3. Unplanned Code Assessment

**Código não previsto na história:**

| Arquivo    | Funcionalidade | Justificativa | Recomendação                            |
| ---------- | -------------- | ------------- | --------------------------------------- |
| ClassA.cls | {func}         | {razão}       | 🟢 Aceitar / 🟡 Documentar / 🔴 Remover |

**Impacto Geral:**

- 🟢 **Sem impacto**: Funcionalidade adicional útil
- 🟡 **Médio**: Requer documentação
- 🔴 **Alto**: Pode afetar escopo

---

## FUNCTIONAL REVIEW SUMMARY:

### 1. Metrics

```
## Functional Review Summary

| Métrica | Valor | Status |
|---------|-------|--------|
| Total de ACs | {total} | 📊 |
| Implementados | {implemented} | ✅ |
| Parcialmente | {partial} | 🟡 |
| Não Implementados | {not_implemented} | 🔴 |
| Código não previsto | {unplanned} | ℹ️ |
```

### 2. Quality Assessment

**Overall Status:**

- 🟢 ✅ **Pronto**: Todos ACs implementados + unplanned code aceito
- 🟡 **Requer Clareza**: Alguns ACs parciais + documentação
- 🔴 ❌ **Não Atende**: ACs críticos não implementados

**Decision Gate:**

- Se críticos > 0: **BLOCK** até implementação
- Se médios > 2: **REQUEST CHANGES** com detalhes
- Se tudo 🟢: **PROCEED** para teste

### 3. Update Sidecar

Registrar consolidação:

```json
{
  "functional_review_complete": true,
  "ac_coverage": {
    "total": {N},
    "implemented": {N},
    "partial": {N},
    "not_implemented": {N}
  },
  "functional_status": "pass|concerns|block"
}
```

---

## PROCEED TO TEST ANALYSIS:

Display:

```
Functional review concluído!

Status: {✅ OK | ⚠️ Concerns | ❌ Block}

Prosseguindo para análise de testes...
```

- Atualizar sidecar `current_step: 5a`
- Carregar `{nextStepFile}`

---

## SUCCESS METRICS

- AC coverage consolidated
- Discrepancies clearly documented
- Unplanned code assessed
- Decision gate applied correctly
- Sidecar updated with final status
- Ready for test analysis
