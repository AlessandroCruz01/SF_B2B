Guide - https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-dev-guide.html

---
### [[Get Started with B2B Commerce|B2B Commerce Fundamentals e Arquitetura]]
O B2B Commerce permite criar lojas B2B dinâmicas e atraentes, que aumentam o engajamento do comprador e impulsionam as vendas. Ele funciona como um armazém digital onde as prateleiras virtuais estão sempre abastecidas. O B2B Commerce é perfeito para o ecossistema da Salesforce. Cada loja inclui o mesmo desempenho, segurança e escalabilidade de todas as tecnologias padrão da Salesforce Platform.

A Salesforce Commerce Platform é aberta e extensível. Seus requisitos mínimos de configuração e a  camada de programação declarativa significam que os administradores e os operadores comerciais podem realizar rapidamente as tarefas de desenvolvimento e configuração e da loja.

#### Web Stack com velocidade
O aplicativo ***Commerce*** é executado no *Lightning Web Stack*, que administra o tempoo de execução da Web e o serviçõ de dados, e oferece componentes reutilizáveis baseados na Web. Isso significa que você pode acessar o mesmo modelo de dados declarativo e extensível, e o **AgentExchange*** para aplicativos e parceiros.
![[WebStack.png]]
*O **Lightning Web Runtime (LWR)*** é uma estrutura de aplicativo somente para o LWC projetada a ser rápida e personalizada.

##### Conjunto completo de API
Além disso, a plataforma oferece um conjunto abrangente de APIs e ferramentas de desenvolvimento que simplificam o processo de criação e implantação de aplicativos. Com os modelos de páginas totalmente funcionais do B2B Commerce, os desenvolvedores podem usar essas ferramentas oara criar inferfaces personalizadas, fluxos de trabalho e integrações que aprimoram a experiência geral do cliente e impulsionam o crescimento do negócio.

Os desenvolvedores estão encantadas com o fato do aplicativo do Commerce ter sido criado com base em experiências modernas no padrão da Web.

-  **Produtividade aprimorada com padrões da Web:** Uso de uma linguagem moderna da Web: ES5+, elementos personalizados, classes, módulos e importações.  
    
- **Aberto, transparente e portátil:** Uso de blocos de construção modulares para codificar as experiências desejadas com suas ferramentas preferidas na mesma plataforma.  
    
- **Criado para ser usado em escala empresarial:** Adoção da arquitetura que o Salesforce usa para dimensionar o Lightning, Comunidades e Dispositivos móveis há anos.

#### O modelo de dados do Commerce
O modelo de dados do Commerce conecta os objetos da loja B2B. Os relacionamentos de objetos padrão são compatíveis com uma experiência completa de loja B2B.

- **Catálogo (Catalog):** O catálogo é a coleção completa de produtos oferecidos na loja.  
    
- **Categoria (Category):** Um agrupamento lógico de produtos. Crie várias categorias para uma hierarquia navegável.  
    
- **Política de direitos (Entitlement Policy):** O “segurança” do cliente B2B que gerencia o acesso a produtos e preços.  
    
- **Produto (Product):** Os produtos que estão disponíveis para os clientes.  
    
- **Catálogo de preços (Price Book):** O preço negociado para compradores.  
    
- **Conta do comprador (Buyer Account):** Os dados de B2B que representam um comprador específico.  
    
- **Grupo de compradores (Buyer Group):** Um agrupamento de compradores B2B que compartilham características comuns.

##### O Objeto Store (Loja)
O objeto (Store) Loja, representa o site. É o objeto central do Commerce que oferece maxima flexibilidade para os requisitos comerciais.

As lojas (sites) B2B usam uma abordagem baseada em componente e modelo para a experiência de compra front-end. Os operadores comerciais do Commerce usam os modelos e os componentes Lightning Web Runtime (LWR) para exibir produtos, organizar informações para compradores e processar pedidos para sua loja.

![[DataModel.png]]
###### [[Product and Catalog Data Model|Catálogo (Catalog)]]
Catálogos são o objeto organizacional que permite oferecer produtos em uma loja. Cada loja B2B tem um catálogo específico de produtos. 
![[ProductCatalogModel.png]]

