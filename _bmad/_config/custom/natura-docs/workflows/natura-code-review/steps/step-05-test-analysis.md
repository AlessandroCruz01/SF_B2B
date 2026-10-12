---
name: 'step-05-test-analysis'
description: '[DEPRECATED] Use step-05a-test-execution instead'

nextStepFile: './step-05a-test-execution.md'
---

# ⚠️ DEPRECATED: Step 5 Test Analysis

## This step has been refactored

The original **step-05-test-analysis** (302 lines) has been split into two
focused steps:

### ✅ New Step Structure

1. **[step-05a-test-execution.md](./step-05a-test-execution.md)** - Test
   execution
    - SF CLI availability check
    - Test class identification
    - Sequential test execution
    - Coverage metrics collection

2. **[step-05b-test-analysis.md](./step-05b-test-analysis.md)** - Test quality
   analysis
    - Mock pattern assessment
    - Unnecessary query detection
    - Quality gate enforcement
    - Coverage validation

### 📍 Redirecting

Please proceed to:
**[./step-05a-test-execution.md](./step-05a-test-execution.md)**

---

## ORIGINAL STEP GOAL:

Executar os testes Apex relacionados às classes alteradas, coletar métricas de
cobertura e tempo de execução, e identificar classes sem testes.

## MANDATORY EXECUTION RULES (READ FIRST):

### Universal Rules:

- NEVER generate content without completing test execution
- CRITICAL: Read the complete step file before taking any action
- YOU ARE A FACILITATOR, not a content generator

### Role Reinforcement:

- You are a **Code Reviewer / Tech Lead** especializado em Salesforce B2B
  Commerce
- Technical analysis mode - objective metrics
- Quality gate enforcement

### Step-Specific Rules:

- Check if SF CLI is available before running tests
- Skip this step if `sf_available: false`
- Run tests synchronously for accurate coverage
- Parse JSON results for metrics

## TEST ANALYSIS SEQUENCE:

### 1. Verificar Disponibilidade do SF CLI

Ler sidecar para verificar `sf_available`:

**Se `sf_available: false`:**

```
⚠️ Salesforce CLI não está conectado.

A análise de testes será pulada. Para incluir métricas de cobertura:
1. Execute: sf org login web
2. Reinicie o workflow

Prosseguindo para geração de outputs...
```

- Atualizar sidecar com `tests_skipped: true`
- Prosseguir para `{nextStepFile}`

**Se `sf_available: true`:**

- Continuar com análise de testes

### 2. Identificar Classes para Teste

Do sidecar, extrair `files_reviewed` e filtrar:

- Apenas arquivos `.cls`
- Excluir classes de teste (`*Test.cls`, `*Mock.cls`, `*Factory.cls`)
- Resultado: lista de classes de produção alteradas

```
## Classes para Análise de Cobertura

| # | Classe | Classe de Teste Esperada |
|---|--------|--------------------------|
| 1 | B2BProductUploadController | B2BProductUploadControllerTest |
| 2 | B2BProductUploadService | B2BProductUploadServiceTest |
| 3 | CommerceEngine | CommerceEngineTest |
```

### 3. Executar Testes

⚠️ **IMPORTANTE:** O Salesforce CLI não suporta múltiplas classes de teste em um
único comando. Executar cada classe de teste **individualmente**.

**3.1 Loop de Execução:**

Para cada classe de teste identificada na seção 2:

```bash
sf apex test run --synchronous --code-coverage --class-names "{TestClassName}" --result-format json
```

**3.2 Processo:**

1. Executar teste da classe 1
2. Parsear resultado JSON
3. Armazenar métricas (cobertura, tempo, status)
4. Repetir para próxima classe
5. Consolidar resultados ao final

**3.3 Exemplo de execução sequencial:**

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

### 4. Parsear Resultados JSON

Extrair do JSON:

- `summary.testsRan`: número de testes executados
- `summary.passing`: testes passando
- `summary.failing`: testes falhando
- `summary.testRunTime`: tempo total
- `coverage`: cobertura por classe

### 5. Compilar Métricas

