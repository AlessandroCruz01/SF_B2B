---
name: 'step-05c-end-save-state'
description: 'Serializar estado da sessão para transição de branch'

# File References
nextStepFile: './step-07a-present-summary.md'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 5C End: Save State for Branch Transition

## STEP GOAL:

Serializar o estado completo da sessão (sidecar) para um arquivo temporário
antes de retornar ao branch original. Isto permite que a próxima fase (outputs
no código-review branch) recupere o estado completo sem perder contexto.

## CRITICAL CONTEXT:

**Branch Workflow State:**

1. ✅ User checked out PR branch (step-01)
2. ✅ Collected PR info (step-02a)
3. ✅ Collected story (step-02b)
4. ✅ Analyzed changes (step-03)
5. ✅ Technical review (step-04a)
6. ✅ Functional review (step-04b)
7. ✅ Test execution (step-05a)
8. ✅ Test analysis (step-05b)
9. ✅ Auto-fix & commit (step-05c) ← **CURRENT**
10. ⏳ Save state to /tmp (step-05c-end) ← **NOW**
11. ⏳ Return to original branch
12. ⏳ Checkout code-review branch
13. ⏳ Restore state from /tmp
14. ⏳ Generate outputs

## MANDATORY EXECUTION RULES:

- ONLY save state AFTER all PR branch work is complete
- Include ALL sidecar fields (no partial serialization)
- Use session ID to avoid conflicts if multiple reviews active
- Save to /tmp/{session_id}.json (not permanent storage)
- Validate file was created successfully before proceeding
- Include timestamp for audit trail

## STATE SERIALIZATION SEQUENCE:

### 1. Generate Session ID

Session ID format: `code-review-{pr_number}-{timestamp}`

```bash
# Extract PR number from sidecar
PR_NUMBER=$(jq -r '.pr_number' docs/code-reviews/.code-review-state.json)

# Generate timestamp (YYYY-MM-DD-HH-MM-SS)
TIMESTAMP=$(date '+%Y-%m-%d-%H-%M-%S')

# Create session ID
SESSION_ID="code-review-${PR_NUMBER}-${TIMESTAMP}"

Display:
✓ Session ID generated: ${SESSION_ID}
```

### 2. Validate Sidecar Content

Before serialization, verify sidecar has all required fields:

```json
{
    "session_id": "code-review-{pr_number}-{timestamp}",
    "pr_number": "numeric",
    "pr_title": "string",
    "pr_branch": "string",
    "pr_url": "string",
    "reviewer": "string",
    "story_card": "string",
    "story_source": "jira|local_xml|local_pdf|manual",
    "story_url": "string",
    "acceptance_criteria": "array",
    "files_reviewed": "array",
    "technical_issues": "array",
    "functional_issues": "array",
    "test_coverage_percentage": "number",
    "test_issues": "array",
    "test_quality_issues": "array",
    "autofix_summary": "object",
    "current_step": "5c",
    "timestamp_start": "ISO8601",
    "timestamp_current": "ISO8601"
}
```

**Validation Check:**

```bash
# Check required fields
REQUIRED_FIELDS=("pr_number" "pr_title" "pr_branch" "reviewer" "story_card" \
                 "files_reviewed" "technical_issues" "functional_issues" \
                 "test_coverage_percentage")

for FIELD in "${REQUIRED_FIELDS[@]}"; do
  VALUE=$(jq ".${FIELD}" docs/code-reviews/.code-review-state.json)
  if [ "$VALUE" = "null" ] || [ -z "$VALUE" ]; then
    echo "❌ VALIDATION FAILED: Missing or empty field: ${FIELD}"
    exit 1
  fi
done

echo "✅ Sidecar validation passed - all required fields present"
```

### 3. Add Session Metadata

Before saving, add/update sidecar fields:

```json
{
  ...existing_sidecar,
  "session_id": "${SESSION_ID}",
  "timestamp_start": "${ORIGINAL_START_TIME}",  // From initial step
  "timestamp_state_saved": "$(date -u +'%Y-%m-%dT%H:%M:%SZ')",
  "branch_checkpoint": {
    "original_branch": "${ORIGINAL_BRANCH}",
    "pr_branch": "${CURRENT_BRANCH}",
    "files_modified_by_autofix": "array_of_file_paths",
    "commit_hash_before_autofix": "hash",
    "commit_hash_after_autofix": "hash"
  }
}
```

### 4. Serialize to /tmp