| ![[ProductCatalogModel.png]] | ![[CataalogDataModel.png]] |
| ---------------------------- | -------------------------- |

###### [Categorias (Category)](https://help.salesforce.com/s/articleView?id=commerce.comm_categories_intro.htm&type=5)
As categorias desempenham um papel crucial na organização e apresentação de produtos aos clientes. No modelo de dados do aplicativo Commerce, o objeto Category (Categoria) representa categorias e subcategorias. Esse objeto controla como os clientes pesquisam um produto.

As categorias têm uma estrutura hierárquica que normalmente representa um relacionamento pai-filho. Um único catálogo inclui categorias e subcategorias de até cinco níveis. Use a estrutura em forma de árvore para criar agrupamentos de produtos que facilitam a navegação dos clientes e a localização de produtos semelhantes ou que pertencem a uma categoria específica.

![[catalogoDePrecos.png]]

###### [Produtos (Product2)](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_product2.htm?q=PriceBook2)
O objeto Produto lista cada um dos produtos em forma de um registro. O registro do produto contém dados como descrições do produto, especificações e links para mídia do produto que ajudam os clientes a tomar decisões fundamentadas. Cada produto tem seu próprio número de identificação da Unidade de manutenção de estoque (SKU).

###### [Catálogos de preços  (Pricebook2)](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_pricebook2.htm?q=PriceBook2)
O objeto Catálogo de preços gerencia e organiza os preços dos produtos. Ele desempenha um papel crucial na determinação dos preços unitários de produtos ou serviços. É necessário um catálogo de preços para exibir preços de oportunidades, cotações e pedidos.

O modelo de dados aceita um catálogo de preços padrão juntamente com catálogos de preços personalizados vinculados a grupos de compradores. Você também pode configurar um catálogo de preços com preços riscados que destaca preços reduzidos para clientes -> [[Price Book Data Limits|Limites do Pricebook2]].

![[ProductToCategory.png]]

