# Natura Docs

Agentes especializados para consulta da documentacao brownfield do projeto B2B
Commerce Natura. Fornece assistentes com linguagem adaptada para
desenvolvedores, analistas funcionais e arquitetos.

## Overview

Este modulo fornece:

- **3 Agentes Especializados** - Assistentes adaptados para cada perfil de
  usuario
- **Consulta Factual** - Respostas baseadas APENAS na documentacao existente
- **Citacao de Fontes** - Toda resposta indica arquivo:secao de origem
- **Code Review de PR** - Workflow de revisao tecnica/funcional acionado pelo
  agente Architect

## Installation

Instale/atualize o modulo re-rodando o instalador BMad (ele le a fonte em
`_bmad/_config/custom/natura-docs/`) ou invocando a skill de setup:

```
/natura-docs-setup
```

Durante a instalacao, sera perguntado:

- Onde esta a documentacao brownfield do projeto? (default: `docs/project`)

## Components

### Agents (3)

| Agent            | Comando             | Publico-Alvo          | Foco                               |
| ---------------- | ------------------- | --------------------- | ---------------------------------- |
| natura-dev       | `/natura-dev`       | Desenvolvedores       | Codigo, padroes, classes Apex, LWC |
| natura-analyst   | `/natura-analyst`   | Analistas Funcionais  | Regras de negocio, flows, dados    |
| natura-architect | `/natura-architect` | Tech Leads/Arquitetos | Arquitetura, integracoes, decisoes |

### Workflows (1)

| Workflow           | Comando                       | Proposito                                                               |
| ------------------ | ----------------------------- | ----------------------------------------------------------------------- |
| natura-code-review | Menu `CR` do agente Architect | Code review de PR: validacao tecnica, funcional e planilhas de controle |

## Quick Start

1. **Acesse o agente apropriado para seu perfil:**

    ```
    /natura-dev        # Para desenvolvedores
    /natura-analyst    # Para analistas funcionais
    /natura-architect  # Para tech leads/arquitetos
    ```

2. **Faca perguntas sobre o projeto:**

    ```
    Como funciona o padrao Repository neste projeto?
    Quais flows existem para o processo de checkout?
    Qual a arquitetura de integracao com OCI?
    ```

3. **Cada resposta citara a fonte:**

    ```
    📚 Fonte: design-patterns.md:Repository Pattern
    ```

## Documentacao Consultada

Os agentes consultam a seguinte documentacao brownfield:

| Documento                | Conteudo                                     |
| ------------------------ | -------------------------------------------- |
| `design-patterns.md`     | 23 padroes de projeto documentados           |
| `apex-classes.md`        | 308+ classes Apex (Release 01 e 02)          |
| `architecture.md`        | Arquitetura do sistema, camadas, integracoes |
| `lwc-components.md`      | 65 componentes Lightning Web Components      |
| `development-guide.md`   | Setup, convencoes, deploy                    |
| `data-models.md`         | Custom Objects e relacionamentos             |
| `flows-documentation.md` | ~60 Flows B2B documentados                   |
| `project-overview.md`    | Visao geral, stack tecnologico               |
| `code-review.md`         | Checklist de revisao de codigo               |
| `deploy.md`              | Processos de deploy por ambiente             |

## Module Structure (v6)

```
natura-docs/                       # fonte em _bmad/_config/custom/natura-docs/
├── natura-analyst/                # skill v6 de agente (SKILL.md + customize.toml)
├── natura-architect/
├── natura-dev/
├── natura-docs-setup/             # skill de instalacao do modulo
├── workflows/
│   └── natura-code-review/        # workflow.md + steps/ + templates/
├── module.yaml                    # definicao do modulo (inclui roster agents:)
├── module-help.csv                # catalogo de capacidades (bmad-help)
└── README.md                      # este arquivo
```

## Configuration

O modulo pode ser configurado em `_bmad/natura-docs/config.yaml`

**Configuracoes:**

- **docs_path**: Caminho para a documentacao brownfield (default:
  `docs/project`)
- **project_docs_path**: Documentacao por ticket/feature (manual, guides,
  architecture, superpowers)

## Principios

1. **Nunca Inventar** - Agentes respondem APENAS com informacoes documentadas
2. **Sempre Citar** - Toda resposta inclui a fonte (arquivo:secao)
3. **Linguagem Adaptada** - Cada agente usa linguagem apropriada ao seu publico
4. **Admitir Lacunas** - Se algo nao esta documentado, informar claramente

## Requirements

- BMad Method version 6.10.0 ou superior
- Documentacao brownfield do projeto Natura em `docs/project/`

## Author

Criado por Everymind em 2025-12-23. Migrado para as convencoes v6 em 2026-07-28.

---

## Module Details

**Module Code:** natura-docs **Category:** Domain-Specific (Salesforce B2B
Commerce) **Type:** Standard Module **Version:** 1.0.0
