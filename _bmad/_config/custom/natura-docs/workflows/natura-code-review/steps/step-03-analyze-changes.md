---
name: 'step-03-analyze-changes'
description: 'Analisar arquivos alterados no PR e classificar por tipo'

# File References
nextStepFile: './step-04a-technical-review.md'
reReviewPath: './step-03-re-review-diff-analysis.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 3: Análise de Alterações

## ⚠️ CRITICAL: RE-REVIEW DETECTION

**ANTES de executar este step, verificar se é um re-review:**

```bash
IS_RE_REVIEW=$(jq -r '.is_re_review // false' docs/code-reviews/.code-review-state.json)

if [ "${IS_RE_REVIEW}" = "true" ]; then
  echo "ℹ️ Re-review detectado!"
  echo "   Redirecionando para análise otimizada de mudanças..."
  echo ""
  echo "Load: ./step-03-re-review-diff-analysis.md"
  exit 0
fi
```

Se `IS_RE_REVIEW = true`, **STOP** e carregar `{reReviewPath}`.

Se `IS_RE_REVIEW = false` ou não existe, continuar com este step (novo review).

---

## STEP GOAL:

Obter a lista de arquivos alterados no PR via GitHub CLI, classificá-los por
tipo (Apex, LWC, Trigger, etc.) e preparar a lista para o code review.

## MANDATORY EXECUTION RULES (READ FIRST):

### Universal Rules:

- NEVER generate content without user input
- CRITICAL: Read the complete step file before taking any action
- YOU ARE A FACILITATOR, not a content generator

### Role Reinforcement:

- You are a **Code Reviewer / Tech Lead** especializado em Salesforce B2B
  Commerce
- Technical analysis mode - objective and systematic
- Classify files accurately based on extension and path

### Step-Specific Rules:

- Focus ONLY on analyzing and classifying files
- FORBIDDEN to start actual code review in this step
- Auto-proceed after classification is complete
- CRITICAL: Check for re-review flag before proceeding

## ANALYSIS SEQUENCE:

### 1. Carregar Estado da Sessão

Ler sidecar file para obter `branch` e `pr_number`.

### 2. Obter Arquivos do PR

Executar comando para listar arquivos alterados:

```bash
gh pr view {branch} --json files,additions,deletions,commits
```

Extrair lista de arquivos com:

- `path`: caminho do arquivo
- `additions`: linhas adicionadas
- `deletions`: linhas removidas

### 3. Classificar Arquivos por Tipo

Para cada arquivo, classificar baseado no path e extensão:

| Padrão                     | Tipo               | Categoria |
| -------------------------- | ------------------ | --------- |
| `*.cls` (sem Test)         | Apex Class         | dev       |
| `*Test.cls`                | Apex Test Class    | test      |
| `*Mock.cls`                | Apex Mock Class    | test      |
| `*Factory.cls`             | Apex Factory Class | test      |
| `*.trigger`                | Apex Trigger       | dev       |
| `lwc/*/*.js`               | LWC JavaScript     | dev       |
| `lwc/*/*.html`             | LWC Template       | dev       |
| `lwc/*/*.css`              | LWC Style          | dev       |
| `aura/*`                   | Aura Component     | dev       |
| `*.field-meta.xml`         | Custom Field       | config    |
| `*.object-meta.xml`        | Custom Object      | config    |
| `*.layout-meta.xml`        | Page Layout        | config    |
| `*.flexipage-meta.xml`     | Lightning Page     | config    |
| `*.permissionset-meta.xml` | Permission Set     | config    |
| `*.profile-meta.xml`       | Profile            | config    |
| `labels/*.xml`             | Custom Labels      | config    |
| `staticresources/*`        | Static Resource    | config    |
| `*.flow-meta.xml`          | Flow               | config    |
| `*.translation-meta.xml`   | Translation        | config    |

### 4. Organizar Lista para Review

Agrupar arquivos por categoria e tipo:

```
## Arquivos para Review

### Desenvolvimento (dev) - X arquivos
| # | Tipo | Arquivo | +/- |
|---|------|---------|-----|
| 1 | Apex Class | B2BProductUploadController.cls | +150/-20 |
| 2 | Apex Class | B2BProductUploadService.cls | +200/-0 |
| 3 | LWC | b2bProductCSVUploader/b2bProductCSVUploader.js | +300/-0 |

### Testes (test) - X arquivos
| # | Tipo | Arquivo | +/- |
|---|------|---------|-----|
| 1 | Test Class | B2BProductUploadControllerTest.cls | +100/-0 |
| 2 | Mock Class | CommerceEngineMock.cls | +50/-0 |

### Configuração (config) - X arquivos
| # | Tipo | Arquivo | +/- |
|---|------|---------|-----|
| 1 | Custom Field | Account.MaximumCreditLimit__c | +20/-0 |
| 2 | Custom Label | Commerce_B2bLoginForm_CodeOrEmailInvalid | +5/-0 |

### Total: X arquivos alterados
```

