# Code Review: {card}

## Informações Gerais

| Campo             | Valor                     |
| ----------------- | ------------------------- |
| **Branch**        | {branch}                  |
| **PR**            | #{pr_number} - {pr_title} |
| **Desenvolvedor** | {desenvolvedor}           |
| **Reviewer**      | {reviewer}                |
| **Data**          | {data}                    |
| **Status**        | {status}                  |

---

## Resumo Executivo

{Parágrafo resumindo o escopo e resultado geral do code review. Incluir
principais pontos positivos e áreas de atenção identificadas.}

---

## Aderência à História

### Acceptance Criteria

| AC   | Descrição   | Status    | Implementado em | Observações |
| ---- | ----------- | --------- | --------------- | ----------- |
| AC-1 | {descrição} | ✅/❌/N/A | {arquivos}      | {obs}       |
| AC-2 | {descrição} | ✅/❌/N/A | {arquivos}      | {obs}       |

### Implementações Não Previstas

{Lista de implementações que não estavam nos ACs originais, ou "Nenhuma
implementação fora do escopo identificada."}

---

## Arquivos Revisados

### Apex Classes

| Arquivo       | Status   | Observações   |
| ------------- | -------- | ------------- |
| {arquivo}.cls | ✅/⚠️/❌ | {observações} |

### Apex Test Classes

| Arquivo           | Status   | Observações   |
| ----------------- | -------- | ------------- |
| {arquivo}Test.cls | ✅/⚠️/❌ | {observações} |

### LWC Components

| Componente   | Status   | Observações   |
| ------------ | -------- | ------------- |
| {componente} | ✅/⚠️/❌ | {observações} |

### Triggers

| Trigger           | Status   | Observações   |
| ----------------- | -------- | ------------- |
| {trigger}.trigger | ✅/⚠️/❌ | {observações} |

### Configurações

| Componente   | Tipo   | Status   | Observações   |
| ------------ | ------ | -------- | ------------- |
| {componente} | {tipo} | ✅/⚠️/❌ | {observações} |

---

## Análise de Testes

### Resumo da Execução

| Métrica           | Valor     |
| ----------------- | --------- |
| Testes Executados | {total}   |
| Passando          | {passing} |
| Falhando          | {failing} |
| Tempo Total       | {time} ms |

### Cobertura por Classe

| Classe   | Classe de Teste | Cobertura | Tempo (ms) | Tipo              |
| -------- | --------------- | --------- | ---------- | ----------------- |
| {classe} | {teste}         | {X}%      | {ms}       | Mockado/Integrado |

### Classes Sem Teste

| Classe   | Motivo                         |
| -------- | ------------------------------ |
| {classe} | {motivo ou "Não identificado"} |

---

## Qualidades Identificadas

{Lista de pontos positivos encontrados durante o review}

- ✅ {Qualidade 1}
- ✅ {Qualidade 2}
- ✅ {Qualidade 3}

---

## Pontos de Atenção

### Críticos

{Problemas que bloqueiam a aprovação}

- ❌ {Problema crítico 1}
- ❌ {Problema crítico 2}

### Importantes

{Problemas que devem ser considerados, mas não bloqueiam}

- ⚠️ {Problema importante 1}
- ⚠️ {Problema importante 2}

### Sugestões de Melhoria

{Melhorias opcionais para futuras iterações}

- 💡 {Sugestão 1}
- 💡 {Sugestão 2}

---

## Análise de Coerência

{Avaliação da coerência entre os arquivos alterados}

- [ ] Nomenclatura consistente entre arquivos
- [ ] Controllers usam Services corretamente
- [ ] Services usam Repositories corretamente
- [ ] Testes cobrem as classes alteradas
- [ ] Não há duplicação de lógica
- [ ] Dependências estão corretas

### Observações de Coerência

{Observações específicas sobre a coerência do conjunto}

---

## Decisão Final

| Campo               | Valor                                           |
| ------------------- | ----------------------------------------------- |
| **Status**          | {Aprovado / Aprovado com Ressalvas / Reprovado} |
| **Justificativa**   | {Justificativa do revisor}                      |
| **Revisor**         | {reviewer}                                      |
| **Data da Decisão** | {data}                                          |

---

## Próximos Passos

{Baseado na decisão}

**Se Aprovado:**

- PR está pronto para merge
- Seguir processo de deploy padrão

**Se Aprovado com Ressalvas:**

- Considerar implementar melhorias sugeridas em próxima iteração
- PR pode ser mergeado
- Criar tickets para melhorias, se necessário

**Se Reprovado:**

- Implementar correções listadas em "Pontos Críticos"
- Fazer novo push na branch
- Solicitar re-review

---

_Gerado automaticamente pelo workflow natura-code-review_ _Data de geração:
{data_geracao}_
