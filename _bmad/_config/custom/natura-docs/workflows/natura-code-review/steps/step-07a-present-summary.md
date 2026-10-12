---
name: 'step-07a-present-summary'
description: 'Apresentar resumo consolidado do code review e achados'

# File References
nextStepFile: './step-07b-final-decision.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
advancedElicitationTask: '{project-root}/.agents/skills/bmad-advanced-elicitation/SKILL.md'
---

# Step 7a: Apresentação do Resumo

## STEP GOAL:

Consolidar e apresentar o resumo completo do code review, incluindo achados
positivos, pontos de atenção, e validação de ACs.

**⚠️ NOTE:** This step assumes workflow state has been properly restored from
/tmp in previous step. See step-06 for state restoration details.

## MANDATORY EXECUTION RULES (READ FIRST):

### Universal Rules:

- NEVER proceed without user explicit acknowledgment
- CRITICAL: Read the complete step file before taking any action
- YOU ARE A FACILITATOR, not a decision maker

### Role Reinforcement:

- You are a **Code Reviewer / Tech Lead** especializado em Salesforce B2B
  Commerce
- Objective presentation of findings
- Support user in understanding the analysis
- Professional, clear communication

### Step-Specific Rules:

- Present ALL findings objectively
- User MUST acknowledge understanding before proceeding
- Separate positive from negative findings clearly
- Prepare data for Advanced Elicitation if needed

## SUMMARY PRESENTATION SEQUENCE:

### 1. Carregar Todos os Dados

Ler `{sidecarFile}` para obter:

- Informações do PR (branch, card, desenvolvedor, reviewer)
- Arquivos revisados e suas observações
- Resultados dos testes (se disponíveis)
- Acceptance Criteria (se disponíveis)

### 2. Apresentar Resumo Executivo

```
# Code Review: {card}

## Informações Gerais
| Campo | Valor |
|-------|-------|
| **Branch** | {branch} |
| **PR** | #{pr_number} |
| **Desenvolvedor** | {desenvolvedor} |
| **Reviewer** | {reviewer} |
| **Data** | {data_atual} |

## Resumo da Análise

### Arquivos Revisados
| Categoria | Total | Aprovados | Com Ressalvas | Reprovados |
|-----------|-------|-----------|---------------|------------|
| Desenvolvimento | {dev_total} | {dev_ok} | {dev_warn} | {dev_fail} |
| Testes | {test_total} | {test_ok} | {test_warn} | {test_fail} |
| Configuração | {config_total} | {config_ok} | {config_warn} | {config_fail} |

### Cobertura de Testes
| Métrica | Valor |
|---------|-------|
| Cobertura Média | {avg_coverage}% |
| Testes Passando | {passing}/{total} |
| Classes Sem Teste | {classes_sem_teste} |
```

### 3. Listar Pontos Positivos

```
## ✅ Qualidades Identificadas

{Para cada arquivo aprovado sem ressalvas, listar pontos positivos}

- ✅ {Ponto positivo 1}
- ✅ {Ponto positivo 2}
- ✅ {Ponto positivo 3}
```

### 4. Listar Pontos de Atenção

```
## ⚠️ Pontos de Atenção

### Críticos (Bloqueiam aprovação)
- ❌ {Problema crítico 1}
- ❌ {Problema crítico 2}

### Importantes (Recomenda-se corrigir)
- ⚠️ {Problema importante 1}
- ⚠️ {Problema importante 2}

### Sugestões (Melhorias opcionais)
- 💡 {Sugestão 1}
- 💡 {Sugestão 2}
```

### 5. Validação de ACs (se história disponível)

Se `story_available: true`:

```
## 📋 Aderência à História

| AC | Descrição | Status | Implementado em |
|----|-----------|--------|-----------------|
| AC-1 | {desc} | ✅/❌ | {arquivos} |
| AC-2 | {desc} | ✅/❌ | {arquivos} |

### Resumo
- ACs Implementados: {X} de {Y}
- ACs Não Implementados: {lista ou "Nenhum"}
- Código Não Previsto: {lista ou "Nenhum"}
```

### 6. Advanced Elicitation (se necessário)

**TRIGGER:** Se houver pontos CRÍTICOS ou ACs não implementados:

```
⚠️ Foram identificados pontos críticos neste code review.

Vamos validar cada ponto:
```

Executar `{advancedElicitationTask}` para cada ponto crítico:

- Confirmar se realmente é um bloqueador
- Verificar se há justificativa aceitável
- Documentar decisão do usuário

### 7. Requisitar Confirmação

```
Você revisou o resumo acima?

Alguma dúvida ou observação sobre os achados antes de proceder à decisão final?
```

**Se há dúvidas:** Esclarecer pontos específicos do resumo

**Se confirmado:** Prosseguir para próximo step

### 8. Present MENU OPTIONS

Display: **Resumo apresentado!** `[C]` Continue para auto-fix opportunities

#### Menu Handling Logic:

- IF C: Update sidecar `current_step: 7`, then load, read entire file, then
  execute `{nextStepFile}`
- IF Any other (clarifications needed): help user respond then redisplay summary
  section with clarification

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- Summary presented objectively
- All findings clearly documented
- Advanced Elicitation completed if needed
- User confirmed understanding
- Ready to proceed to decision

### SYSTEM FAILURE:

- Incomplete summary
- Biased presentation of findings
- Skipping Advanced Elicitation for critical issues
- Not confirming user understanding

**Master Rule:** Follow exact instructions in sequence. No skipping or
optimizing allowed.
