---
name: 'step-03-re-review-diff-analysis'
description: 'Analisar mudanças desde última review e validar correções'

# File References
nextStepFile: './step-04a-technical-review.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 3 (Re-Review): Análise de Mudanças

## STEP GOAL:

Identificar EXATAMENTE o que mudou desde a última review, focar na validação das
correções, e verificar se novos bugs foram introduzidos. Pular análise de código
que não foi modificado.

## RE-REVIEW FOCUS AREAS

| Área                     | Review Normal       |                     Re-Review |
| ------------------------ | ------------------- | ----------------------------: |
| Arquivos não modificados | ✅ Analisa completo |                     ⏭️ Ignora |
| Arquivos modificados     | ✅ Análise completa |           ✅ Análise completa |
| Novos arquivos           | ✅ Análise completa |           ✅ Análise completa |
| Problemas anteriores     | N/A                 | ⏳ Valida se foram corrigidos |
| Regressões               | N/A                 |        ⏳ Verifica novos bugs |

## MANDATORY EXECUTION RULES:

### Universal Rules:

- CRITICAL: Only analyze files that changed since last review
- CRITICAL: Compare current files with previous review findings
- CRITICAL: Mark findings with status: FIXED, STILL PRESENT, NEW
- YOU ARE A HELPER, not a code rewriter

### Re-Review Specific Rules:

- Load previous findings from sidecar context
- For each previous issue, note: Fixed / Still Present / Workaround
- For new issues, mark as: "🆕 NEW ISSUE IN RE-REVIEW"
- Count fixed issues vs remaining issues

## DIFF ANALYSIS SEQUENCE:

### 1. Obter Lista de Mudanças

```bash
# Get last commit hash from previous review (if stored)
PREVIOUS_COMMIT=$(jq -r '.previous_review.commit_hash_after_autofix // "initial"' \
  docs/code-reviews/.code-review-state.json)

# Get current commit
CURRENT_COMMIT=$(git rev-parse HEAD)

# Get list of changed files since last review
if [ "${PREVIOUS_COMMIT}" = "initial" ]; then
  # First time, get all tracked files
  CHANGED_FILES=$(git ls-files --cached)
else
  # Get files changed since previous review
  CHANGED_FILES=$(git diff --name-only ${PREVIOUS_COMMIT}..${CURRENT_COMMIT})
fi

# Filter by relevant extensions (Apex, LWC, Flows, configs)
RELEVANT_FILES=$(echo "${CHANGED_FILES}" | grep -E '\.(cls|js|cmp|html|xml|json)$')

echo "Files changed since last review: $(echo "${RELEVANT_FILES}" | wc -l)"
```

### 2. Categorizar Mudanças

For each changed file:

```bash
for FILE in ${RELEVANT_FILES}; do
  # Check if file was in previous review
  if jq ".previous_review.files_reviewed | contains([\"${FILE}\"])" \
    docs/code-reviews/.code-review-state.json > /dev/null; then
    # File was reviewed before - MODIFICATION
    echo "${FILE}: MODIFICADO"
  else
    # New file - ADDITION
    echo "${FILE}: NOVO"
  fi
done
```

Display:

```
## Mudanças Identificadas

### Arquivos Modificados (Alterados desde última review)
- ClassA.cls ← Tinha problema: "Unused import"
- ClassB.cls ← Tinha problema: "Low test coverage"
- LwcComponent.js ← Novo arquivo

### Arquivos Não Modificados (Ignorados neste review)
- ClassC.cls
- ClassD.cls
- ...

**Total de arquivos para revisar:** 3
```

### 3. Carregar Problemas Anteriores para Comparação

From sidecar, extract previous findings by file:

```json
{
    "file_analysis": {
        "ClassA.cls": {
            "status": "modified",
            "previous_issues": [
                {
                    "issue": "Unused import Map",
                    "severity": "low",
                    "category": "code-style",
                    "fixed": false
                }
            ],
            "current_findings": []
        },
        "ClassB.cls": {
            "status": "modified",
            "previous_issues": [
                {
                    "issue": "Test coverage only 65%",
                    "severity": "critical",
                    "category": "testing",
                    "fixed": false
                }
            ],
            "current_findings": []
        },
        "LwcComponent.js": {
            "status": "new",
            "previous_issues": [],
            "current_findings": []
        }
    }
}
```

