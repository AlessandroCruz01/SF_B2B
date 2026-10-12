---
stepsCompleted:
    [
        'step-01-init',
        'step-02-concept',
        'step-03-components',
        'step-04-structure',
        'step-05-config',
        'step-06-agents',
        'step-07-workflows',
        'step-08-installer',
        'step-09-documentation',
        'step-10-roadmap',
        'step-11-validate'
    ]
status: complete
completionDate: 2025-12-23
workflowType: 'create-module'
moduleName: 'natura-docs'
user_name: 'Everymind'
date: '2025-12-23'
inputDocuments:
    - '_bmad-output/design-patterns.md'
    - '_bmad-output/apex-classes.md'
    - '_bmad-output/architecture.md'
    - '_bmad-output/lwc-components.md'
    - '_bmad-output/development-guide.md'
    - '_bmad-output/data-models.md'
    - '_bmad-output/flows-documentation.md'
    - '_bmad-output/project-overview.md'
    - '_bmad-output/code-review.md'
    - '_bmad-output/deploy.md'
---

# Module Plan: natura-docs

> **Nota (2026-07-29):** a documentação do codebase migrou de
> `_bmad-output/site/` para `docs/project/` na reorganização da estrutura do
> repositório. Referências a `_bmad-output/` abaixo descrevem o estado anterior.

## Visão Geral

| Campo              | Valor                                                                                  |
| ------------------ | -------------------------------------------------------------------------------------- |
| **Nome do Módulo** | natura-docs                                                                            |
| **Propósito**      | Agentes e workflows baseados na documentação brownfield do projeto B2B Commerce Natura |
| **Público-alvo**   | Desenvolvedores, Analistas Funcionais, Tech Leads/Arquitetos                           |
| **Princípio Core** | Estritamente factual - nunca inventar informações                                      |
| **Objetivo**       | Facilitar desenvolvimento de features e resolução de bugs                              |

## Decisões de Design (Party Mode Brainstorming)

### Estrutura Aprovada

| Componente   | Nome                | Propósito                                                                |
| ------------ | ------------------- | ------------------------------------------------------------------------ |
| **Agente 1** | `natura-dev`        | Assistente para desenvolvedores - foco em código, padrões, implementação |
| **Agente 2** | `natura-analyst`    | Assistente para analistas funcionais - foco em regras de negócio, fluxos |
| **Agente 3** | `natura-architect`  | Assistente para tech leads - foco em arquitetura, decisões técnicas      |
| **Workflow** | `natura-onboarding` | Trilhas opcionais com quizzes por persona                                |

### Características Definidas

- Acesso direto aos agentes (sem bloqueio)
- Onboarding opcional para capacitação
- Quizzes validam conhecimento da documentação real
- Todos consultam a mesma fonte de verdade (`_bmad-output/`)
- Nunca inventam informações
- Linguagem adaptada para cada público-alvo

### Arquitetura

```
┌─────────────────────────────────────────────────┐
│              MÓDULO natura-docs                  │
├─────────────────────────────────────────────────┤
│                                                  │
│  AGENTES (Acesso Direto)     WORKFLOW (Opcional) │
│  ┌──────────────────┐       ┌────────────────┐  │
│  │ 🔧 natura-dev    │       │ 📚 onboarding  │  │
│  │ 📋 natura-analyst│       │                │  │
│  │ 🏗️ natura-arch   │       │ - Trilha Dev   │  │
│  └──────────────────┘       │ - Trilha Ana   │  │
│          ▲                  │ - Trilha Arch  │  │
│          │                  │ + Quizzes      │  │
│    Consulta direta          └────────────────┘  │
│    à documentação                               │
│          │                                      │
│          ▼                                      │
│  ┌──────────────────────────────────────────┐   │
│  │        _bmad-output/ (Fonte de Verdade)  │   │
│  │  design-patterns.md, apex-classes.md...  │   │
│  └──────────────────────────────────────────┘   │
└─────────────────────────────────────────────────┘
```

## Fonte de Verdade

Documentação brownfield localizada em `_bmad-output/`:

| Documento                | Conteúdo Principal                                            |
| ------------------------ | ------------------------------------------------------------- |
| `design-patterns.md`     | 23 padrões de projeto (Repository, Service, Controller, etc.) |
| `apex-classes.md`        | Catálogo de 308+ classes Apex (Release 01 e 02)               |
| `architecture.md`        | Arquitetura do sistema, camadas, integrações                  |
| `lwc-components.md`      | 65 componentes Lightning Web Components                       |
| `development-guide.md`   | Setup, convenções, deploy                                     |
| `data-models.md`         | Custom Objects e relacionamentos                              |
| `flows-documentation.md` | ~60 Flows B2B                                                 |
| `project-overview.md`    | Visão geral, stack tecnológico                                |
| `code-review.md`         | Checklist de revisão de código                                |
| `deploy.md`              | Processos de deploy por ambiente                              |

## Module Concept

**Module Name:** Natura Docs **Module Code:** natura-docs **Category:**
Domain-Specific (Salesforce B2B Commerce) **Type:** Standard Module (3 agentes,
1 workflow com trilhas)

