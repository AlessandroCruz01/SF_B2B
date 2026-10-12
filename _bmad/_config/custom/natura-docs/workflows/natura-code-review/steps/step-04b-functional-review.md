---
name: 'step-04b-functional-review'
description:
    'Revisar funcionalidade: mapear ACs e validar lógica de negócio por arquivo'

# File References
nextStepFile: './step-04b-functional-summary.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 4B: Functional Review - Per File

## ⚠️ CRITICAL: BUG REVIEW DETECTION

Verificar se é bug review:

```bash
IS_BUG_REVIEW=$(jq -r '.is_bug_review // false' docs/code-reviews/.code-review-state.json)

if [ "${IS_BUG_REVIEW}" = "true" ]; then
  echo "ℹ️ Bug review detectado!"
  echo "   Functional review não é necessário para bug fixes."
  echo "   Pulando para testes..."
  exit 0
fi
```

Se `IS_BUG_REVIEW = true`, **SKIP** este step e carregar próximo.

---

## STEP GOAL:

Revisar funcionalidade de cada arquivo alterado, mapeando Acceptance Criteria
implementados e validando lógica de negócio.

## PRE-STEP CHECK: Story Availability

Ler sidecar `story_available`:

**Se `story_available: false`:**

```
ℹ️ Nenhuma história disponível.

Review funcional será pulado. Prosseguindo para análise de testes...
```

- Atualizar sidecar `current_step: 5`
- Prosseguir para `{nextStepFile}`

**Se `story_available: true`:**

- Continuar com functional review

---

## FUNCTIONAL REVIEW SEQUENCE:

### 1. Load Story Context

Do sidecar extrair:

- `acceptance_criteria`: Lista completa de ACs
- `story_title`: Resumo da história
- `story_url`: Link para Jira

Display:

```
## Functional Review

**História:** {story_title}

**Acceptance Criteria:**

| AC | Descrição |
|----|-----------|
| AC-1 | {desc} |
| AC-2 | {desc} |
| AC-N | {desc} |
```

### 2. File Review Loop

Para cada arquivo em `files_reviewed`:

#### 2.1 Display Current File

```
## Validando: {filename}

**Arquivo {N} de {total}** | Tipo: {tipo}
```

#### 2.2 Load and Display File Content

Mostrar conteúdo completo do arquivo

#### 2.3 Map Relevant ACs

Qual(is) Acceptance Criteria este arquivo implementa?

```
### AC Mapping

| AC | Descrição | Implementa? |
|----|-----------|-------------|
| AC-1 | {desc} | ✅/❌/N/A |
| AC-2 | {desc} | ✅/❌/N/A |
```

#### 2.4 Functional Analysis

Para cada AC implementado, validar:

**AC Logic Completeness:**

- Requisitos do AC completamente atendidos?
- Edge cases tratados?
- Caminhos de erro cobertos?

**Business Logic Correctness:**

- Cálculos corretos?
- Transformações de dados válidas?
- Nenhuma perda de dados?

**Integration Points:**

- Chamadas de APIs corretas?
- Integração com OCI correta?
- Chamadas de sistemas externos validadas?

**Configuration Compliance:**

- Usa objetos customizados corretos?
- Respeita relacionamentos Material/MaterialCode?
- Segue regras de distribuição de DC?

#### 2.5 Identify Unplanned Code

Código NÃO previsto na história:

```
### Código Não Previsto

- {função 1} (Recomendação: esclarecer escopo)
- {função 2} (Recomendação: próxima versão)
```

#### 2.6 Record Results

```
### Resultado Funcional: {filename}

**AC Compliance:**
- AC-1: ✅/❌ {motivo}
- AC-2: ⚠️ {detalhes}

**Business Logic:** {observações}

**Integration Validation:** {validação}

**Unplanned Code:** {lista ou "Nenhuma"}

**Status**: ✅ OK | ⚠️ Concerns | ❌ Does Not Meet
```

#### 2.7 File Menu

Selecione: `[S]` Skip `[N]` Next `[C]` Complete

- **[S]**: Mark skipped, próximo arquivo
- **[N]**: Salvar observações, próximo arquivo
- **[C]**: Se há pendentes, confirmar skip. Ir para summary.

#### 2.8 Update Sidecar After Each File

```json
{
  ...existing,
  "current_step": "4b",
  "functional_review": {
    "current_file": {
      "ac_mapping": {"AC-1": "✅", "AC-2": "❌"},
      "status": "meets|partial|does_not_meet",
      "unplanned_code": [...]
    }
  }
}
```

---

## SUCCESS METRICS

- Story availability checked
- Each file reviewed individually
- AC mapping completed for each file
- Functional logic validated
- Unplanned code identified
- File observations recorded in sidecar
- Ready for consolidation in next step