### 5. Verificar Arquivos Sem Alteração

Se nenhum arquivo foi alterado:

```
⚠️ Nenhum arquivo alterado encontrado neste PR.

Possíveis causas:
- PR ainda não tem commits
- Branch não difere da base

Deseja verificar novamente ou encerrar o review?
```

### 6. Verificar package.xml da NPCV

#### 6.1 Verificar presença do arquivo

Com o `CARD` obtido do sidecar (ex: `NPCV-538`), verificar se o PR contém o
arquivo `manifest/release-03/{card-lowercase}.xml` (ex:
`manifest/release-03/npcv-538.xml`).

```bash
CARD=$(jq -r '.card' docs/code-reviews/.code-review-state.json)
CARD_LOWER=$(echo "${CARD}" | tr '[:upper:]' '[:lower:]')
EXPECTED_MANIFEST="manifest/release-03/${CARD_LOWER}.xml"
EXPECTED_DEPLOY_GUIDE="manifest/release-03/pre-pos-deploy/${CARD}--deploy.md"

# Verificar na lista de arquivos do PR
MANIFEST_FOUND=$(gh pr view {branch} --json files --jq ".files[].path" \
  | grep -i "^${EXPECTED_MANIFEST}$")
```

**Se NÃO encontrado:**

```
⚠️  ATENÇÃO: package.xml da NPCV não encontrado no PR!

   Esperado: ${EXPECTED_MANIFEST}

   Verifique com o desenvolvedor se:
   - O arquivo foi criado e comitado
   - O nome está correto (ex: npcv-538.xml)
   - O arquivo está na pasta manifest/release-03/
```

Registrar
`"manifest_check": { "expected": "${EXPECTED_MANIFEST}", "found": false }` e
pular 6.2 e 6.3.

---

#### 6.2 Cruzar membros do manifest com arquivos alterados no PR

Ler o conteúdo do `${EXPECTED_MANIFEST}` localmente e extrair todos os
`<members>` por `<name>` (tipo):

```bash
# Extrair membros declarados por tipo do package.xml
# Estrutura esperada: <types><members>X</members><name>ApexClass</name></types>
```

Para cada arquivo alterado no PR (obtidos na seção 3), derivar o **member name**
e o **metadata type** conforme a tabela:

| Padrão do path no PR                            | Metadata Type              | Member Name                               |
| ----------------------------------------------- | -------------------------- | ----------------------------------------- |
| `classes/Foo.cls`                               | `ApexClass`                | `Foo`                                     |
| `triggers/FooTrigger.trigger`                   | `ApexTrigger`              | `FooTrigger`                              |
| `lwc/fooComponent/`                             | `LightningComponentBundle` | `fooComponent`                            |
| `aura/fooApp/`                                  | `AuraDefinitionBundle`     | `fooApp`                                  |
| `objects/Obj__c/fields/Field__c.field-meta.xml` | `CustomField`              | `Obj__c.Field__c`                         |
| `objects/Obj__c/Obj__c.object-meta.xml`         | `CustomObject`             | `Obj__c`                                  |
| `layouts/Obj__c-Layout.layout-meta.xml`         | `Layout`                   | `Obj__c-Layout`                           |
| `flexipages/Foo.flexipage-meta.xml`             | `FlexiPage`                | `Foo`                                     |
| `permissionsets/Foo.permissionset-meta.xml`     | `PermissionSet`            | `Foo`                                     |
| `labels/CustomLabels.labels-meta.xml`           | `CustomLabel`              | _(membros individuais — ver nota abaixo)_ |
| `staticresources/Foo`                           | `StaticResource`           | `Foo`                                     |
| `flows/Foo.flow-meta.xml`                       | `Flow`                     | `Foo`                                     |
| `translations/pt_BR.translation-meta.xml`       | `Translations`             | `pt_BR`                                   |

> **Nota CustomLabel:** O arquivo de labels é único
> (`CustomLabels.labels-meta.xml`), mas cada label é um membro separado no
> manifest. Se o arquivo de labels estiver no PR, verificar apenas se
> `CustomLabel` tem pelo menos um membro declarado — não é possível derivar
> automaticamente quais labels foram alteradas.