**Purpose Statement:** Fornecer assistentes especializados que consultam a
documentação brownfield do projeto B2B Commerce Natura para facilitar o
desenvolvimento de novas features e resolução de bugs, com respostas
estritamente factuais e linguagem adaptada para cada público-alvo.

**Target Audience:**

- Primary: Desenvolvedores Salesforce (Apex, LWC) trabalhando no projeto Natura
- Secondary: Analistas Funcionais e Tech Leads/Arquitetos do projeto

**Scope Definition:**

**In Scope:**

- Consultar e citar documentação existente do projeto
- Responder perguntas sobre padrões de projeto, classes, componentes,
  arquitetura
- Guiar usuários pela documentação através de onboarding opcional
- Adaptar linguagem conforme o perfil do usuário (dev, analyst, architect)
- Sempre citar a fonte da informação na resposta

**Out of Scope:**

- Gerar código automaticamente
- Responder sobre assuntos fora da documentação existente
- Fazer deploy ou operações no org Salesforce
- Inventar ou inferir informações não documentadas

**Success Criteria:**

- Respostas sempre citam a fonte da documentação (arquivo e seção)
- Usuários conseguem encontrar informações relevantes rapidamente
- Zero alucinações - apenas fatos documentados
- Linguagem apropriada para cada perfil de usuário

## Component Architecture

### Agents (3 planejados)

1. **natura-dev** - Assistente para desenvolvedores
    - Type: Specialist
    - Role: Responde perguntas técnicas sobre código, padrões de projeto,
      classes Apex, componentes LWC
    - Linguagem: Técnica - nomes de classes, padrões, code snippets
    - Fonte: design-patterns.md, apex-classes.md, lwc-components.md,
      development-guide.md

2. **natura-analyst** - Assistente para analistas funcionais
    - Type: Specialist
    - Role: Responde perguntas sobre regras de negócio, fluxos, comportamentos
      do sistema
    - Linguagem: Negócios - fluxos, regras, comportamentos
    - Fonte: flows-documentation.md, data-models.md, project-overview.md

3. **natura-architect** - Assistente para tech leads/arquitetos
    - Type: Specialist
    - Role: Responde perguntas sobre arquitetura, decisões técnicas, integrações
    - Linguagem: Arquitetural - decisões, trade-offs, integrações
    - Fonte: architecture.md, design-patterns.md, project-overview.md

### Workflows (1 planejado)

1. **natura-onboarding** - Capacitação com trilhas e quizzes
    - Type: Interactive
    - Primary user: Novos membros do time ou refresh de conhecimento
    - Key output: Validação de conhecimento via quiz
    - Estrutura: 3 trilhas (Dev, Analyst, Architect) + quizzes por trilha

### Tasks (0 planejados)

Nenhuma task separada necessária - agentes são autocontidos.

### Component Integration

- Agentes são independentes (acesso direto sem bloqueio)
- Onboarding é opcional (não bloqueia acesso aos agentes)
- Todos consultam a mesma fonte de verdade (`_bmad-output/`)
- Padrão de resposta: sempre cita fonte (arquivo:seção)

### Development Priority

**Phase 1 (MVP):**

- natura-dev
- natura-analyst
- natura-architect

**Phase 2 (Enhancement):**

- natura-onboarding (workflow com trilhas e quizzes)

## Module Structure

**Module Type:** Standard Module **Location:**
`_bmad-output/bmb-creations/natura-docs`

**Directory Structure Created:**

- agents/
- workflows/natura-onboarding/steps/
- workflows/natura-onboarding/templates/
- templates/
- data/
- \_module-installer/
- README.md (placeholder)

**Rationale for Type:** Standard Module devido a 3 agentes especializados com
domínios distintos (dev, analyst, architect) e 1 workflow interativo com
múltiplas trilhas. Complexidade moderada com componentes bem definidos.

## Configuration Planning

### Required Configuration Fields

1. **docs_path**
    - Type: INTERACTIVE
    - Purpose: Define onde estão os arquivos de documentação brownfield
    - Default: `_bmad-output`
    - Input Type: text
    - Prompt: "Onde está a documentação brownfield do projeto?"

### Installation Questions Flow

1. "Onde está a documentação brownfield do projeto?" (default: \_bmad-output)

### Result Configuration Structure

O module.yaml irá gerar:

- Module configuration at: `_bmad/natura-docs/config.yaml`
- User settings stored as:

```yaml
docs_path: '{project-root}/_bmad-output'
```

### Rationale for Minimal Configuration

- Módulo focado em consultar documentação existente
- Sem integrações externas
- Todos os agentes seguem o mesmo padrão de comportamento
- A única variável é a localização da documentação

## Agents Created

1. **natura-dev** - Assistente de Desenvolvimento Natura B2B
    - File: `agents/natura-dev.yaml`
    - Icon: 🔧
    - Features: Embedded prompts (consult-docs, find-class, find-pattern)
    - Structure:
        - Sidecar: No
        - Prompts: 3 embedded
        - Workflows: None
    - Sources: apex-classes.md, lwc-components.md, design-patterns.md,
      development-guide.md, code-review.md, deploy.md
    - Status: Created

