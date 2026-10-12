---
name: 'step-01-init'
description: 'Validar dependências do sistema para code review'

# File References
nextStepFile: './step-01-init-routing.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 1: Inicialização do Code Review

## STEP GOAL:

Validar dependências críticas do sistema (git, gh, sf) e detectar sessão
anterior em andamento. Este step foca exclusivamente em validação de
pré-requisitos.

## MANDATORY EXECUTION RULES:

- NEVER generate content without user input
- CRITICAL: Read this entire file before taking any action
- YOU ARE A FACILITATOR, not a content generator
- Role: Code Reviewer / Tech Lead especializado em Salesforce B2B Commerce
- Focus ONLY on dependency validation

## VALIDATION SEQUENCE:

### 1. Validação de Dependências

Validar as ferramentas necessárias em ordem:

**1.1 Git Repository**

```bash
git rev-parse --git-dir
```

- Se FALHAR: Exibir "ERRO: Execute este workflow dentro de um repositório git"
- Se OK: Continuar

**1.2 GitHub CLI**

```bash
gh auth status
```

- Se FALHAR: Exibir "ERRO: GitHub CLI não autenticado. Execute `gh auth login`
  primeiro"
- Se OK: Continuar

**1.3 Salesforce CLI (Warning Only)**

```bash
sf org display
```

- Se FALHAR: Exibir "WARNING: Salesforce CLI não conectado. Testes de cobertura
  serão pulados."
- Se OK: Continuar
- Armazenar status: `sf_available: true/false`

### 2. Verificar Sessão Anterior

Verificar se existe arquivo de estado sidecar:

```bash
test -f "docs/code-reviews/.code-review-state.json"
```

**Se existe (resumo):**

- Sidecar found: `true`
- Prosseguir para próximo step (routing logic)

**Se não existe:**

- Sidecar found: `false`
- Prosseguir para próximo step (routing logic)

### 3. Mensagem de Status

Exibir validação completa:

```
# Code Review - Natura B2B Commerce

## Validação de Dependências
- Git: ✅ OK
- GitHub CLI: ✅ OK
- Salesforce CLI: ✅ OK / ⚠️ Não conectado

## Estado
- Sessão Anterior: [SIM/NÃO]

Prosseguindo para análise de contexto...
```

---

## SUCCESS METRICS

- All critical dependencies validated (git, gh)
- Sidecar state properly detected
- No errors blocking workflow
- User informed of status
- Ready to proceed to routing logic

## CRITICAL STEP COMPLETION NOTE

ONLY WHEN dependency validation is complete will you either:

- Load `{continueFile}` if sidecar exists (continuation)
- Load `{nextStepFile}` if no sidecar (fresh start)
