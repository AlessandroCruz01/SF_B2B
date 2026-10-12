---
name: 'step-06-generate-output'
description: 'Gerar outputs: atualizar planilhas CSV e criar relatório Markdown'

# File References
nextStepFile: './step-06a-update-csvs.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
reportTemplate: '../templates/review-report-template.md'
---

# Step 6: Geração de Outputs - DEPRECATED

⚠️ **NOTA:** Este step foi refatorado para melhor manutenibilidade.

O fluxo agora é dividido em:

- **Step 6a**: Atualização de planilhas CSV
- **Step 6b**: Geração de relatório Markdown

Redirecionando para Step 6a...

---

**Você será redirecionado automaticamente. Se isso não acontecer:**

Por favor, execute manualmente: `./step-06a-update-csvs.md`

## STEP GOAL:

Gerar todos os outputs do code review: atualizar as 6 planilhas CSV com os dados
coletados e criar o relatório Markdown completo.

## MANDATORY EXECUTION RULES (READ FIRST):

### Universal Rules:

- NEVER modify files without proper data
- CRITICAL: Read the complete step file before taking any action
- YOU ARE A FACILITATOR, not a content generator

### Role Reinforcement:

- You are a **Code Reviewer / Tech Lead** especializado em Salesforce B2B
  Commerce
- Documentation mode - precise and complete
- Follow existing CSV structure exactly

### Step-Specific Rules:

- Append to CSVs, never overwrite existing data
- Skip CSVs that have no new data
- Create report from template
- Maintain CSV column structure

## OUTPUT GENERATION SEQUENCE:

### 1. Carregar Todos os Dados

Ler sidecar para obter todos os dados coletados:

- Informações do PR (branch, card, desenvolvedor, reviewer)
- Arquivos revisados e suas observações
- Resultados dos testes
- Acceptance Criteria (se disponível)

### 2. Atualizar CSV 1: Branches

**Arquivo:** `{csvBranches}`

**Estrutura:**

```
Responsável,Cards,Nome da Branch,Baseada em,Status,Observações
```

**Nova linha a adicionar:**

```
{desenvolvedor},{card},{branch},dev,aberta,Code Review em andamento
```

### 3. Atualizar CSV 2: Componentes Funcionais

**Arquivo:** `{csvFuncional}`

**Estrutura:**

```
Responsável,Card,Rótulo do Componente,API Name do Componente,Tipo do Componente,Ação,Observações
```

**Filtrar arquivos** de categoria `config` e adicionar linhas:

- Custom Fields
- Custom Labels
- Page Layouts
- Flexi Pages
- etc.

**Se nenhum componente funcional:** Pular este CSV

### 4. Atualizar CSV 3: Componentes Dev

**Arquivo:** `{csvDev}`

**Estrutura:**

```
Responsável,Card,API Name do Componente,Testado?,Tipo do Componente,Ação,Code Review,Observações
```

**Para cada arquivo** de categoria `dev` e `test`:

```
{desenvolvedor},{card},{api_name},{testado?},{tipo},{ação},Feito,{observações}
```

Onde:

- `testado?`: Sim/Não/N/A (baseado em resultados de teste)
- `tipo`: Apex Class, Apex Test Class, LWC, etc.
- `ação`: Criado/Alterado
- `observações`: Resumo das observações do review

### 5. Atualizar CSV 4: Testes Unitários

**Arquivo:** `{csvTestes}`

**Estrutura:**

```
Responsável,Card,Classe Testada,Classe de Testes,Cobertura,Tempo de Execução (ms),Tipo do Teste,Observações
```

**Para cada classe testada:**

```
{desenvolvedor},{card},{classe},{classe_teste},{cobertura}%,{tempo},{tipo},
```

Onde:

- `tipo`: Mockado/Integrado
- Apenas classes que foram testadas

**Se testes foram pulados:** Pular este CSV

### 6. Atualizar CSV 5: Pré-Pós Deploy

**Arquivo:** `{csvPrePos}`

**Estrutura:**

```
Responsável,Card,Momento,Rótulo do Componente,Tipo do Componente,Ação,Observações
```

**Identificar componentes** que precisam de ação manual pós-deploy:

