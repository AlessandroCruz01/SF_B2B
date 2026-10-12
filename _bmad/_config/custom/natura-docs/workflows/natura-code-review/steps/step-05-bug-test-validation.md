---
name: 'step-05-bug-test-validation'
description: 'Validar que o bug foi realmente corrigido (sem foco em cobertura)'

# File References
nextStepFile: './step-05c-auto-fix-opportunities.md'
normalTestPath: './step-05a-test-execution.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 5 (Bug Review): Test Validation - LIGHTWEIGHT

## 🐛 BUG-SPECIFIC TEST VALIDATION

Para bug reviews, não focamos em cobertura %. Focamos em:

- ✅ **O bug foi realmente corrigido?**
- ✅ **Existem testes para evitar regressão?**
- ✅ **A correção não quebrou algo mais?**

**Sem métricas de cobertura** - bugs geralmente têm poucos testes adicionados.

## STEP GOAL:

Validar que a correção do bug é real e que existem testes (mesmo que simples)
para prevenir regressão.

## MANDATORY EXECUTION RULES:

### Universal Rules:

- CRITICAL: Focus on bug fix validation, not coverage metrics
- CRITICAL: Look for regression tests
- YOU ARE A VALIDATOR, not a metric analyzer

### Bug-Specific Rules:

- Coverage % é IGNORADO para bugs
- Foco: "O bug foi corrigido?"
- Aceitável: Até testes muito simples
- Rejeitar: Se zero testes para validar fix

## BUG TEST VALIDATION:

### 1. Identificar o Bug Corrigido

From sidecar:

```bash
BUG_TITLE=$(jq -r '.pr_title' docs/code-reviews/.code-review-state.json)
BUG_SEVERITY=$(jq -r '.bug_context.severity' docs/code-reviews/.code-review-state.json)
CHANGED_FILES=$(jq -r '.files_reviewed[]' docs/code-reviews/.code-review-state.json)
```

Display:

```
## Validação de Correção do Bug

Bug: ${BUG_TITLE}
Severidade: ${BUG_SEVERITY}

Arquivos Alterados:
${CHANGED_FILES}

---

### Validar: O bug foi realmente corrigido?
```

### 2. Analisar Mudanças de Código

Para cada arquivo modificado:

```
## ClassA.cls - Análise de Correção

### Mudança Detectada
{git diff excerpt showing the fix}

### Análise da Correção
- [x] Localização do bug: Encontrado em método X, linha Y
- [x] Tipo de correção: {null check / validation / logic fix / etc}
- [x] Solução: Parece válida e corrige raiz do problema?

Status: ✅ FIXED ou ❌ INCOMPLETE
```

### 3. Buscar Testes para o Bug

Para cada arquivo .cls que foi corrigido, verificar:

```bash
# Look for test class
TEST_CLASS=$(echo "${FILE}" | sed 's/\.cls$/_TEST.cls/')

# If it's a test, analyze test methods
if [ -f "${TEST_CLASS}" ]; then
  # Count test methods
  TEST_COUNT=$(grep -c "static void\|void test" "${TEST_CLASS}")

  echo "✅ Test class encontrada: ${TEST_COUNT} testes"
else
  echo "⚠️ Nenhuma test class encontrada"
fi
```

Display:

```
## Testes para Validar Correção

### ClassATest.cls

✅ Testes existem: SIM
   Testes adicionados/modificados neste PR: 2

🔍 Analisando testes:

1. testBugScenario_NullCheck
   - Valida: Null case que causava crash
   - Status: ✅ Valida a correção

2. testBugScenario_EdgeCase
   - Valida: Edge case do bug
   - Status: ✅ Previne regressão

---

### Avaliação
- Testes validam correção? ✅ SIM
- Testes previnem regressão? ✅ SIM
- Coverage adequado? ⚠️ Não (mas não é obrigatório para bugs)
```

### 4. Avaliação de Risco de Regressão

```bash
# Check if related files were NOT modified (potential regression risk)
RELATED_FILES=("file1.cls" "file2.cls")

echo "## Análise de Risco de Regressão"

for RELATED in "${RELATED_FILES[@]}"; do
  if git diff --name-only | grep -q "${RELATED}"; then
    echo "✅ ${RELATED} foi modificado - Risco baixo"
  else
    echo "⚠️ ${RELATED} não foi modificado"
    echo "   Possível: Código relacionado pode ter regressão"
  fi
done
```

### 5. Validação Final

```
## Resultado da Validação

┌─────────────────────────────────────────┐
│ BUG VALIDATION CHECKLIST               │
├─────────────────────────────────────────┤
│ ✅ Bug identificado e localizado       │
│ ✅ Correção valida e completa         │
│ ✅ Testes adicionados para validar fix │
│ ✅ Risco de regressão baixo           │
└─────────────────────────────────────────┘

Status: ✅ BUG VALIDATED - Correção é real e testada
```

### 6. Documentar Validação no Sidecar

```json
{
  ...existing,
  "current_step": "05-bug-validation",
  "bug_validation": {
    "bug_identified": true,
    "bug_located": "ClassA.cls, method X, line Y",
    "fix_type": "null_check|validation|logic_fix|other",
    "fix_status": "validated|incomplete|questionable",
    "tests_added": true,
    "tests_validate_fix": true,
    "regression_risk": "low|medium|high",
    "validation_status": "PASS|FAIL|PARTIAL"
  }
}
```

### 7. Decisão

```
Menu:

[C] Continuar - Bug validado e OK
[W] Validado com avisos (risco de regressão)
[X] Rejeitar - Bug não foi corrigido ou testes inadequados
```

- **[C]**: Prosseguir para auto-fix
- **[W]**: Prosseguir mas marcar risco
- **[X]**: Rejeitar e retornar para développe

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- Bug identified and located
- Fix validated as working
- Tests added to prevent regression
- Low regression risk
- User confirms validation

### SYSTEM FAILURE:

- Bug not clearly fixed
- No tests for validation
- Fix seems incomplete
- High regression risk
- Cannot validate correction

**Master Rule:** Bugs are simple: Is it fixed? Are there tests? Done.

## BUG VALIDATION BEST PRACTICES

1. **Speed**: Bugs validation é rápida (5 minutos max)
2. **Focus**: "Is it fixed?" - tudo que importa
3. **Tests**: Mesmo simples tests são OK
4. **Regression**: Watch for related code impact
5. **Decision**: Approve fast if fix is good
