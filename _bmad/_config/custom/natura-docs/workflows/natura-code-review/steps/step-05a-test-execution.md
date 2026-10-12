---
name: 'step-05a-test-execution'
description: 'Executar testes Apex e coletar métricas de cobertura'

# File References
nextStepFile: './step-05b-test-analysis.md'
bugTestPath: './step-05-bug-test-validation.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 5A: Test Execution

## ⚠️ CRITICAL: BUG REVIEW DETECTION

```bash
IS_BUG_REVIEW=$(jq -r '.is_bug_review // false' docs/code-reviews/.code-review-state.json)

if [ "${IS_BUG_REVIEW}" = "true" ]; then
  echo "ℹ️ Bug review detectado!"
  echo "   Executando validação lightweight..."
  load_step '{bugTestPath}'
  exit 0
fi
```

If `IS_BUG_REVIEW = true`, skip to `{bugTestPath}`.

---

## STEP GOAL:

Executar testes Apex e coletar métricas de cobertura e tempo de execução.

## MANDATORY RULES:

- NEVER generate without completing test execution
- CRITICAL: Check SF CLI availability first
- Skip if `sf_available: false`
- Run tests synchronously

## SEQUENCE:

### 1. Check SF CLI Availability

Read sidecar for `sf_available`:

**If `sf_available: false`:**

```
⚠️ Salesforce CLI não está conectado

Testes serão pulados. Para incluir cobertura:
1. Execute: sf org login web
2. Reinicie o workflow

Pulando para próximo passo...
```

- Update sidecar `tests_skipped: true`
- Load `{nextStepFile}`

**If `sf_available: true`:**

Continue with test execution.

### 2. Identify Classes for Testing

From sidecar `files_reviewed`, filter:

- Only `.cls` files
- Exclude test classes (`*Test.cls`, `*Mock.cls`)
- Result: list of production classes

```
## Classes para Teste

| # | Classe | Classe de Teste |
|---|--------|-----------------|
| 1 | B2BProductUploadController | B2BProductUploadControllerTest |
| 2 | B2BProductUploadService | B2BProductUploadServiceTest |
```

### 3. Run Tests

**Important:** Execute each test class individually:

```bash
sf apex test run --synchronous --code-coverage \
  --class-names "{TestClassName}" --result-format json
```

**For each test class:**

1. Execute test
2. Parse JSON result
3. Store metrics (coverage, time, status)
4. Consolidate at end

**Example output:**

```
Executando testes... (3 classes)

[1/3] B2BProductUploadControllerTest
      ✅ Passou | Cobertura: 89% | Tempo: 69ms

[2/3] B2BProductUploadServiceTest
      ✅ Passou | Cobertura: 94% | Tempo: 70ms

[3/3] CommerceEngineTest
      ✅ Passou | Cobertura: 100% | Tempo: 35ms

Testes concluídos: 3/3 passando
```

### 4. Parse Results

Extract from JSON:

- `summary.testsRan`: total tests
- `summary.passing`: passing tests
- `summary.failing`: failing tests
- `summary.testRunTime`: total time
- `coverage`: coverage per class

### 5. Compile Metrics

```
## Resultados dos Testes

| Métrica | Valor |
|---------|-------|
| Testes executados | {testsRan} |
| Passando | {passing} ✅ |
| Falhando | {failing} ❌ |
| Tempo total | {testRunTime} ms |

### Coverage by Class

| Classe | Teste | Cobertura | Tempo | Tipo |
|--------|-------|-----------|-------|------|
| B2BProductUploadController | B2BProductUploadControllerTest | 89% | 69ms | Mockado |
| B2BProductUploadService | B2BProductUploadServiceTest | 94% | 70ms | Mockado |
| CommerceEngine | CommerceEngineTest | 100% | 35ms | Mockado |

### Coverage Analysis
- Cobertura média: {average}%
- Abaixo de 75%: {below_threshold}
- Com 100%: {full_coverage}
```

### 6. Identify Classes Without Tests

```
### Classes Sem Teste

| Classe | Status |
|--------|--------|
| AuthConfigurationEngine | ❌ Sem teste |
| NetworkEngine | ❌ Sem teste |

⚠️ {count} classes sem testes unitários.
```

### 7. Check Failing Tests

If failing tests exist:

```
### Testes Falhando

| Teste | Método | Erro |
|-------|--------|------|
| B2BProductUploadControllerTest | testUploadWithInvalidData | System.AssertException: ... |

❌ {count} testes falhando. Devem ser corrigidos antes do merge.
```

### 8. Update Sidecar

```json
{
  "test_results": {
    "total_tests": X,
    "passing": X,
    "failing": X,
    "total_time_ms": X,
    "coverage": {...},
    "classes_without_tests": [...],
    "failing_tests": [...]
  },
  "current_step": "5a"
}
```

### 9. Proceed to Analysis

Update sidecar `current_step: 5b` and load `{nextStepFile}`.

---

## SUCCESS METRICS

- SF CLI availability checked
- Tests executed for all classes
- Coverage metrics collected
- Classes without tests identified
- Failing tests documented
- Sidecar updated