- LWCs que precisam ser adicionados a páginas
- Permissões que precisam ser configuradas
- etc.

**Se nenhuma ação pós-deploy:** Pular este CSV

### 7. Atualizar CSV 6: Change Sets

**Arquivo:** `{csvChangeSets}`

**Estrutura:**

```
Responsável,Card,Nome do Pacote,Ambiente,Data,Hora,Observações
```

**Nota:** Este CSV geralmente é preenchido no momento do deploy, não do review.
**Ação:** Pular a menos que haja informação específica.

### 8. Gerar Relatório Markdown

**Arquivo de saída:** `{project-root}/docs/code-reviews/{card}--code-review.md`

**Usar template** de `{reportTemplate}` e preencher:

```markdown
# Code Review: {card}

## Informações Gerais

- **Branch**: {branch}
- **Desenvolvedor**: {desenvolvedor}
- **Reviewer**: {reviewer}
- **Data**: {data_atual}
- **Status**: {status_preliminar}

## Resumo Executivo

{Parágrafo resumindo o code review baseado nas observações}

## Aderência à História

### Acceptance Criteria

| AC  | Descrição | Status | Implementado em | Observações |
| --- | --------- | ------ | --------------- | ----------- |

{tabela de ACs}

### Implementações Não Previstas

{lista ou "Nenhuma implementação fora do escopo identificada"}

## Arquivos Revisados

### Apex Classes

| Arquivo | Status | Observações |
| ------- | ------ | ----------- |

{tabela de classes}

### LWC Components

| Componente | Status | Observações |
| ---------- | ------ | ----------- |

{tabela de LWCs}

### Outros Componentes

| Componente | Tipo | Status | Observações |
| ---------- | ---- | ------ | ----------- |

{tabela de outros}

## Análise de Testes

| Classe | Classe de Teste | Cobertura | Tempo (ms) | Tipo |
| ------ | --------------- | --------- | ---------- | ---- |

{tabela de testes}

## Qualidades Identificadas

{lista de pontos positivos}

## Pontos de Atenção

{lista de defeitos ou melhorias necessárias}

## Decisão Final

**Status**: {Aprovado | Aprovado com Ressalvas | Reprovado} **Justificativa**:
{A ser definido no próximo step}

---

_Gerado automaticamente pelo workflow natura-code-review_
```

### 9. Resumo dos Outputs

```
## Outputs Gerados

| Output | Status | Linhas Adicionadas |
|--------|--------|-------------------|
| 1-Release (Branches) | ✅ Atualizado | 1 |
| 2-Release (Comp. Funcionais) | ✅/⏭️ | {N} |
| 3-Release (Comp. Dev) | ✅ Atualizado | {N} |
| 4-Release (Testes) | ✅/⏭️ | {N} |
| 5-Release (Pré-Pós) | ✅/⏭️ | {N} |
| 6-Release (Change Sets) | ⏭️ Pulado | 0 |
| Relatório MD | ✅ Criado | - |

Prosseguindo para resumo final...
```

### 10. Atualizar Sidecar

```json
{
  ...existing,
  "current_step": 6,
  "outputs_generated": {
    "csv_branches": true,
    "csv_funcional": true/false,
    "csv_dev": true,
    "csv_testes": true/false,
    "csv_prepos": true/false,
    "csv_changesets": false,
    "report_md": "docs/code-reviews/{card}--code-review.md"
  }
}
```

### 11. Prosseguir para Resumo Final

Este step é automático após geração dos outputs.

#### Menu Handling Logic:

- Após geração completa, atualizar sidecar com `current_step: 7`
- Imediatamente carregar `{nextStepFile}`

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- All relevant CSVs updated (append only)
- Report markdown created
- Existing CSV structure preserved
- Data correctly mapped to columns
- Sidecar updated with output status

### SYSTEM FAILURE:

- Overwriting existing CSV data
- Wrong column mapping
- Missing required fields
- Not creating report
- Breaking CSV structure

**Master Rule:** Skipping steps, optimizing sequences, or not following exact
instructions is FORBIDDEN and constitutes SYSTEM FAILURE.

## CRITICAL STEP COMPLETION NOTE

After all outputs are generated and sidecar is updated, immediately load
`{nextStepFile}` to begin final summary and decision.