```
## Resultados dos Testes

### Resumo da Execução
| Métrica | Valor |
|---------|-------|
| Testes executados | {testsRan} |
| Passando | {passing} ✅ |
| Falhando | {failing} ❌ |
| Tempo total | {testRunTime} ms |

### Cobertura por Classe

| Classe | Classe de Teste | Cobertura | Tempo (ms) | Tipo |
|--------|-----------------|-----------|------------|------|
| B2BProductUploadController | B2BProductUploadControllerTest | 89% | 69 | Mockado |
| B2BProductUploadService | B2BProductUploadServiceTest | 94% | 70 | Mockado |
| CommerceEngine | CommerceEngineTest | 100% | 35 | Mockado |

### Análise de Cobertura
- Cobertura média: {average}%
- Classes abaixo de 75%: {below_threshold}
- Classes com 100%: {full_coverage}
```

### 6. Identificar Classes Sem Teste

Verificar se todas as classes de produção têm teste correspondente:

```
### Classes Sem Teste

| Classe | Status |
|--------|--------|
| AuthConfigurationEngine | ❌ Sem classe de teste |
| NetworkEngine | ❌ Sem classe de teste |

⚠️ {count} classes não possuem testes unitários.
```

### 7. Verificar Testes Falhando

Se houver testes falhando:

```
### Testes Falhando

| Teste | Método | Erro |
|-------|--------|------|
| B2BProductUploadControllerTest | testUploadWithInvalidData | System.AssertException: ... |

❌ {count} testes estão falhando. Estes devem ser corrigidos antes do merge.
```

### 8. Determinar Tipo de Teste e Validar Uso de Mocks

**8.1 Classificação por Tempo:**

- **Mockado**: Execução rápida (<100ms)
- **Integrado**: Execução lenta (>500ms)

**8.2 Análise de Código do Teste:**

Para cada classe de teste, verificar padrões no código:

**Indicadores de Mock adequado:**

- Uso de `Test.setMock()` ou `HttpCalloutMock`
- Classes `*Mock.cls` ou `*Factory.cls` referenciadas
- `Test.startTest()` / `Test.stopTest()` com dados criados inline

**Indicadores de consulta desnecessária (⚠️ ATENÇÃO):**

- `[SELECT ... FROM ...]` fora de setup inicial
- `Database.query()` em cenários de teste
- Consultas a objetos que poderiam ser mockados

**8.3 Regra de Reprovação:**

🚨 **CENÁRIOS QUE DEVEM SER REPROVADOS:**

| Cenário                                           | Motivo                                | Ação        |
| ------------------------------------------------- | ------------------------------------- | ----------- |
| Teste faz SELECT em objeto custom sem necessidade | Deveria usar Test.loadData ou factory | ❌ REPROVAR |
| Teste consulta API externa sem mock               | Deveria usar HttpCalloutMock          | ❌ REPROVAR |
| Teste depende de dados existentes na org          | Deveria criar dados no setup          | ❌ REPROVAR |

**8.4 Exibir Análise:**

```
### Análise de Mocks nos Testes

| Classe de Teste | Usa Mock? | Consultas Desnecessárias | Status |
|-----------------|-----------|--------------------------|--------|
| ClasseTest.cls  | ✅ Sim    | Nenhuma                  | ✅ OK  |
| OutraTest.cls   | ❌ Não    | 3 SELECTs evitáveis      | ❌ REPROVAR |
```

### 9. Atualizar Sidecar

```json
{
  ...existing,
  "current_step": 5,
  "test_results": {
    "total_tests": X,
    "passing": X,
    "failing": X,
    "total_time_ms": X,
    "coverage": {
      "ClassName": {
        "coverage_percent": 89,
        "test_class": "ClassNameTest",
        "time_ms": 69,
        "type": "mockado"
      }
    },
    "classes_without_tests": [...],
    "failing_tests": [...]
  }
}
```

### 10. Prosseguir para Geração de Outputs

Este step é automático após execução dos testes.

```
Análise de testes concluída.

Prosseguindo para geração de outputs...
```

#### Menu Handling Logic:

- Após análise completa, atualizar sidecar com `current_step: 6`
- Imediatamente carregar `{nextStepFile}`

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- SF CLI availability checked
- Tests executed for all relevant classes
- Coverage metrics collected
- Classes without tests identified
- Failing tests documented
- Sidecar updated with results

### SYSTEM FAILURE:

- Running tests without checking SF availability
- Not parsing JSON results correctly
- Missing coverage for classes
- Not identifying missing tests
- Not documenting failures

**Master Rule:** Skipping steps, optimizing sequences, or not following exact
instructions is FORBIDDEN and constitutes SYSTEM FAILURE.

## CRITICAL STEP COMPLETION NOTE

After test analysis is complete (or skipped if SF unavailable), update sidecar
and immediately load `{nextStepFile}` to begin output generation.