### 4. Apresentar Foco da Re-Review

```
## Validação de Correções

### ClassA.cls (Modificado)

**Problema Anterior:**
🔴 Unused import Map
   Severity: LOW
   Category: Code Style

**Status Esperado:**
- [ ] Deve estar resolvido
- [ ] Continua presente (não foi corrigido)
- [ ] Tem workaround

Verificando... {análise}

---

### ClassB.cls (Modificado)

**Problema Anterior:**
🔴 Test coverage only 65%
   Severity: CRITICAL
   Category: Testing

**Esperado na re-review:**
- Mínimo 80% de cobertura
- Novos testes adicionados
- Mock patterns seguem padrão

Verificando...
```

### 5. Análise Comparativa Arquivo-por-Arquivo

For each modified file:

```
## ClassA.cls - Análise Comparativa

### Mudanças Detectadas
{git diff output showing what changed}

### Validação de Correções Anteriores

✅ FIXED: Unused import Map
   - Anterior: import java.util.Map; (linha 5)
   - Atual: Removido ✓

### Novos Problemas Detectados

🆕 NEW: Missing @Override annotation
   - Método getName() sobrescreve parent
   - Linhas: 42-47

Status: ❌ REGRESSION - Novo problema introduzido

---
```

### 6. Resumo de Achados da Re-Review

```
## Resumo da Análise de Mudanças

### Arquivos Analisados: 3

### Correções Verificadas:
| Arquivo | Problema Anterior | Status | Notas |
|---------|------------------|--------|-------|
| ClassA.cls | Unused import | ✅ FIXED | Removido com sucesso |
| ClassB.cls | Low coverage | ⏳ IN PROGRESS | Coverage aumentou de 65% → 78% |
| LwcComponent.js | N/A | 🆕 NEW | Novo arquivo, requer análise completa |

### Novos Problemas Encontrados:
- 🆕 ClassA.cls: Missing @Override
- 🆕 LwcComponent.js: Hardcoded strings

### Regressões (Problema que volta):
- ❌ ClassB.cls: Coverage ainda abaixo de 80%

### Próxima Fase:
Análise técnica de arquivos modificados + problemas novos/pendentes
```

### 7. Atualizar Sidecar com Análise de Diff

```json
{
  ...existing,
  "current_step": "03-re-review",
  "re_review_analysis": {
    "total_files_reviewed": 3,
    "files_modified": ["ClassA.cls", "ClassB.cls"],
    "files_new": ["LwcComponent.js"],
    "previous_issues_fixed": ["Unused import"],
    "previous_issues_remaining": ["Coverage"],
    "new_issues_found": ["Missing @Override", "Hardcoded strings"],
    "regressions": ["Coverage still low"]
  }
}
```

### 8. Prosseguir para Análise Técnica

```
Menu:

[C] Continuar para análise técnica (arquivos modificados)
[R] Revisar análise de diff novamente
[X] Cancelar

Recomendação: Todos os problemas anteriores e novos serão tratados na fase
técnica. Vamos focar APENAS em arquivos que mudaram.
```

Após confirmação:

```bash
echo "✅ Análise de mudanças concluída"
echo "   Arquivos para análise técnica: 3"
echo "   Prosseguindo..."

sidecar_update_field "current_step" "04a"
load_step './step-04a-technical-review.md'
```

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- Changed files accurately identified
- Previous issues located and compared
- New issues marked distinctly
- Regressions detected
- Focus area clear for next step
- User confirmed re-review scope

### SYSTEM FAILURE:

- Analyzing unmodified files
- Losing track of previous issues
- Not marking new issues as "NEW"
- Including files that didn't change
- Not detecting regressions

**Master Rule:** Only analyze what changed. Previous findings are reference
points, not scope.

## RE-REVIEW BEST PRACTICES

1. **Speed:** Skip unmodified files entirely
2. **Accuracy:** Keep audit trail of previous vs current
3. **Clarity:** Use FIXED/NEW/STILL PRESENT markers consistently
4. **Regression:** Watch for problems that reappear
5. **Scope:** Focus only on changed + new + previous issues