###### Compradores e grupos de compradores (Buyer & Buyer Groups)
- **[Comprador ( Buyer )](https://help.salesforce.com/s/articleView?id=commerce.comm_person_buyer_accounts.htm&type=5)** - Um comprador é uma pessoa ou um contato associado a uma empresa ou organização que compra produtos ou serviços. Os compradores recebem funções, responsabilidades e permissões relacionadas ao processo de compra. Um comprador pode ser associado a uma conta específica ou a um grupo de compradores.
- **[Grupo de compradores ( Buyer Group )](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_groups.htm&type=5)** - Um grupo de compradores é uma coleção de compradores individuais ou atributos em comuns. Os grupos de compradores geralmente sçao organizados com base em fatores como o tipo de empresa, setor ou preferências de compra.

![[BuyerGroupDataModel.png]]

###### [Políticas de direitos (Entitlement Policy)](https://help.salesforce.com/s/articleView?id=commerce.comm_entitlement_policies_intro.htm&type=5)
Uma Política de direitos é um objeto que aplica condições específicas para o acesso do comprador a determinados produtos e preços. Os grupos de compradores são vinculados às políticas de direitos.  

Por exemplo, uma política de direitos pode especificar que um grupo de compradores ou determinado nível ou com um nível de assinatura específica tem direito a acessar produtos ou serviços premium.

![[Policy.png]]

| **Modelos de página do Commerce** |                              |
| --------------------------------- | ---------------------------- |
| Início                            | Confirmação do pedido        |
| Carrinho                          | Pesquisa do pedido           |
| Categoria                         | Detalhes do resumo do pedido |
| Checkout                          | Lista de resumo do pedido    |
| Login                             | Processamento de pagamentos  |
| Minha Lista                       | Pesquisa de produtos         |
| Meu perfil                        | Remessas divididas           |

#### [Buyers](https://www.youtube.com/watch?v=osV6XD7CdUE&t=135s), [Buyer Groups](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-data-model-shopper-buyer-groups-accounts-limits.html) e [Access & Entitlements](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_groups_b2c.htm&type=5)
No **Salesforce B2B Commerce**, os conceitos de **Buyers (Compradores)**, **Buyer Groups (Grupos de Compradores)** e **Access (Acesso/Entitlements)** formam a espinha dorsal da arquitetura de relacionamento e permissões. Juntos, eles determinam quem é o cliente, o que ele pode ver na loja e quais preços ele pagará

##### Buyer ( Compradores )
Um "Buyer" no B2B Commerce representa a entidade comercial ou o usuário que realiza as compras no portal

- [**Buyer Account (Conta de Comprador):**](https://help.salesforce.com/s/articleView?id=commerce.comm_add_buyer_accounts_to_buyer_group.htm&type=5) É uma conta padrão do Salesforce (geralmente uma conta de negócios/pj) que foi explicitamente habilitada como "Buyer". Isso ativa capacidades comerciais para a organização.
- [**Buyer User (Usuário Comprador):**](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_access.htm&type=5) São os contatos vinculados a essa Conta de Comprador. Eles ganham acesso ao portal por meio de licenças de comunidade (como a _Customer Community Plus_) e recebem **Permission Sets** específicos (ex: _B2B Commerce User_ ou _Buyer Manager_) para gerenciar carrinhos, pedidos ou comprar em nome de outras subcontas.

##### [Buyer Group (Grupos de Compradores)](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_groups.htm&type=5)
Os **Buyer Groups** funcionam como seletores ou "tags" de segmentação em massa. Em vez de configurar preços e catálogos para milhares de contas individualmente, você agrupa contas semelhantes dentro de um Buyer Group.

- Uma Conta de Comprador pode pertencer a um ou mais Buyer Groups.
- É no nível do Buyer Group que as regras de negócio de atacado, como tabelas de preços específicas por canal, região ou nível de parceria, são centralizadas.

##### Access & Entitlements (Acesso e Elegibilidade)
O acesso à loja e a visibilidade dos produtos não funcionam como no e-commerce tradicional (B2C), onde tudo é aberto. No B2B, o **Access** é estritamente controlado por meio do cruzamento de objetos:

- [**Store Association:**](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_groups_b2c.htm&type=5) O primeiro nível de acesso. Um **Buyer Group** precisa estar formalmente associado a uma **Store (Loja)** para que os membros desse grupo consigam sequer fazer login e visualizar o portal
- [**Entitlement Policies (Políticas de Elegibilidade):**](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_groups_b2c.htm&type=5) Ditam **quais produtos** um grupo pode visualizar. A política de elegibilidade vincula um catálogo ou categorias de produtos específicos a um Buyer Group. Se uma conta não tiver uma política de elegibilidade ativa associada ao seu grupo, a vitrine da loja aparecerá completamente vazia para o comprador.
- [**Price Books (Livros de Preços):**](https://www.youtube.com/watch?v=DMcfc9lCNgw) Ditam **quanto** o comprador pagará. Os Price Books contendo os preços negociados ou de tabela são diretamente vinculados ao Buyer Group.

---

![[FlowBuyers.png]]

---

##### Limites e Boas Práticas Comuns
- **Limites de Dados:** O Salesforce possui limites flexíveis (_soft limits_) altos para escala (ex: até 10 milhões de contas de compradores por grupo), mas o ecossistema funciona melhor quando segmentado de forma inteligente por demografia ou faixas comerciais para não sobrecarregar as consultas de preços.
- [**Extensibilidade (Apex):**](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_CommerceBuyGrp_BuyerGroupEvaluationService.htm) Se a atribuição estática de grupos não for suficiente para o seu modelo de negócios, é possível usar a classe `CommerceBuyGrp.BuyerGroupEvaluationService` via **Apex** para determinar dinamicamente a qual grupo o comprador pertence em tempo de execução (ex: com base em uma integração de ERP externa)

---

##### Hands-on — Dynamic Buyer Group Evaluation (Commerce Extension)
Implementação prática de uma **Buyer Group Evaluation Service**, extensão que permite substituir/complementar a atribuição estática de Buyer Groups por uma regra dinâmica avaliada em tempo de execução, toda vez que o comprador acessa a storefront.

####### Requisito de negócio
Contas com o campo customizado `BuyerSegment__c = 'GOLD'` devem ser adicionadas dinamicamente a um Buyer Group específico (`Dynamic Gold`), enquanto as demais contas recebem o Buyer Group padrão (`Dynamic Standard`). A regra é avaliada a cada chamada, sem depender de atribuição manual de membros no Buyer Group.

###### Arquitetura da solução (Service + Provider)
Para manter a classe de extensão testável (mockável via `@TestVisible`) e livre de SOQL direto no meio da lógica de negócio, a implementação foi dividida em duas classes:

- **`BuyerSegmentEvaluationService`** — a extensão em si. Estende `CommerceBuyGrp.BuyerGroupEvaluationService` e sobrescreve `getBuyerGroupIds`, que é o método invocado pela plataforma Commerce durante a avaliação do Buyer Group do comprador.
- **`BuyerSegmentEvaluationProvider`** — classe `virtual` responsável apenas pelas consultas de suporte: buscar a conta com seu `BuyerSegment__c` e resolver o Id do Buyer Group correspondente ao segmento via Custom Metadata. Separar isso do Service permite substituir o provider por um mock nos testes unitários.
- **`Buyer_Segment_Group_Mapping__mdt`** — Custom Metadata Type criado para guardar o mapeamento `segmento → Id do Buyer Group` (ver seção "Troubleshooting" abaixo para o porquê disso ser necessário em vez de consultar `BuyerGroup`/`WebStoreBuyerGroup` diretamente).

```apex
// BuyerSegmentEvaluationProvider.cls
public virtual inherited sharing class BuyerSegmentEvaluationProvider {
    public virtual Account getBuyerAccount(String accountId){
        return [
            SELECT Id, BuyerSegment__c
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ][0];
    }

    // BuyerGroup e WebStoreBuyerGroup nao sao acessiveis via SOQL quando o codigo
    // executa no contexto de um usuario de portal/comunidade (o caso real do buyer
    // navegando a storefront) - so para usuarios internos (ver "Troubleshooting").
    // getInstance() le de Custom Metadata, legivel por qualquer tipo de usuario.
    public virtual Buyer_Segment_Group_Mapping__mdt getBuyerGroupMapping(String segmentCode) {
        return Buyer_Segment_Group_Mapping__mdt.getInstance(segmentCode);
    }
}
```

```apex
// BuyerSegmentEvaluationService.cls
public without sharing class BuyerSegmentEvaluationService extends CommerceBuyGrp.BuyerGroupEvaluationService {

    @TestVisible
    private BuyerSegmentEvaluationProvider provider;

    public BuyerSegmentEvaluationService() {
        this.provider = new BuyerSegmentEvaluationProvider();
    }

    public override CommerceBuyGrp.BuyerGroupResponse getBuyerGroupIds(
        CommerceBuyGrp.BuyerGroupRequest request
    ) {
        // Boa prática da Salesforce Commerce: sempre chamar a lógica da superclasse primeiro,
        // preservando o comportamento padrão antes de adicionar a customização.
        CommerceBuyGrp.BuyerGroupResponse defaultResponse = super.getBuyerGroupIds(request);

        String goldSegment = 'GOLD';
        String accountId = request.getAccountId();
        String storeId = request.getStoreId();

        if (String.isBlank(accountId)) {
            return defaultResponse;
        }

        Account buyerAccount = provider.getBuyerAccount(accountId);

        String segmentCode = (buyerAccount.BuyerSegment__c == goldSegment) ? 'GOLD' : 'STANDARD';

        Buyer_Segment_Group_Mapping__mdt mapping = provider.getBuyerGroupMapping(segmentCode);

        if (mapping == null || String.isBlank(mapping.Buyer_Group_Id__c)) {
            return defaultResponse;
        }

        Id targetBuyerGroupId = (Id) mapping.Buyer_Group_Id__c;

        Set<String> buyerGroupIds = new Set<String>(defaultResponse.getBuyerGroupIds());
        buyerGroupIds.add(String.valueOf(targetBuyerGroupId));
        return new CommerceBuyGrp.BuyerGroupResponse(buyerGroupIds);
    }
}
```

###### Fluxo de execução
1. A plataforma Commerce chama `getBuyerGroupIds` toda vez que precisa resolver os Buyer Groups do comprador atual (ex: para aplicar preço/catálogo na storefront).
2. `super.getBuyerGroupIds(request)` roda primeiro, garantindo que a atribuição estática padrão continue funcionando.
3. O `accountId` e o `storeId` vêm do `BuyerGroupRequest`. Se não houver conta (usuário guest, por exemplo), a resposta padrão é retornada sem alteração.
4. O provider busca `BuyerSegment__c` na conta e decide entre o código de segmento `'GOLD'` e `'STANDARD'`.
5. O provider resolve o `Buyer_Group_Id__c` correspondente via `Buyer_Segment_Group_Mapping__mdt.getInstance(segmentCode)` (Custom Metadata).
6. Se encontrado, o `Id` dinâmico é somado (`Set`) aos IDs já retornados pela avaliação padrão, e uma nova `BuyerGroupResponse` é devolvida.

###### Registrando a extensão (Commerce Extensions API)
Depois de implementar e implantar (`sf project deploy`) as classes Apex, é necessário **registrar** a classe como provider de uma extensão do domínio Commerce (`Commerce_Domain_BuyerGroup_EvaluationService`) para que a plataforma passe a chamá-la em vez do serviço padrão.

```json
// register-buyer-group-extension.json
{
    "name": "BuyerSegmentEvaluationService",
    "epn": "Commerce_Domain_BuyerGroup_EvaluationService",
    "type": "apexClass",
    "description": "Dynamic Buyer Group evaluation based on BuyerSegment__c",
    "isApplication": false,
    "apexClass": {
        "classId": "01pbm00000UjzdxAAB",
        "className": "BuyerSegmentEvaluationService"
    }
}
```

> `classId` é o Id do registro `ApexClass` na org (obtido via Setup ou uma query `SELECT Id FROM ApexClass WHERE Name = 'BuyerSegmentEvaluationService'`) — precisa ser atualizado por org, já que o Id muda entre sandboxes/scratch orgs.

Script usado para registrar a extensão via REST API (`commerce/extension/providers`):

```bash
sf api request rest "/services/data/v67.0/commerce/extension/providers" --method POST --body "@register-buyer-group-extension.json" --target-org My-B2B
```

Resposta obtida (registro criado com sucesso, `id` gerado pela plataforma para o provider):

```json
{
  "apexClass": {
    "classId": "01pbm00000UjzdxAAB",
    "className": "BuyerSegmentEvaluationService",
    "namespace": "",
    "version": "67.0"
  },
  "configUrl": "",
  "description": "Dynamic Buyer Group evaluation based on BuyerSegment__c",
  "effectiveMappings": [],
  "epn": "Commerce_Domain_BuyerGroup_EvaluationService",
  "iconUri": "",
  "id": "1uubm000000Bf9VAAS",
  "isApplication": false,
  "name": "BuyerSegmentEvaluationService",
  "type": "ApexClass"
}
```

O `id` retornado (`1uubm000000Bf9VAAS`) identifica o **provider da extensão** registrado na org (diferente do `classId`, que é o Id da classe Apex) — é esse `id` que passa a ser referenciado ao associar a extensão a uma Store/EPN mapping.

Depois de registrada, a extensão também precisa ser **associada à Store** (Setup > Commerce App > loja > Extensions, ou via API equivalente) para passar a valer na avaliação dos compradores daquela loja específica.

###### Troubleshooting — `WebStoreBuyerGroup` não é Apex-queryable
Ao testar a extensão já registrada na store, a execução falhou em produção/log com:

```
FATAL_ERROR System.QueryException: sObject type 'WebStoreBuyerGroup' is not supported.
If you are attempting to use a custom object, be sure to append the '__c' after the entity name.
```

Isso é contraintuitivo porque o objeto existe e é referenciado na documentação oficial do modelo de dados de Commerce. Diagnóstico feito:

1. **Describe via CLI** (`sf sobject describe --sobject WebStoreBuyerGroup --target-org My-B2B`) mostrou `"queryable": true`, com os campos esperados (`WebStoreId`, `BuyerGroupId`, relationshipName `BuyerGroup`).
2. **Query via REST/CLI** funcionou normalmente:
   ```bash
   sf data query --query "SELECT Id, WebStoreId, BuyerGroupId, BuyerGroup.Name FROM WebStoreBuyerGroup" --target-org My-B2B
   ```
   Retornou os 3 Buyer Groups da store (`B2B Buyer Group`, `Dynamic Standard`, `Dynamic Gold`) sem erro.
3. **Mesma query dentro de Apex** (via `sf apex run`, Execute Anonymous) reproduziu o `FATAL_ERROR`.

Conclusão inicial (na época): `WebStoreBuyerGroup` é exposto para a camada REST/Connect (por isso `sf data query` e o describe funcionam), mas **não é reconhecido pelo compilador/runtime de SOQL dentro do Apex** — mesmo com `queryable: true` no describe. Coerente com o fato de o exemplo oficial da Salesforce (`BuyerGroupEvaluationServiceSample`, no repositório [forcedotcom/commerce-extensibility](https://github.com/forcedotcom/commerce-extensibility)) evitar esse objeto por completo.

**Fix aplicado nesse momento:** trocar a query de `WebStoreBuyerGroup` por uma query direta em `BuyerGroup` (escopada só por nome). Testado com `sf apex run` chamando `provider.getBuyerGroups(...)` como usuário admin interno — funcionou, sem erro.

> ⚠️ Essa conclusão estava incompleta — ver a seção seguinte. O teste foi feito como usuário interno, e o problema real só aparece com um usuário de portal/comprador.

###### Troubleshooting 2 — `BuyerGroup` também falha, mas só para usuários de portal
Depois do fix acima, um novo `FATAL_ERROR` apareceu — agora reclamando de `BuyerGroup`, o objeto que tínhamos acabado de trocar para resolver o primeiro bug:

```
FATAL_ERROR System.QueryException: sObject type 'BuyerGroup' is not supported...
Class.BuyerSegmentEvaluationProvider.getBuyerGroups: line 31, column 1
Class.BuyerSegmentEvaluationService.getBuyerGroupIds: line 54, column 1
```

Isso pareceu contradizer o teste anterior, que tinha funcionado. A diferença estava no **usuário que executa o código**:

```bash
sf data query --query "SELECT Id, LogUserId, Operation, Request, StartTime, Status FROM ApexLog ORDER BY StartTime DESC LIMIT 5" --target-org My-B2B
```

O log do erro real tinha `Operation: UniversalPerfLogger`, `Request: Api`, e `LogUserId` apontando para:

```bash
sf data query --query "SELECT Id, Name, Username, UserType, ProfileId FROM User WHERE Id = '005bm00000X0kZKAAZ'" --target-org My-B2B
# → Name: "Commerce B2B", UserType: "PowerCustomerSuccess"
```

`PowerCustomerSuccess` é o UserType de um **usuário de portal/Experience Cloud** (um comprador Customer Community Plus) — bem diferente do usuário admin interno usado no teste anterior via `sf apex run`. Conclusão definitiva: **`BuyerGroup` e `WebStoreBuyerGroup` só são acessíveis via SOQL para usuários internos.** Para qualquer usuário de portal ou guest (ou seja, o cenário real de alguém comprando na storefront), o mesmo `QueryException` genérico aparece — o describe/REST funcionar e um teste como admin passar não garantem nada sobre o comportamento para o buyer de verdade.

**Fix definitivo:** parar de depender de SOQL em objetos padrão de Commerce dentro da extensão, e resolver o mapeamento `segmento → Buyer Group Id` via **Custom Metadata Type**, que é legível por qualquer tipo de usuário (guest, portal, interno) sem precisar de sharing/CRUD especial — exatamente o motivo pelo qual o exemplo oficial da Salesforce usa objetos próprios (`__c`/`__mdt`) em vez de `BuyerGroup`/`WebStoreBuyerGroup`.

Metadata criada:
- `Buyer_Segment_Group_Mapping__mdt` — Custom Metadata Type, `visibility = Public`.
- Campo `Buyer_Group_Id__c` (Text, 18, required) — guarda o Id do Buyer Group correspondente.
- Registros: `Buyer_Segment_Group_Mapping.GOLD` → Id de `Dynamic Gold`; `Buyer_Segment_Group_Mapping.STANDARD` → Id de `Dynamic Standard`.

```xml
<!-- objects/Buyer_Segment_Group_Mapping__mdt/Buyer_Segment_Group_Mapping__mdt.object-meta.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<CustomObject xmlns="http://soap.sforce.com/2006/04/metadata">
    <description>Maps a BuyerSegment__c code (GOLD, STANDARD) to the Buyer Group Id...</description>
    <label>Buyer Segment Group Mapping</label>
    <pluralLabel>Buyer Segment Group Mappings</pluralLabel>
    <visibility>Public</visibility>
</CustomObject>
```

```xml
<!-- customMetadata/Buyer_Segment_Group_Mapping.GOLD.md-meta.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" fullName="Buyer_Segment_Group_Mapping.GOLD">
    <label>GOLD</label>
    <protected>false</protected>
    <values>
        <field>Buyer_Group_Id__c</field>
        <value xsi:type="xsd:string" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">0ZIbm000000Czm5GAC</value>
    </values>
</CustomMetadata>
```

Provider atualizado para ler do Custom Metadata em vez de fazer SOQL:

```apex
public virtual Buyer_Segment_Group_Mapping__mdt getBuyerGroupMapping(String segmentCode) {
    return Buyer_Segment_Group_Mapping__mdt.getInstance(segmentCode);
}
```

Validado com `sf apex run` chamando `provider.getBuyerGroupMapping('GOLD')` / `('STANDARD')` — ambos retornaram o `Buyer_Group_Id__c` correto sem erro.

**Duas pegadinhas de deploy encontradas no caminho:**
1. `<deploymentStatus>Deployed</deploymentStatus>` no `.object-meta.xml` de um Custom Metadata Type gera o erro `Cannot specify: deploymentStatus for Custom Metadata Type` — essa tag é só para Custom Object normal, não para `__mdt`.
2. Nos registros `.md-meta.xml`, declarar só `xmlns:xsi` e usar `xsi:type="xsd:string"` sem também declarar `xmlns:xsd="http://www.w3.org/2001/XMLSchema"` faz o deploy falhar com um `UNKNOWN_EXCEPTION` genérico do servidor (sem mensagem clara apontando pro XML) — as duas declarações de namespace precisam estar juntas no elemento `<value>`.

**Trade-off assumido:** a resolução não é mais escopada por `storeId` (era assim desde o fix anterior) — se duas stores diferentes usarem os mesmos códigos de segmento com Buyer Groups diferentes, seria necessário um campo adicional no Custom Metadata para diferenciar por loja. Não é um problema nesse projeto (uma única store).

###### Pontos de atenção / aprendizados
- `getBuyerGroupIds` deve sempre preservar o resultado de `super.getBuyerGroupIds()` como base — nunca substituí-lo por completo, para não quebrar a atribuição estática já configurada.
- `BuyerGroup` e `WebStoreBuyerGroup` funcionam via REST/Connect API e para usuários internos via Apex, mas **não são queryable via Apex para usuários de portal/guest** — o cenário real de quem usa essa extensão. Nunca validar esse tipo de extensão só como admin interno.
- Configuração que precisa ser lida pelo buyer em tempo real (guest, portal, ou interno) deve morar em Custom Metadata Type (ou Custom Object com sharing explícito para o perfil do comprador) — nunca em objetos padrão de Commerce como `BuyerGroup`.
- Separar Service (lógica/override) de Provider (acesso a dados) é o que permite `@TestVisible` trocar o provider por um mock nos testes, sem depender de dados reais na org durante o teste unitário.
- O `classId` no JSON de registro é específico da org — precisa ser reobtido a cada novo ambiente (sandbox, scratch org, produção).
- Ao investigar um `QueryException` "estranho" (objeto existe mas SOQL recusa), vale testar a mesma query em duas camadas diferentes — `sf data query` (REST) vs `sf apex run` (Apex) — e, mais importante, checar **qual usuário** de fato disparou o erro real via `ApexLog.LogUserId`, já que o mesmo código pode se comportar diferente para admin interno vs. usuário de portal/guest.
- `<deploymentStatus>` não é válido em `.object-meta.xml` de Custom Metadata Type; e registros de Custom Metadata (`.md-meta.xml`) exigem declarar `xmlns:xsi` **e** `xmlns:xsd` juntos quando usam `xsi:type="xsd:string"`, senão o deploy falha com `UNKNOWN_EXCEPTION` genérico.