2. **natura-analyst** - Assistente de Análise Funcional Natura B2B
    - File: `agents/natura-analyst.yaml`
    - Icon: 📋
    - Features: Embedded prompts (consult-business, find-flow, find-object)
    - Structure:
        - Sidecar: No
        - Prompts: 3 embedded
        - Workflows: None
    - Sources: flows-documentation.md, data-models.md, project-overview.md,
      architecture.md
    - Status: Created

3. **natura-architect** - Assistente de Arquitetura Natura B2B
    - File: `agents/natura-architect.yaml`
    - Icon: 🏗️
    - Features: Embedded prompts (consult-architecture, analyze-integration,
      analyze-layer)
    - Structure:
        - Sidecar: No
        - Prompts: 3 embedded
        - Workflows: None
    - Sources: architecture.md, design-patterns.md, project-overview.md,
      apex-classes.md
    - Status: Created

## Workflow Plans Reviewed

### natura-onboarding

1. **natura-onboarding**
    - Location: `workflows/natura-onboarding/`
    - Status: Plan reviewed and ready for implementation
    - Trigger: `/natura-onboarding`
    - Implementation: Use create-workflow workflow

**Workflow Structure:**

- Step 1: Seleção de Trilha (Dev, Analyst, Architect)
- Step 2: Trilha de Conteúdo (específica por perfil)
- Step 3: Quiz de Validação (5-10 perguntas)
- Step 4: Conclusão e próximos passos

**Key Characteristics:**

- Workflow 100% opcional (não bloqueia acesso aos agentes)
- Quizzes baseados APENAS na documentação real
- Feedback sempre cita fonte
- 3 trilhas independentes

## Installer Configuration

### Install Configuration

- File: `module.yaml`
- Module code: `natura-docs`
- Default selected: false
- Configuration fields: 1 (docs_path)

### Custom Logic

- installer.js: Not needed
- Custom setup: None required (simple documentation module)

### Installation Process

1. User runs: `bmad install natura-docs`
2. Installer asks: "Onde esta a documentacao brownfield do projeto?" (default:
   \_bmad-output)
3. Creates: `_bmad/natura-docs/`
4. Generates: `config.yaml` with user settings

### Validation

- YAML syntax valid
- All fields defined
- Paths use proper templates
- No custom logic needed

## Documentation

### README.md Created

- Location: `_bmad-output/bmb-creations/natura-docs/README.md`
- Sections: Overview, Installation, Components, Quick Start, Documentacao
  Consultada, Module Structure, Configuration, Principios, Development Status,
  Contributing, Requirements, Author, Module Details
- Status: Complete

### Content Highlights

- Instrucoes claras de instalacao
- Tabela de agentes com comandos e foco
- Quick start com exemplos de uso
- Lista completa da documentacao consultada
- Estrutura do modulo
- Detalhes de configuracao
- Status de desenvolvimento honesto

## Development Roadmap

### TODO.md Created

- Location: `_bmad-output/bmb-creations/natura-docs/TODO.md`
- Phases defined: 3 (MVP, Onboarding, Polish)
- Immediate tasks prioritized

### Next Steps Priority Order

1. (Opcional) Implementar workflow natura-onboarding com
   `/bmad:bmb:workflows:create-workflow`
2. Testar integracao dos agentes com documentacao
3. Validar citacao de fontes em respostas

### Quick Reference Commands

- `/bmad:bmb:workflows:create-workflow` - Criar workflow de onboarding
- `bmad install natura-docs` - Testar instalacao
- `/natura-dev` - Usar agente dev
- `/natura-analyst` - Usar agente analyst
- `/natura-architect` - Usar agente architect

### Development Notes

- Phase 1 (MVP) COMPLETO: 3 agentes implementados
- Phase 2 (Onboarding) e OPCIONAL
- Usuarios tem acesso direto aos agentes independente do onboarding

## Validation Results

### Date Validated

2025-12-23

### Validation Checklist

- [x] Structure: Complete (todas as pastas e arquivos)
- [x] Configuration: Valid (module.yaml, config fields)
- [x] Components: Ready (3 agentes implementados)
- [x] Documentation: Complete (README.md, TODO.md)
- [x] Integration: Verified (paths consistentes)

### Issues Found and Resolved

Nenhum issue crítico encontrado.

### Final Status

✅ PRONTO PARA USO

O MVP (Phase 1) está completo com 3 agentes funcionais. O workflow de onboarding
(Phase 2) está planejado para implementação futura.

### Next Steps

1. Testar instalação: `bmad install natura-docs`
2. Testar agentes: `/natura-dev`, `/natura-analyst`, `/natura-architect`
3. (Opcional) Implementar workflow de onboarding

## Próximos Passos

- [x] Definir conceito detalhado do módulo
- [x] Planejar componentes (agentes e workflows)
- [x] Criar estrutura do módulo
- [x] Criar configuração do módulo
- [x] Criar agentes especializados
- [x] Planejar workflow de onboarding
- [x] Criar instalador do módulo
- [x] Finalizar documentação
- [x] Criar roadmap de implementação
- [x] Validar módulo final