```bash
# Create /tmp directory if needed (Windows: C:\tmp, Linux: /tmp)
if [ "$(uname)" = "Windows_NT" ] || [ -n "$WINDIR" ]; then
  TMP_DIR="C:\tmp"
else
  TMP_DIR="/tmp"
fi

# Ensure directory exists
mkdir -p "$TMP_DIR"

# Serialize sidecar to temporary file
STATE_FILE="${TMP_DIR}/code-review-${SESSION_ID}.json"

jq . docs/code-reviews/.code-review-state.json > "$STATE_FILE"

# Validate file was created
if [ ! -f "$STATE_FILE" ]; then
  echo "❌ FAILED: Could not create state file at ${STATE_FILE}"
  exit 1
fi

# Verify file is valid JSON
if ! jq empty "$STATE_FILE" 2>/dev/null; then
  echo "❌ FAILED: State file is not valid JSON"
  exit 1
fi

echo "✅ State serialized successfully"
echo "   File: ${STATE_FILE}"
echo "   Size: $(wc -c < "$STATE_FILE") bytes"
```

### 5. Display Serialization Summary

```
## State Serialization Complete

✅ Session State Saved

Session ID:   ${SESSION_ID}
Location:     ${TMP_DIR}/code-review-${SESSION_ID}.json
Size:         {file_size} bytes
Fields:       {field_count}
Timestamp:    {ISO8601_timestamp}

PR Information:
- PR #${PR_NUMBER}
- Branch: ${PR_BRANCH}
- Reviewer: ${REVIEWER}

Review State:
- Files reviewed: {count}
- Technical issues: {count}
- Functional issues: {count}
- Test coverage: {percentage}%
- Auto-fixes applied: {count}

Status: ✅ Ready for branch transition

Próxima fase:
1. Return to original branch (${ORIGINAL_BRANCH})
2. Checkout docs/code-review branch
3. Restore state from /tmp
4. Generate final outputs (CSVs + reports)
```

### 6. Cleanup Original Sidecar on PR Branch

```bash
# Remove sidecar from PR branch to avoid conflicts when returning
# (It will be restored on code-review branch from /tmp)

rm docs/code-reviews/.code-review-state.json

git add -A
git commit -m "chore: remove temp state before branch transition"
git push origin $(git rev-parse --abbrev-ref HEAD)

echo "✅ Original sidecar cleaned up from PR branch"
```

## CRITICAL RECOVERY PATTERN

If state file is needed again during same session:

```bash
# Restore function (for manual recovery if needed)
function restore_state_from_tmp() {
  if [ -f "${TMP_DIR}/code-review-${SESSION_ID}.json" ]; then
    cp "${TMP_DIR}/code-review-${SESSION_ID}.json" \
       docs/code-reviews/.code-review-state.json
    echo "✅ State restored from ${TMP_DIR}"
  else
    echo "❌ State file not found for session ${SESSION_ID}"
    return 1
  fi
}
```

## BRANCH TRANSITION CHECKLIST

Before proceeding to nextStepFile, verify:

- [ ] Session ID generated
- [ ] Sidecar validation passed
- [ ] Session metadata added
- [ ] State file created successfully
- [ ] File is valid JSON
- [ ] File readable and not locked
- [ ] Original sidecar removed from PR branch
- [ ] PR branch cleanup committed and pushed

If ANY item fails, display error and offer retry options:

```
Menu:

[R] Retry serialization
[M] Manually save state (advanced)
[C] Cancel and return to previous step
[X] Continue anyway (NOT RECOMMENDED)
```

## NEXT STEP

Once state is successfully serialized:

```bash
echo "Transitioning to next phase..."
echo "Next: Return to original branch and checkout code-review"

# Load nextStepFile
load_step './step-07a-present-summary.md'
```

## SYSTEM SUCCESS/FAILURE METRICS

### SUCCESS:

- Session ID generated correctly
- Sidecar validation passes all required fields
- State file created in /tmp
- File is valid JSON and readable
- Original sidecar removed from PR branch
- Transition to code-review branch possible

### SYSTEM FAILURE:

- Missing required sidecar fields
- File system errors (permissions, space)
- Invalid JSON serialization
- State file locked or unreadable
- Cannot remove original sidecar
- /tmp directory not accessible

**Master Rule:** State must be successfully serialized and validated before
returning to original branch.

## IMPORTANT NOTES

1. **Session ID is Persistent:** Same session ID used throughout branch
   transitions. If user opens another code review, different session ID is
   generated.

2. **Cleanup Schedule:** State files in /tmp are NOT automatically cleaned up.
   Step-07b (Final Decision) will remove /tmp file at workflow end.

3. **Multi-Review Safety:** If user has multiple reviews active simultaneously,
   each gets unique session ID preventing conflicts.

4. **Audit Trail:** Timestamp in session metadata allows tracing state through
   entire workflow.