Para cada arquivo do PR, verificar se o member derivado está presente no
manifest sob o tipo correto.

**Exibir resultado:**

```
✅ package.xml da NPCV: ${EXPECTED_MANIFEST}

📋 Verificação de Membros:

| Tipo           | Membro               | No Manifest? |
|----------------|----------------------|--------------|
| ApexClass      | FooController        | ✅           |
| ApexClass      | FooService           | ✅           |
| CustomField    | Account.NewField__c  | ❌ FALTANDO  |
| LightningComponentBundle | fooLwc    | ✅           |

⚠️  MEMBROS FALTANDO NO MANIFEST (X):
   - [CustomField] Account.NewField__c
   (Adicionar ao manifest antes do deploy)
```

Se todos os membros estiverem presentes:

```
✅ Todos os membros alterados estão declarados no manifest.
```

Registrar no sidecar:

```json
"manifest_check": {
  "expected": "${EXPECTED_MANIFEST}",
  "found": true,
  "missing_members": ["CustomField:Account.NewField__c"],
  "all_present": false
}
```

---

#### 6.3 Verificar guia de pré/pós deploy

Verificar se o PR contém o arquivo de deploy guide da NPCV:
`manifest/release-03/pre-pos-deploy/{CARD}--deploy.md` (ex:
`NPCV-538--deploy.md`).

```bash
DEPLOY_GUIDE_FOUND=$(gh pr view {branch} --json files --jq ".files[].path" \
  | grep -i "^${EXPECTED_DEPLOY_GUIDE}$")
```

**Se encontrado:**

```
✅ Guia de deploy presente: ${EXPECTED_DEPLOY_GUIDE}
```

Ler o conteúdo do arquivo e verificar:

- Se há pelo menos um item preenchido em **Pré-Deploy** ou se a seção está
  marcada como "Nenhum"
- Se há pelo menos um item preenchido em **Pós-Deploy** ou se a seção está
  marcada como "Nenhum"
- Se a seção **Rollback** está preenchida

Exibir resultado:

```
📋 Guia de Deploy (${EXPECTED_DEPLOY_GUIDE}):
   Pré-Deploy:  ✅ preenchido | ⚠️ vazio
   Pós-Deploy:  ✅ preenchido | ⚠️ vazio
   Rollback:    ✅ preenchido | ⚠️ vazio
```

**Se NÃO encontrado:**

```
⚠️  ATENÇÃO: Guia de pré/pós deploy não encontrado no PR!

   Esperado: ${EXPECTED_DEPLOY_GUIDE}

   O desenvolvedor deve criar este arquivo a partir do template:
   manifest/release-03/pre-pos-deploy/NPCV-TEMPLATE--deploy.md
```

Registrar no sidecar:

```json
"deploy_guide_check": {
  "expected": "${EXPECTED_DEPLOY_GUIDE}",
  "found": true|false,
  "pre_deploy_filled": true|false,
  "pos_deploy_filled": true|false,
  "rollback_filled": true|false
}
```

---

### 7. Atualizar Sidecar

Atualizar o sidecar com a lista de arquivos:

```json
{
  ...existing,
  "current_step": 3,
  "files_pending": ["file1.cls", "file2.cls", ...],
  "files_by_category": {
    "dev": [...],
    "test": [...],
    "config": [...]
  },
  "total_files": X,
  "total_additions": X,
  "total_deletions": X,
  "manifest_check": {
    "expected": "manifest/release-03/npcv-XXX.xml",
    "found": true
  },
  "deploy_guide_check": {
    "expected": "manifest/release-03/pre-pos-deploy/NPCV-XXX--deploy.md",
    "found": true
  }
}
```

### 8. Prosseguir Automaticamente

Este step é automático. Após classificação:

```
Análise concluída. {total_files} arquivos identificados para review.

Prosseguindo para o code review...
```

#### Menu Handling Logic:

- Após análise completa, imediatamente carregar `{nextStepFile}`
- Se nenhum arquivo encontrado, perguntar ao usuário se deseja continuar

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- Files retrieved from PR via gh cli
- Files properly classified by type
- Sidecar updated with file list
- Automatic progression to step-04

### SYSTEM FAILURE:

- Not using gh pr view command
- Incorrect file classification
- Not updating sidecar with files
- Manual intervention required for auto step

**Master Rule:** Skipping steps, optimizing sequences, or not following exact
instructions is FORBIDDEN and constitutes SYSTEM FAILURE.

## CRITICAL STEP COMPLETION NOTE

After file analysis is complete and sidecar is updated, immediately load, read
entire file, then execute `{nextStepFile}` to begin code review.
