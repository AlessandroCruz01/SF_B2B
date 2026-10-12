---
name: 'step-02b-collect-story'
description: 'Buscar história/User Story do Jira ou localizar arquivo local'

# File References
nextStepFile: './step-02b-extract-criteria.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
storiesFolder: '{project-root}/docs/jira'
jiraUrl: 'https://natura.atlassian.net/'
---

# Step 2b: Coleta de História - Discovery

## STEP GOAL:

Buscar a História/User Story do Card informado no Jira ou localizar arquivo
local, preparando para extração de Acceptance Criteria.

## MANDATORY EXECUTION RULES:

- NEVER generate content without user input
- CRITICAL: Read this entire file before taking action
- YOU ARE A FACILITATOR, not a content generator
- Focus ONLY on story discovery, not AC extraction

## DISCOVERY SEQUENCE:

### 1. Carregar Card do Sidecar

Ler `{sidecarFile}` para obter código do card (ex: NPCV-538)

### 2. Alerta Preventivo

```
📋 ATENÇÃO: Coleta de História

Para validar aderência aos Acceptance Criteria, buscando história no Jira.

Estratégia:
1. Tentar buscar do Jira (https://natura.atlassian.net/)
2. Se falhar: Buscar arquivo local
3. Se não encontrar: Opções alternativas

Prosseguir? [S/N]
```

- **S**: Prosseguir com busca automática
- **N**: Ir direto para opções locais

### 3. Busca no Jira (Preferencial)

**3.1 Menu de Execução:**

```
Buscando história {CARD} no Jira...

[A] Auto (buscar automaticamente)
[M] Manual (eu vou executar o comando)
[L] Local (pular Jira, usar arquivo)

Escolha:
```

- **A**: Executar MCP automaticamente
- **M**: Exibir instrução para usuário executar comando
- **L**: Pular direto para busca local

**3.2 Se Auto (A) ou Manual (M):**

Se auto: Executar MCP call Se manual: Exibir:

```
Digite para o agente:
"Leia a história {CARD} do jira e retorne em formato XML"

Após resposta, cole aqui: [paste]
```

**3.3 Resultado da Busca Jira:**

Se sucesso:

```
✅ História encontrada no Jira
   Card: {CARD}
   Título: {título}

Salvando em XML...
```

Se falha:

```
❌ Falha ao buscar Jira
   Erro: {detalhes}

Buscando arquivo local...
```

- Em caso de falha, prosseguir para seção 4

### 4. Busca de Arquivo Local

Se Jira falhou ou usuário escolheu [L]:

```bash
# Tentar XML primeiro (preferencial)
find {storiesFolder} -iname "{CARD}.xml" 2>/dev/null

# Se não encontrar, tentar PDF
find {storiesFolder} -iname "{CARD}.pdf" 2>/dev/null
```

**Se encontrou XML:**

```
✅ Encontrei arquivo XML: docs/jira/{CARD}.xml

Carregando...
```

**Se encontrou PDF:**

```
📄 Encontrei arquivo PDF: docs/jira/{CARD}.pdf

Carregando...
```

**Se não encontrou nada:**

```
❌ Não encontrei história em docs/jira/:
   - {CARD}.xml
   - {CARD}.pdf

Opções disponíveis:
[1] Colar conteúdo da história manualmente
[2] Fornecer caminho diferente
[3] Continuar com review técnico apenas

Escolha (1/2/3):
```

- **[1]**: Pedir conteúdo para cola, salvar como XML
- **[2]**: Pedir novo caminho, tentar carregar
- **[3]**: Marcar story_available: false

---

## SUCCESS METRICS

- Story source identified (jira/xml/pdf/manual/none)
- Story file located or obtained from user
- Ready to proceed to AC extraction phase
- Story availability status registered
