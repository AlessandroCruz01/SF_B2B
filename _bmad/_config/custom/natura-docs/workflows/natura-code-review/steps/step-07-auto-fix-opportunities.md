---
name: 'step-07-auto-fix-opportunities'
description: 'DEPRECATED - Moved to Step 5C'

# File References
nextStepFile: './step-05c-auto-fix-opportunities.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 7: Auto-Fix Opportunities - DEPRECATED

⚠️ **NOTA:** Este step foi refatorado para otimizar o workflow de branch.

O auto-fix foi movido para a sequência de testes:

- **Step 5C**: Auto-Fix Opportunities & Commit (NOVA LOCALIZAÇÃO)
- **Step 5C-End**: Save State for Branch Transition

O auto-fix agora executa ANTES da geração de outputs, garantindo que:

1. Todas as mudanças sejam commitadas no PR branch
2. O estado seja serializado antes da transição de branch
3. Os outputs sejam gerados no branch correto (docs/code-review)

Redirecionando para Step 5C...

---

**Você será redirecionado automaticamente. Se isso não acontecer:**

Por favor, execute manualmente: `./step-05c-auto-fix-opportunities.md`

## STEP GOAL:

Identificar pequenas correções e melhorias automatizáveis que não envolvem
alteração de lógica, permitir ao usuário aplicar automaticamente com um clique.

## MANDATORY EXECUTION RULES (READ FIRST):

### Universal Rules:

- NEVER auto-fix without user approval (offer menu first)
- CRITICAL: Only fix NON-LOGIC issues
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

#### Option A: Apply All (High Confidence)

Apply all issues marked 🟢 HIGH automatically:

```
Applying auto-fixes...

✅ ClassA.cls: Removed import Map (1 line)
✅ ClassB.cls: Removed 3 obvious comments
✅ ClassC.cls: Fixed indentation (12 lines)
✅ LwcComp.js: Organized imports (5 lines)

Applied: 4 fixes
Skipped: 1 fix (medium confidence)
```

#### Option S: Select Individually

For each auto-fix:

```
[1/5] ClassA.cls - Remove import Map

   Before:
   import java.util.Map;
   import java.util.List;

   After:
   import java.util.List;

Aplicar? [Y]es [N]o [?]Skip Rest
```

- **IF Y**: Apply fix
- **IF N**: Skip fix
- **IF ?**: Skip remaining and go to menu

#### Option N: Skip

```
Auto-fix step skipped. Prosseguindo para decisão final...
```

- Update sidecar with `autofix_applied: false`
- Proceed to nextStepFile

#### Option X: Cancel

Return to previous step.

### 5. Update Sidecar with Applied Fixes

```json
{
  ...existing,
  "current_step": "7",
  "autofix_summary": {
    "total_opportunities": 5,
    "applied": 4,
    "skipped": 1,
    "fixes": [
      {
        "file": "ClassA.cls",
        "issue": "Removed import Map",
        "lines": 1,
        "status": "applied"
      }
    ]
  }
}
```

### 6. Verify Applied Changes

Display files that were modified:

```
## Applied Auto-Fixes Summary

| File | Changes | Type | Status |
|------|---------|------|--------|
| ClassA.cls | -1 import | Code | ✅ Applied |
| ClassB.cls | -3 comments | Style | ✅ Applied |
| ClassC.cls | Format | Style | ✅ Applied |
| LwcComp.js | Organize | Style | ✅ Applied |

**Impact:**
- Files modified: 4
- Lines changed: ~25
- Logic affected: ❌ NONE
- Quality improved: ✅ YES
```

### 7. Proceed to Final Decision

Display: **Auto-fix concluído. Prosseguindo para decisão final...**

#### Menu Handling Logic:

- Após conclusão, atualizar sidecar com `current_step: 7b`
- Imediatamente carregar `{nextStepFile}`

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- Auto-fixable issues identified accurately
- User given menu to select which fixes to apply
- Fixes applied only with user approval
- No logic changes made
- Sidecar updated with applied fixes
- Files modified successfully

### SYSTEM FAILURE:

- Auto-fixing without user menu
- Applying logic-changing fixes
- Not identifying actual issues
- Modifying files without tracking
- Breaking code during fixes

**Master Rule:** All auto-fixes must be user-approved and logic-preserving.

## CRITICAL STEP COMPLETION NOTE

ONLY WHEN auto-fix opportunities are presented, reviewed, and user decides
(apply/skip), will you update sidecar and load `{nextStepFile}` to begin final
decision.
