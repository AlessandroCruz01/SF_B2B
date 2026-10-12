---
name: 'step-04a-technical-review'
description: 'Validação técnica e verificação de padrões de projeto'

# File References
nextStepFile: './step-04b-functional-review.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
codeReviewChecklist: '{project-root}/docs/project/code-review.md'
designPatterns: '{project-root}/docs/project/design-patterns.md'
---

# Step 4A: Technical Review

## STEP GOAL:

Validação técnica de cada arquivo alterado, aplicando checklist por tipo (Apex,
LWC, Triggers, Flows).

## MANDATORY RULES:

- NEVER generate decisions without user input
- CRITICAL: Review ONE file at a time
- YOU ARE A CODE REVIEWER / TECH LEAD
- Technical expertise in Apex, LWC, Design Patterns
- OBJECTIVE and constructive feedback

## REFERENCE DOCUMENTS:

- `{codeReviewChecklist}` - Checklists por tipo de arquivo
- `{designPatterns}` - Padrões do projeto Natura B2B

## CODE REVIEW SEQUENCE:

### 1. Load State

Read sidecar:

- `files_pending`: arquivos a revisar
- `files_reviewed`: já revisados
- `observations`: observações registradas

### 2. File Review Loop

Para cada arquivo em `files_pending`:

#### 2.1 Display Current File

```
## Review: {filename}

**Arquivo {N} de {total}** | Tipo: {tipo} | +{add}/-{del}
```

#### 2.2 Load and Display Content

Display file contents completely.

#### 2.3 Apply Technical Review

**For Apex Classes:**

Checklist:

- [ ] Nomenclatura (B2B prefix, PascalCase)
- [ ] Métodos ≤ 3 parâmetros
- [ ] Sem hardcoded values
- [ ] Tratamento de exceções
- [ ] Sem SOQL/DML em loops
- [ ] Bulkification aplicada

**🚨 CRITICAL RULES (Auto-Rejection):**

| Violação               | Motivo          | Exemplo                      |
| ---------------------- | --------------- | ---------------------------- |
| Try/catch vazio        | Engole exceções | `catch(Exception e) {}`      |
| Catch genérico sem log | Perde debug     | `catch(Exception e) {/* */}` |
| System.debug produção  | Performance     | `System.debug()` sem @isTest |

**If violated:**

- Status: ❌ **REJECTED**
- Não permite ressalvas
- Corrigir antes de nova análise

**For LWC:**

Checklist:

- [ ] camelCase nomenclatura
- [ ] Sem console.log produção
- [ ] Tratamento de erros
- [ ] Labels externalizados
- [ ] CSS sem !important
- [ ] ≤ 500 linhas

**For Triggers:**

Checklist:

- [ ] Usa Handler pattern
- [ ] Sem lógica no trigger
- [ ] Bulkification

#### 2.4 Check Design Patterns

Verify pattern compliance:

- Segue padrões estabelecidos?
- Usa repositories existentes?
- Segue arquitetura de camadas?

#### 2.5 Record Result

```
### Technical Result: {filename}

**Status**: ✅ OK | ⚠️ Concerns | ❌ Rejected

**Technical Observations:**
- {lista}

**Pattern Compliance:**
- {lista}

**Suggestions:**
- {sugestões construtivas}
```

#### 2.6 File Menu

Select: `[S]` Skip `[N]` Next `[C]` Complete

- **[S]**: Skip, next file
- **[N]**: Save, next file
- **[C]**: Skip pending, go to analysis

#### 2.7 Update Sidecar After Each File

```json
{
  "files_reviewed": [...],
  "files_pending": [...],
  "observations": {
    "arquivo": {
      "status": "approved|concerns|rejected",
      "technical": [...],
      "patterns": [...]
    }
  }
}
```

### 3. Coherence Analysis

Após todos revisados:

```
## Coherence Analysis

- [ ] Nomenclatura consistente
- [ ] Controllers → Services correto
- [ ] Services → Repositories correto
- [ ] Bulkification consistente
- [ ] Exceções padronizadas
- [ ] Padrões uniformes

### Observations
- {observações}
```

### 4. Technical Summary

```
## Technical Review Summary

| Métrica | Valor |
|---------|-------|
| Total | {total} |
| Aprovados | {approved} |
| Ressalvas | {concerns} |
| Reprovados | {rejected} |
| Pulados | {skipped} |

### Key Points
1. {ponto}
2. {ponto}
3. {ponto}
```

### 5. Proceed to Functional Review

Update sidecar `current_step: 4b` and load `{nextStepFile}`.

---

## SUCCESS METRICS

- Each file reviewed individually
- Technical checklist applied
- Design patterns validated
- Observations saved per file
- Coherence analysis completed
- Sidecar updated throughout
