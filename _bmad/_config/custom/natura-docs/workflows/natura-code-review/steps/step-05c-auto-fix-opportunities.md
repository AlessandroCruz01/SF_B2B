---
name: 'step-05c-auto-fix-opportunities'
description:
    'Identificar oportunidades de correções automáticas (discovery phase)'

# File References
nextStepFile: './step-05c-auto-fix-apply.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 5C: Auto-Fix Opportunities & Commit

## ⚠️ NOTE: BUG REVIEW

**Para bug reviews**, auto-fixes são geralmente PULADOS:

```bash
IS_BUG_REVIEW=$(jq -r '.is_bug_review // false' docs/code-reviews/.code-review-state.json)

if [ "${IS_BUG_REVIEW}" = "true" ]; then
  echo "ℹ️ Bug review detectado!"
  echo "   Auto-fixes não são recomendados para bug fixes."
  echo "   (Queremos manter mudanças mínimas)"
  echo ""
  echo "Pulando para próxima fase (state save)..."

  # Skip auto-fix and go to next step
  load_step './step-05c-end-save-state.md'
  exit 0
fi
```

Se `IS_BUG_REVIEW = true`, **SKIP** auto-fix e ir para `{nextStepFile}`.

---

## STEP GOAL:

Identificar pequenas correções e melhorias automatizáveis que não envolvem
alteração de lógica, permitir ao usuário aplicar automaticamente com um clique,
e comitar+fazer push das mudanças para o PR antes de retornar ao branch
original.

## CRITICAL REQUIREMENT:

**Auto-fixes MUST be committed and pushed to the PR branch BEFORE returning to
the original branch.** This ensures all fixes are persisted in the PR and
available for the code review branch state management.

**NOTE:** For bug reviews, auto-fixes are typically skipped to keep changes
minimal.

## MANDATORY EXECUTION RULES (READ FIRST):

### Universal Rules:

- NEVER auto-fix without user approval (offer menu first)
- CRITICAL: Only fix NON-LOGIC issues
- CRITICAL: Skip auto-fix for bug reviews (keep changes minimal)
- CRITICAL: Commit+push all fixes before proceeding to next step
- YOU ARE A HELPER, not a code modifier without consent

### Scope Definition:

**ALLOWED Auto-Fixes (Non-Logic):**

- ✅ Remove unused imports
- ✅ Organize imports (alphabetical)
- ✅ Remove obvious comments (e.g., `// getter method`)
- ✅ Fix whitespace/indentation inconsistencies
- ✅ Convert hardcoded strings to constants
- ✅ Rename private variables to follow convention
- ✅ Add missing @override annotations
- ✅ Fix quote style consistency (single/double)

**FORBIDDEN Auto-Fixes (Logic Changes):**

- ❌ Refactor method logic
- ❌ Change visibility modifiers (public→private for public APIs)
- ❌ Modify business rules or calculations
- ❌ Change exception handling strategy
- ❌ Rename public methods/properties

## AUTO-FIX SEQUENCE:

### 1. Load Review Results

From sidecar, extract:

- `observations`: Observações do código review
- `technical`: Problemas técnicos identificados
- `files_reviewed`: Arquivos revisados

Display:

```
## Auto-Fix Opportunities

Analisando código para oportunidades de correção automática...

Procurando por:
- Imports não utilizados
- Comentários óbvios
- Espaçamento inconsistente
- String literals (converter para constants)
- Convenção de nomenclatura
```

### 2. Scan for Auto-Fixable Issues

For each file in `files_reviewed`, check for:

#### 2.1 Unused Imports

```bash
# Apex: Check for imports not referenced in code
# LWC: Check for imports not used in imports
```

Pattern: `import X from Y` but `X` never used in file.

**Example Issue:**

```
- ClassA.cls: Remove unused import `Map`
```

#### 2.2 Obvious Comments

Pattern: Comment that just repeats code.

**Examples:**

```
// getter method
public String getName() { ... }

// increment counter
counter++;

// null check
if (value == null) { ... }
```

#### 2.3 Whitespace Issues

Pattern: Inconsistent spacing, blank lines, indentation.

**Examples:**

```
- File has mixed spaces/tabs → normalize to project standard
- Multiple blank lines between methods → normalize to 1
- Inconsistent indentation in blocks
```

#### 2.4 Hardcoded Strings

Pattern: String literal that appears multiple times or is a constant.

**Examples:**

```
- "B2B_STOCK_ERROR" used 3 times → create constant STOCK_ERROR
- "2024-01-01" format used 5 times → use DateConstant
```

#### 2.5 Naming Convention Issues

Pattern: Variables/methods not following project convention.

**Examples:**

```
- Private variable `userData` → should be `userData_` (Apex convention)
- Method `fetchData()` → should be `getFetchedData()`
```

#### 2.6 Missing Annotations

Pattern: Methods that override parent but missing @Override.

**Example:**

```
// Missing @Override
public String toString() { ... }
```

### 3. Compile Auto-Fix Options

```
## Available Auto-Fixes

| # | File | Issue | Type | Lines | Confidence |
|---|------|-------|------|-------|------------|
| 1 | ClassA.cls | Remove import Map | Code | 1 | 🟢 HIGH |
| 2 | ClassB.cls | Remove obvious comments | Style | 3 | 🟢 HIGH |
| 3 | ClassC.cls | Fix indentation | Format | 12 | 🟢 HIGH |
| 4 | ClassD.cls | Extract string constant | Refactor | 2 | 🟡 MEDIUM |
| 5 | LwcComp.js | Organize imports | Style | 5 | 🟢 HIGH |

**Total:** 5 opportunities identified
- 🟢 High Confidence: 4
- 🟡 Medium Confidence: 1
- 🔴 Low Confidence: 0
```

### 4. Menu: Select Auto-Fixes to Apply

```
## Apply Auto-Fixes?

Selecione quais correções deseja aplicar:

[A] Apply ALL auto-fixes (high confidence only)
[S] Select specific fixes individually
[N] Skip auto-fix step
[X] Cancel (back to main menu)
```

**Proceed to next step for applying fixes...**

#### Menu Handling Logic:

- IF A: Update sidecar with selection, load, read entire file, then execute
  {nextStepFile}
- IF S: Load, read entire file, then execute {nextStepFile} with selection
- IF N: Skip auto-fix, directly load and execute {nextStepFile} with skip flag
- IF X: Return to previous step

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- Auto-fixable issues identified accurately
- Comprehensive list compiled for user review
- User menu presented with clear options

### SYSTEM FAILURE:

- Issues not identified properly
- Menu not presented to user
- Not proceeding to next step

**Master Rule:** Identify auto-fix opportunities and present menu to user.
