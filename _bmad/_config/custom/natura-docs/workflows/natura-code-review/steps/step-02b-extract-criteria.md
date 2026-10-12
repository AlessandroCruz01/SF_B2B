---
name: 'step-02b-extract-criteria'
description: 'Extrair Acceptance Criteria e validar estrutura da história'

# File References
nextStepFile: './step-03-analyze-changes.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
storiesFolder: '{project-root}/docs/jira'
jiraUrl: 'https://natura.atlassian.net/'
advancedElicitationTask: '{project-root}/.agents/skills/bmad-advanced-elicitation/SKILL.md'
partyModeWorkflow: '{project-root}/.agents/skills/bmad-party-mode/SKILL.md'
---

# Step 2b.1: Extração de Acceptance Criteria

## STEP GOAL:

Processar arquivo de história (XML ou PDF), extrair Acceptance Criteria (AC),
validar estrutura e preparar para validação durante o code review.

## ACCEPTANCE CRITERIA EXTRACTION:

### 1. Processar Arquivo de História

**Se arquivo XML:**

```
Arquivo: docs/jira/{CARD}.xml

Estrutura esperada:
<?xml version="1.0" encoding="UTF-8" ?>
<story card="{CARD}">
  <titulo>{título da história}</titulo>
  <objetivo>{objetivo}</objetivo>
  <user-story>
    <como>{persona}</como>
    <quero>{ação desejada}</quero>
    <para-que>{benefício}</para-que>
  </user-story>
  <acceptance-criteria>
    <ac id="1">{critério 1}</ac>
    <ac id="2">{critério 2}</ac>
  </acceptance-criteria>
  <premissas>
    <item>{premissa 1}</item>
  </premissas>
  <observacoes>{observações}</observacoes>
</story>
```

- Validar estructura XML
- Extrair todos os campos `<ac id="...">`
- Armazenar lista de ACs

**Se arquivo PDF:**

- Carregar PDF
- Usar OCR/extração de texto
- Identificar seção de Acceptance Criteria
- Extrair critérios (padrão: linhas iniciadas com "AC-", "Critério", etc)

### 2. Exibir Acceptance Criteria

Se história foi carregada com sucesso:

```
## Acceptance Criteria (AC)

Encontrados {N} critérios:

- AC-1: {descrição completa do critério 1}
- AC-2: {descrição completa do critério 2}
- AC-3: {descrição completa do critério 3}
...

ℹ️ Estes critérios serão validados durante o code review de cada arquivo.

📊 Fonte: [Jira | XML Local | PDF Local | Manual]
```

### 3. Validar Estrutura

Verificar se:

- Pelo menos 1 AC foi encontrado
- ACs contêm descrições não-vazias
- Estrutura está bem-formada

**Se validação OK:**

```
✅ Estrutura válida: {N} ACs extraídos com sucesso
```

**Se validação FALHOU:**

```
⚠️ Aviso: Problema ao extrair ACs
- ACs encontrados: {N}
- Formato: {formato}
- Ação: Você pode revisar/completar manualmente

[C] Continuar com ACs encontrados
[M] Revisar manualmente
[S] Pular validação de AC
```

- **[C]**: Prosseguir com ACs extraídos
- **[M]**: Exibir editor para usuário revisar/corrigir ACs
- **[S]**: Marcar `story_available: false`

### 4. Atualizar Sidecar

Registrar na `{sidecarFile}`:

```json
{
  "story_available": true|false,
  "story_format": "xml|pdf|manual|none",
  "story_source": "jira|local_xml|local_pdf|manual",
  "story_path": "{path_if_found}",
  "story_url": "https://natura.atlassian.net/browse/{CARD}",
  "acceptance_criteria": [
    {"id": "1", "description": "..."},
    {"id": "2", "description": "..."},
    {"id": "3", "description": "..."}
  ],
  "story_title": "{título se disponível}",
  "story_objective": "{objetivo se disponível}",
  "ac_count": {N}
}
```

### 5. Apresentar Menu de Opções

Display: **História processada!**

```
[A] Advanced Elicitation (detalhar ACs)
[P] Party Mode (revisar colaborativo)
[C] Continue (prosseguir para análise)
```

#### Menu Handling Logic:

- **[A]**: Executar `{advancedElicitationTask}`, retornar ao menu
- **[P]**: Executar `{partyModeWorkflow}`, retornar ao menu
- **[C]**: Atualizar sidecar `current_step: 3`, carregar `{nextStepFile}`

#### EXECUTION RULES:

- ALWAYS halt and wait for user input after presenting menu
- ONLY proceed to next step when user selects 'C'
- After [A] or [P], return to menu for new selection
- If invalid input, redisplay menu with help

---

## SUCCESS METRICS

- Acceptance Criteria extracted successfully
- At least 1 AC found and displayed
- Sidecar updated with AC information
- Story source tracked correctly
- User confirmed continuation via menu
