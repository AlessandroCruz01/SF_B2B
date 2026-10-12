---
name: 'step-05b-test-analysis'
description: 'Analisar qualidade dos testes e validar mocks apropriados'
nextStepFile: './step-05c-auto-fix-opportunities.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 5B: Test Quality Analysis

## STEP GOAL

Analisar qualidade dos testes, validar mocks apropriados, identificar queries
desnecessárias.

## MANDATORY RULES

- NEVER generate without analyzing test code
- CRITICAL: Read test code to assess mock usage
- YOU ARE A QUALITY GATE

## PRE-STEP CHECK

Read sidecar `tests_skipped` field:

**If `tests_skipped: true`:**

```
ℹ️ Testes não executados (SF CLI indisponível).
Análise pulada.

Prosseguindo para geração de outputs...
```

**If `tests_skipped: false`:** Continue with analysis.

---

## TEST QUALITY ANALYSIS

### 1. Load Test Results from Sidecar

Display:

```
## Test Quality Analysis

Total: {total_tests} tests
Passing: {passing} ✅
Failing: {failing} ❌
Coverage: {avg_coverage}%
```

### 2. Analyze Mock Patterns

**Good indicators:**

- `Test.setMock()` or `HttpCalloutMock`
- `*Mock.cls` or `*Factory.cls` classes
- `Test.startTest()/stopTest()` with inline data
- `@TestVisible` for dependency injection

**Red flags (⚠️):**

- `[SELECT ...]` outside setup
- `Database.query()` in test
- Mocking-able objects not mocked
- No data isolation

### 3. Review Each Test File

For each test class:

```
## {TestClassName}

Coverage: {coverage}%
Type: {mockado|integrado}
Time: {ms}ms

### Mock Pattern Assessment
- Setup: ✅ Mocks | ⚠️ Hybrid | ❌ Real queries
- Factories: ✅ Sim | ❌ Não
- Isolation: ✅ Sim | ❌ Não

Unnecessary queries: {count or "Nenhuma"}
```

### 4. Critical Rejection Rules

🚨 **MUST FAIL:**

- SELECT on custom objects without necessity
- External API calls without HttpCalloutMock
- Dependencies on existing org data

### 5. Failing Tests Analysis

If failing tests exist:

```
| Teste | Motivo | Ação |
|-------|--------|------|
| ClassTest::method | Assert/Exception | Fix required |

{count} tests must be fixed before merge.
```

### 6. Coverage Quality

```
| Métrica | Valor |
|---------|-------|
| Avg Coverage | {avg}% |
| Classes <75% | {count} |
| Classes 100% | {count} |

Quality: {PASS|REVIEW|FAIL}
```

### 7. Test Quality Summary

```
| Métrica | Valor |
|---------|-------|
| Mocks adequate | {count} |
| Unnecessary queries | {count} |
| Rejected tests | {count} |

Recommendations:
1. {rec1}
2. {rec2}
3. {rec3}
```

### 8. Update Sidecar

```json
{
  "current_step": "5b",
  "test_quality": {
    "mocks_adequate": {count},
    "unnecessary_queries": {count},
    "rejected_tests": {count},
    "overall_status": "pass|review_needed|fail"
  }
}
```

### 9. Proceed

Display: "Test analysis concluído. Prosseguindo..."

Update sidecar `current_step: 6` and load `{nextStepFile}`.

---

## SUCCESS METRICS

✓ Test status checked ✓ Mock patterns analyzed ✓ Queries identified ✓ Critical
rules applied ✓ Failing tests documented ✓ Coverage validated ✓ Sidecar updated

## CRITICAL NOTE

ONLY after complete analysis and documentation, proceed to `{nextStepFile}` for
output generation.
