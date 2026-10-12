---
name: 'step-05c-auto-fix-apply'
description: 'Aplicar correções automáticas selecionadas, commitar e fazer push'

# File References
nextStepFile: './step-05c-end-save-state.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 5C-Apply: Apply Auto-Fixes & Commit

## STEP GOAL:

Aplicar as correções automáticas selecionadas pelo usuário, verificar as
mudanças, fazer commit e push para o branch do PR.

## MANDATORY EXECUTION RULES (READ FIRST):

### Universal Rules:

- NEVER make changes that were not selected by user
- CRITICAL: Commit and push all fixes before proceeding
- CRITICAL: Update sidecar with applied fixes summary
- YOU ARE A HELPER, not a code modifier without consent

### Execution Rules:

- Apply only user-selected fixes
- Verify changes are non-logic only
- Commit with standard message
- Push to PR branch

## EXECUTION PROTOCOLS:

- 🎯 Apply selected fixes to files
- 💾 Update sidecar with applied fixes summary
- 📖 Git commit and push operations
- 🚫 FORBIDDEN to proceed without successful git push

## MANDATORY SEQUENCE

### 1. Apply Selected Fixes

Based on user selection from previous step:

**IF user selected [A] (Apply All High Confidence):**

```
Applying all high confidence fixes...

✅ File: Remove unused imports
✅ File: Remove obvious comments
✅ File: Fix indentation
✅ File: Organize imports

Applied: {count} fixes
```

**IF user selected [S] (Select Individually):**

```
Applying individually selected fixes...

[Processing each approved fix...]

Applied: {count} fixes
```

**IF user selected [N] (Skip):**

```
Auto-fix step skipped per user request.
Proceeding to state serialization...
```

- Update sidecar with `autofix_applied: false`
- Load nextStepFile

### 2. Update Sidecar with Applied Fixes

```json
{
  ...existing,
  "current_step": "5c",
  "autofix_summary": {
    "total_opportunities": {count},
    "applied": {count},
    "skipped": {count},
    "fixes": [
      {
        "file": "ClassName.cls",
        "issue": "Issue description",
        "lines": {count},
        "status": "applied"
      }
    ]
  }
}
```

### 3. Verify Applied Changes

Display summary of modified files:

```
## Applied Auto-Fixes Summary

| File | Changes | Type | Status |
|------|---------|------|--------|
| ClassName.cls | -N imports | Code | ✅ Applied |
| ClassName.cls | -N comments | Style | ✅ Applied |
| ClassName.js | Format | Style | ✅ Applied |

**Impact:**
- Files modified: {count}
- Lines changed: ~{count}
- Logic affected: ❌ NONE
- Quality improved: ✅ YES
```

### 4. Git Commit and Push (CRITICAL)

**⚠️ CRITICAL:** Auto-fixes must be committed and pushed to the PR branch.

#### Execution Steps:

```bash
# Stage all auto-fix changes
git add -A

# Display what will be committed
git status

# Commit with standard message
git commit -m "chore: auto-fix cleanup from code review

- Remove unused imports
- Clean up obvious comments
- Fix code formatting inconsistencies
- Organize import statements

Auto-fixed during code review analysis."

# Get current branch name
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Push to PR branch
git push origin ${CURRENT_BRANCH}
```

#### Success Indicator:

```
✅ Auto-fixes committed and pushed to PR

Branch:  {branch-name}
Commit:  chore: auto-fix cleanup from code review
Pushed:  ✅ Success
Files:   {count} modified, ~{count} lines changed

Code review branch will now have access to cleaned up files.
Prosseguindo para salvamento de estado...
```

#### Failure Handling:

If git operations fail:

```
❌ Git Operation Failed

Error: {error message}

Options:
[R] Retry push
[I] Ignore and continue (NOT RECOMMENDED)
[C] Cancel workflow
```

- **[R]**: Retry git push
- **[I]**: Continue anyway
- **[C]**: Cancel and return to previous step

### 5. Menu: Proceed to State Serialization

#### Menu Handling Logic:

- After successful git push, update sidecar with `current_step: 5c`
- Display: "Auto-fix phase complete. Saving session state for branch
  transition..."
- Load and execute {nextStepFile}

---

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- Fixes applied correctly to selected files
- No logic changes made
- Fixes committed with proper message
- Git push successful
- Sidecar updated with applied fixes summary
- Files persisted in PR branch

### SYSTEM FAILURE:

- Applying fixes that weren't selected
- Logic-changing modifications
- Git commit/push failures
- Not updating sidecar
- Breaking code during apply

**Master Rule:** Apply only user-selected fixes, commit with standard message,
and push successfully before proceeding.
