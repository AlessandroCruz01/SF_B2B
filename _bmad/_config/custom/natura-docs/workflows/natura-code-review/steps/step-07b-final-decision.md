---
name: 'step-07b-final-decision'
description: 'Decisão final do code review e publicação'
sidecarFile: '{project-root}/docs/code-reviews/.code-review-state.json'
---

# Step 7B: Decisão Final & Publicação

## STEP GOAL

Permitir decisão final (Aprovado/Ressalvas/Reprovado), postar no PR, finalizar.

## MANDATORY RULES

- NEVER proceed without explicit user decision
- CRITICAL: Read complete file before action
- YOU ARE A FACILITATOR, not a decision maker

## FINAL DECISION SEQUENCE

### 1. Ask for Decision

```
## 🎯 Decisão Final

| Opção | Descrição |
|-------|-----------|
| [A] | Aprovado - Pronto para merge |
| [R] | Ressalvas - Pode merge, mas melhorias recomendadas |
| [X] | Reprovado - Correções necessárias |

Selecione: [A] / [R] / [X]
```

### 2. Request Justification

```
Por favor, breve justificativa para a decisão:

Ex: "Bem estruturado, segue padrões. Pequenas melhorias sugeridas."
```

### 3. Update Report

```markdown
## Decisão Final

**Status**: {Aprovado | Ressalvas | Reprovado}  
**Justificativa**: {user input}  
**Revisor**: {reviewer}  
**Data**: {data_atual}
```

### 4. Publish PR Comment

```bash
gh pr comment {branch} --body "$(cat <<'EOF'
## 🔍 Code Review: {card}

**Status**: {emoji} {status}
**Revisor**: {reviewer}

### Resumo
- Arquivos: {total}
- Aprovados: {approved} | Ressalvas: {concerns} | Reprovados: {rejected}
- Cobertura: {coverage}%

### Pontos de Atenção
{critical points summary}

### Decisão
{justification}

---
*Gerado pelo workflow natura-code-review*
EOF
)"
```

**Status emojis:**

- Aprovado: ✅
- Ressalvas: ⚠️
- Reprovado: ❌

### 5. Confirm Publication

```
✅ Comentário publicado no PR #{pr_number}
Link: {pr_url}

Code review concluído!
```

### 6. Restore Original Branch

**If checkout occurred:**

Read from sidecar: `original_branch` and `stash_created`

```
🔄 Restaurando seu ambiente...

Review branch: {branch}
Original: {original_branch}

Retornar para branch original? [S/N]
```

**If [S]:**

```bash
git checkout {original_branch}

if [ "{stash_created}" = "true" ]; then
  git stash pop
fi
```

Result:

```
✅ Retornado para: {original_branch}
{If restored: "✅ Alterações locais restauradas"}
```

**If [N]:**

```
ℹ️ Você está em: {branch}
   Manual: git checkout {original_branch}
   {If stash: "Restaurar: git stash pop"}
```

### 7. Cleanup Session

```bash
# Remove sidecar
rm "{sidecarFile}"

# Cleanup session state
SESSION_ID=$(git config --get code-review.session-id)
if [ "$OS" = "Windows_NT" ]; then
  STATE_FILE="C:\tmp\code-review-${SESSION_ID}.json"
else
  STATE_FILE="/tmp/code-review-${SESSION_ID}.json"
fi

if [ -f "$STATE_FILE" ]; then
  rm "$STATE_FILE"
fi

git config --unset code-review.session-id

echo "✅ Session cleanup complete"
```

### 8. Final Summary

```
## ✅ Code Review Concluído!

| Item | Status |
|------|--------|
| Análise técnica | ✅ |
| Análise funcional | ✅/⏭️ |
| Testes | ✅/⏭️ |
| Relatório MD | ✅ |
| CSVs | ✅ |
| PR comment | ✅ |
| Branch restaurada | ✅/⏭️ |

### Arquivos Gerados
- docs/code-reviews/{card}--code-review.md
- CSVs atualizados

### Próximos Passos

{If approved}
✅ PR pronto para merge

{If concerns}
⚠️ Considere melhorias antes de merge

{If rejected}
❌ Correções necessárias antes de merge

---
Obrigado por usar natura-code-review!
```

---

## SUCCESS METRICS

✓ User explicit decision made ✓ Justification recorded ✓ PR comment posted ✓
Report updated ✓ Sidecar cleaned up ✓ Branch restored (if applicable) ✓ Session
completed

## WORKFLOW COMPLETION

Final step. After completion:

- Session state cleaned
- All artifacts preserved in docs/code-reviews/
- Ready for new review
