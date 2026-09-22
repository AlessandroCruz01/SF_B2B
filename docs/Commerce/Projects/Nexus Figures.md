## Phase 01. Commerce Foundation
![[mermaid-diagram (25).png]]

[**Salesforce B2B Commerce**](https://help.salesforce.com/s/articleView?id=sf.comm_intro.htm&language=en_US&type=5&utm_source=chatgpt.com) é a solução de comércio B2B da Salesforce, executada diretamente sobre a Salesforce Platform. Ela permite construir lojas digitais para empresas, utilizando dados como Accounts, Products, Price Books, Buyers, Carts e Orders.

![[mermaid-diagram (26).png]]

**Docs Oficiais**
- [Salesforce B2B Commerce](https://help.salesforce.com/s/articleView?id=commerce.comm_intro.htm&type=5&utm_source=chatgpt.com)
- [Get Started with Salesforce Commerce](https://help.salesforce.com/s/articleView?id=commerce.comm_get_started.htm&type=5)


### 1. Commerce Setup
![[mermaid-diagram (28).png]]

#### Commerce Setup
**Commerce App** é a principal interface administrativa para configurar e operar uma B2B Commerce Store.

É onde vamos acessar progressivamente:

```
Stores
Customers
Products
Catalog
Pricing
Search
Checkout
Inventory
Settings
...
```

O Commerce App **não é o storefront**.
![[mermaid-diagram (29).png]]

#### Commerce Setup Assistant
[**Commerce Setup Assistant**](https://help.salesforce.com/s/articleView?id=release-notes.rn_comm_setup_assist.htm&language=en_US&release=244&type=5&utm_source=chatgpt.com) automatiza configurações necessárias da org para utilizar Salesforce Commerce, incluindo preferências, layouts e determinados recursos Commerce.
![[mermaid-diagram (30).png]]

#### [WebStoreNetwork](https://developer.salesforce.com/docs/data/data-cloud-dmo-mapping/guide/c360dm-commerce-webstorenetwork.html?utm_source=chatgpt.com)
Existe um objeto chamado:

```
WebStoreNetwork
```

> **`WebStoreNetwork` representa a associação entre uma WebStore e um Experience Cloud Site.** A documentação Salesforce descreve explicitamente `WebStoreNetwork` dessa forma. [Developer](https://developer.salesforce.com/docs/data/data-cloud-dmo-mapping/guide/c360dm-commerce-webstorenetwork.html?utm_source=chatgpt.com)Esse objeto é muito importante para entender a arquitetura.

![[mermaid-diagram (31).png]]

Salesforce inclusive permite alterar programaticamente a associação da store com um site atualizando o `WebStoreNetwork`, respeitando as restrições da [plataforma](https://help.salesforce.com/s/articleView?id=release-notes.rn_comm.htm&language=en_US&release=242&type=5&utm_source=chatgpt.com).

Na sua org, tente:
```
SELECT Id, WebStoreId, SiteId
FROM WebStoreNetwork
```

#### LWR
**[LWR — Lightning Web Runtime](https://developer.salesforce.com/docs/commerce/lwr-migration/guide/get-started.html?utm_source=chatgpt.com)** — é a arquitetura utilizada pelo storefront moderno do Salesforce B2B Commerce. Ela utiliza uma arquitetura leve e composable baseada em Lightning Web Components.

Para stores novas, Salesforce direciona o desenvolvimento para o template B2B baseado em **LWR**; stores Aura mais antigas ainda podem existir e ser migradas

![[mermaid-diagram (32).png]]

LWR pertence à **camada de experiência/runtime do storefront**.

##### Por que LWR importa para um developer?
A Salesforce fornece uma biblioteca de componentes **[Commerce LWR](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-public-lwr-library.html?utm_source=chatgpt.com)** e suporta componentes customizados colocados no Experience Builder

### 2. WebStore
[**WebStore**](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-dev-data-model.html?utm_source=chatgpt.com) é o objeto que representa uma Commerce Store dentro do [modelo de dados do Salesforc](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-dev-data-model.html?utm_source=chatgpt.com)e. No data model oficial, o objeto responsável por representar a store é **`WebStore`**. Ele contém propriedades da loja, como idiomas, moedas e outras configurações.
O WebStore funciona como uma referência central para vários recursos Commerce.![[mermaid-diagram (2).png]]

### 3. Experience Cloud
[**Experience Cloud**](https://help.salesforce.com/s/articleView?id=commerce.comm_create_store_on_site.htm&type=5&utm_source=chatgpt.com) fornece o site através do qual os compradores externos acessam a B2B Commerce Store.![[mermaid-diagram (3).png]]

Para que serve:
- acesso ao site;
- páginas;
- navegação;
- usuários externos;
- membership;
- autenticação;
- domínio.

| Buyer<br>  ↓<br>Nexus Figures Experience Cloud Site<br>  ↓<br>Nexus Figures B2B Store |
| ------------------------------------------------------------------------------------- |

### 4. LWR - Lightning Web Runtime
[**LWR (Lightning Web Runtime)**](https://help.salesforce.com/s/articleView?id=commerce.comm_lwr_aura_comps.htm&language=en_US&type=5&utm_source=chatgpt.com) é a arquitetura usada pelas stores B2B modernas para entregar páginas e componentes do storefront com foco em performance e customização baseada em Lightning Web Components.

B2B Store
├── Aura       ← arquitetura antiga
└── LWR        ← arquitetura atual para novas stores

### 5. Commerce Setup Assistant
[**Commerce Setup Assistant**](https://help.salesforce.com/s/articleView?id=commerce.comm_quick_start.htm&type=5&utm_source=chatgpt.com) é o assistente guiado da Salesforce para preparar uma org para Commerce e auxiliar na criação inicial da store.

![[mermaid-diagram (4).png]]

### 6. Commerce Store
A [**Commerce Store**](https://help.salesforce.com/s/articleView?id=000397155&language=en_US&type=1&utm_source=chatgpt.com) é a configuração administrativa da loja no [Commerce App](https://help.salesforce.com/s/articleView?id=000397155&language=en_US&type=1&utm_source=chatgpt.com). Ela centraliza recursos e configurações usados para construir e operar o storefront.

![[mermaid-diagram (5).png]]

### 7. Website Design vs Experience Builder
[**Website Design:**](https://help.salesforce.com/s/articleView?id=commerce.comm_customize_template.htm&language=en_US&type=5&utm_source=chatgpt.com) branding e estilos gerais.  
[**Experience Builder:**](https://help.salesforce.com/s/articleView?id=sf.comm_experience_builder.htm&language=en_US&type=5&utm_source=chatgpt.com) estrutura, páginas e componentes do storefront.

![[mermaid-diagram (6).png]]

### 8. Permissions e Store Access
O acesso a uma B2B Store depende de Experience Cloud membership, licenses, profiles e permission sets.

![[mermaid-diagram (7).png]]

Experience Cloud Membership
        +
Commerce Permissions
        =
Access funcional

### 9. Publish vs Activate
**Publish** publica as alterações do storefront. **Activate** disponibiliza a store para compradores.

![[mermaid-diagram (8).png]]

### Arquitetura da Phase 1
![[mermaid-diagram (9) 3.png]]

## Phase 02. Buyers & Buyer Context
Como Salesforce identifica quem está comprando, em nome de qual empresa, em qual store e quais regras comerciais devem ser aplicadas a essa compra?
A documentação principal continua sendo o [B2B Commerce Developer Guide](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-dev-guide.html).

Documentação
- **[Configure a Business Account](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_accounts.htm&language=en_US&type=5&utm_source=chatgpt.com)**

Em B2B Commerce, a empresa compradora é representada por uma **Account habilitada como Buyer Account**. Pessoas dessa empresa são Contacts habilitados como Experience Cloud Users. Buyer Groups segmentam essas empresas para determinar acesso à store e, posteriormente, produtos, entitlements, pricing e promotions.

![[mermaid-diagram (33).png]]

### 🏢 Business Account - A empresa
`Account` continua sendo o objeto CRM padrão que representa a empresa.

[**Business Account**](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_accounts.htm&language=en_US&type=5&utm_source=chatgpt.com) representa a empresa cliente que compra da Nexus Figures.
Para utilizar uma Business Account no Commerce, ela precisa ser habilitada como **Buyer Account**.

**BuyerAccount representa uma Account habilitada para atuar como compradora no Commerce.** Ele contém informações Commerce relacionadas à empresa compradora, incluindo informações financeiras e limites utilizados em cenários B2B.

Objeto: ***BuyerAccount***

O data model oficial define `BuyerAccount` como o objeto que contém informações financeiras do **[buyer/shopper](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-dev-data-model.html)**, incluindo credit e order limits relevantes a B2B.

![[mermaid-diagram (34).png]]

Habilitar como buyer **não transforma** a Account em outro objeto.
Temos uma Account e uma representação Commerce associada.

### O que "Enable as Buyer" realmente faz?
Na interface:
```
Account
	→ Actions
	→ Enable as Buyer
```

Mas tecnicamente existe criação/ativação de `BuyerAccount`.
Para habilitação em massa, a própria [Salesforce documenta](https://help.salesforce.com/s/articleView?id=commerce.comm_mass_buyer_update.htm&language=en_US&type=5&utm_source=chatgpt.com) a criação de `BuyerAccount` usando:
```
BuyerId = Account.Id
IsActive = TRUE
```
e alerta para colocar automações na criação de `BuyerAccount`, e não no checkbox `Account.IsBuyer`

![[mermaid-diagram (35).png]]

### 👨‍💼 Contact -  A pessoa
Contact representa a pessoa que trabalha para a empresa compradora.
Uma Account pode possuir vários compradores:

![[mermaid-diagram (36).png]]

### User - identidade/autenticação
O Contact por si só não é a credencial de acesso.
Precisamos habilitá-lo como Customer User.
User representa a identidade Salesforce utilizada para autenticação no Experience Cloud.

![[mermaid-diagram (37).png]]

### "Buyer" não deve ser tratado como apenas um objeto
![[mermaid-diagram (38).png]]

### Effective Account - conceito crítico de B2B
**[Effective Account](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_access.htm&language=en_US&type=5&utm_source=chatgpt.com)** é a Account em nome da qual a operação Commerce está sendo executada naquele momento.
```
User's Account
      =
Effective Account
```

Um Buyer Manager pode receber acesso para comprar em nome de outra Account. Salesforce oferece inclusive Account Switcher para esses cenários.

![[mermaid-diagram (39).png]]

Se selecionar Rio:
```
Logged User:
Regional Buyer

Effective Account:
Rio Branch
```

E então Commerce deve calcular:
```
Entitlements
Pricing
Cart
Orders
Addresses
```

no contexto apropriado.

### Effective Account API
No LWR existe inclusive:

```
commerce/effectiveAccountApi
```

A Storefront API permite ler/alterar o Account ID e nome usados como **[effective account](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-display-lwc-apis.html?utm_source=chatgpt.com)** na sessão.
Conceitualmente:

```
effectiveAccount.accountId
effectiveAccount.accountName
```

![[mermaid-diagram (40).png]]

### BuyerGroup
**[BuyerGroup](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-dev-data-model.html)** agrupa compradores que compartilham determinadas regras comerciais, como entitlements, price books e produtos.
É exatamente assim que o data model oficial descreve Buyer Group.
Na Nexus Figures:

![[mermaid-diagram (41).png]]

Agora esses grupos são apenas **segmentação**.
Nas próximas fases eles ganharão comportamento:

```
BuyerGroup
├── Entitlements
├── Price Books
├── Promotions
└── Store Access
```

### BuyerGroupMember
**Objeto: *BuyerGroupMember***
**[BuyerGroupMember](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-dev-data-model.html)** é o objeto de associação utilizado para relacionar buyers ao Buyer Group.
A Salesforce lista explicitamente `BuyerGroupMember` no Commerce Data Model.

![[mermaid-diagram (42).png]]

### BuyerGroup ↔ WebStore
Também existe uma entidade de associação para conectar Buyer Group à store:

```
WebStoreBuyerGroup
```

O [Store Data Model oficial](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-data-model-store.html) identifica **Store Buyer Group** como parte da relação entre Store e `BuyerGroup`.
Portanto, o modelo completo é mais preciso assim:

![[mermaid-diagram (43).png]]

### Commerce Customer Workspace
**[Customer Workspace](https://help.salesforce.com/s/articleView?id=commerce.comm_customer_workspace.htm&language=en_US&type=5&utm_source=chatgpt.com)** é a interface administrativa Commerce para gerenciar Buyer Accounts, Buyer Groups e suas associações.
Ele permite visualizar:

```
Accounts
Buyer Groups
Accounts ↔ Buyer Groups
Buyer Groups ↔ Stores
```

e executar operações em massa.
**UI vs Data Model**

![[mermaid-diagram (44).png]]

Essa associação **UI → objetos reais** é exatamente o raciocínio que queremos treinar no projeto.

### [Buyer e Buyer Manager](https://help.salesforce.com/s/articleView?id=commerce.commerce_buyer_and_buyer_mgr_perm_sets.htm&language=en_US&type=5&utm_source=chatgpt.com)
Existem permission sets pré-configurados para diferentes personas.

- **Buyer**
	- acessar store;
	- visualizar products/categories;
	- utilizar wishlist;
	- comprar produtos.
- **Buyer Manager**
	- Inclui as capacidades de Buyer e permissões adicionais relacionadas a compradores/carts/orders da Account conforme configuração.

![[mermaid-diagram (45) 1.png]]

### Security Model
Para alguém **[acessar corretamente uma B2B Store](https://help.salesforce.com/s/articleView?id=sf.comm_access.htm&language=en_US&type=5&utm_source=chatgpt.com)**, várias camadas participam:

![[mermaid-diagram (46).png]]

Portanto:
> conseguir fazer login não significa automaticamente possuir acesso Commerce apropriado.

A Salesforce exige que os profiles/permission sets relevantes façam parte da comunidade da store e disponibiliza permission sets próprios para compradores.

### Billing e Shipping Addresses
Também pertencem ao domínio do Buyer Account. Para B2B, Salesforce permite armazenar endereços usando:

```
ContactPointAddress
```

### Currency do Buyer Account
Outro detalhe B2B relevante. A Account pode ter uma moeda preferencial. Se a **[Account currency](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_accounts.htm&language=en_US&type=5&utm_source=chatgpt.com)** for suportada pela store, ela influencia o contexto do comprador. Se não houver uma moeda válida/suportada, o buyer vê preços na moeda default da store. A escolha da Account aplica-se aos buyers daquela Account.
Portanto:

```
User Currency
vs
Account Currency
vs
Store Currency
```

### Runtime - login do Buyer
![[mermaid-diagram (47).png]]

Depois, nas fases seguintes:

```
Buyer Context
    ↓
Entitlements
    ↓
Pricing
    ↓
Products
```

### Source of Truth
| Informação                       | Principal representação   |
| -------------------------------- | ------------------------- |
| Empresa                          | `Account`                 |
| Account habilitada para Commerce | `BuyerAccount`            |
| Pessoa                           | `Contact`                 |
| Identidade/autenticação          | `User`                    |
| Segmentação comercial            | `BuyerGroup`              |
| Associação ao grupo              | `BuyerGroupMember`        |
| Buyer Group ↔ Store              | `WebStoreBuyerGroup`      |
| Endereços                        | `ContactPointAddress`     |
| Account usada na operação atual  | Effective Account context |

### Self-Registration
Para uma solução real, administradores não precisam necessariamente criar todos os buyers manualmente.
Para uma solução real, administradores não precisam necessariamente criar todos os buyers manualmente.
**[Self-Registration](https://help.salesforce.com/s/articleView?id=release-notes.rn_comm_self-registration.htm&language=en_US&release=248&type=5&utm_source=chatgpt.com)** permite que novos buyers criem seu próprio acesso à B2B Store.

Nas versões atuais, a configuração Commerce pode definir profile, account record type, permission set groups e Buyer Groups aplicados durante o registro.

![[mermaid-diagram (48).png]]

### [WebStoreUserCreatedEvent](https://developer.salesforce.com/docs/platform/platform-events/guide/sforce-api-objects-webstoreusercreatedevent.html?utm_source=chatgpt.com)
Quando um novo User é criado para uma WebStore, existe o platform event:
```
WebStoreUserCreatedEvent
```

* Ele pode ser consumido por:
	- Apex Trigger;
	- Flow;
	- Pub/Sub API;
	- Streaming API;

Isso abre arquiteturas como:
![[mermaid-diagram (49).png]]

### Commerce APIs relacionadas ao Buyer
Não precisamos programá-las agora, mas elas fazem parte do domínio.
Um exemplo é:
```
/commerce/webstores/{webstoreId}/myprofile
```

A **[My Profile API**](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-d2c-comm-myprofile-apis.html?utm_source=chatgpt.com) permite consultar e atualizar dados do buyer autenticado usando o User ID do contexto da sessão.
Isso mostra novamente a arquitetura:
![[mermaid-diagram (50).png]]

### Apex Extension - [Buyer Group Extension](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_group_extensibility.htm&language=en_US&type=5&utm_source=chatgpt.com)
Buyer Groups não precisam ser exclusivamente associações administrativas estáticas.
Salesforce oferece:

```
CommerceBuyGrp.BuyerGroupEvaluationService
```

Buyer Group Extension permite determinar dinamicamente Buyer Groups utilizando lógica Apex.
Arquitetura:

![[mermaid-diagram (51).png]]

A documentação atual informa que essa lógica pode executar quando o shopper visita páginas da store, permitindo atribuição dinâmica para influenciar product visibility, pricing e promotions.

### Static vs Dynamic Buyer Groups
```
STATIC
Admin creates BuyerGroupMember records

DYNAMIC
CommerceBuyGrp.BuyerGroupEvaluationService
evaluates membership at runtime
```

Visualmente:

![[mermaid-diagram (52).png]]

Existem considerações e [limites específicos para Buyer Group Extension](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-data-model-shopper-buyer-groups-accounts-limits.html?utm_source=chatgpt.com), então isso não é algo para habilitar indiscriminadamente.

### Integração externa
Em uma implementação enterprise, Buyer data frequentemente vem de outro sistema.
![[mermaid-diagram (53).png]]

### Arquitetura completa
![[mermaid-diagram (54).png]]

## Phase 03. Catalog, Products & Product Discovery
Como um produto sai de um registro `Product2` e se transforma em algo organizado, pesquisável e exibível para o buyer dentro da WebStore?

> A documentação-base continua sendo o [B2B Commerce Developer Guide](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-dev-guide.html).

**Catalog é a estrutura responsável por organizar os produtos vendidos por uma Commerce Store.** No Salesforce B2B Commerce, produtos são registros `Product2`, organizados em `ProductCategory`, pertencentes a um `ProductCatalog`, que é associado à `WebStore`.

![[mermaid-diagram (55).png]]

Uma store B2B suporta [**um catálogo associado por vez**](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-data-model-product-catalog.html?utm_source=chatgpt.com), enquanto um mesmo catálogo pode atender múltiplas stores.

### Commerce App - onde administramos Catalog
Administrativamente, trabalharemos principalmente nos workspaces de merchandising da store.
Conceitualmente:

```
Commerce App
    ↓
Nexus Figures
    ↓
Merchandising
    ├── Products
    ├── Categories
    ├── Attributes
    └── Media / Search configuration
```

Mas, como agora estamos estudando em profundidade, cada alteração da interface precisa ser associada ao **objeto ou configuração técnica correspondente**.

![[mermaid-diagram (56).png]]

A partir desta fase, nosso padrão será sempre:
> **O que eu alterei na UI e qual entidade técnica foi afetada?**

### ProductCatalog
Objeto:
```
ProductCatalog
```

**[ProductCatalog](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-dev-data-model.html?utm_source=chatgpt.com)** é o container lógico dos produtos e categorias disponibilizados por uma store.
Salesforce define Catalog como uma coleção dos produtos vendidos, organizada em categorias.

### WebStoreCatalog
Objeto:
```
WebStoreCatalog
```

**[WebStoreCatalog](https://developer.salesforce.com/docs/data/data-cloud-dmo-mapping/guide/c360dm-commerce-webstorecatalog.html?utm_source=chatgpt.com)** associa uma WebStore ao ProductCatalog utilizado por ela.
`WebStoreCatalog` possui referências para a store e para o catálogo

```
Uma WebStore
    ↓
1 ProductCatalog

Um ProductCatalog
    ↓
pode ser utilizado por múltiplas WebStores
``` :chatgpt-content-reference{index="3"}


---

# 5. Default Catalog

Quando uma B2B Store é criada, Salesforce cria/associa uma estrutura inicial contendo um catálogo padrão e uma categoria `Products`. :chatgpt-content-reference{index="4"}

Portanto, antes de criar outro catálogo na Nexus Figures:

```text
Commerce App
↓
Catalog
↓
Verificar catálogo existente
```

### ProductCategory
Objeto:
```
ProductCategory
```

**[ProductCategory](https://developer.salesforce.com/docs/atlas.en-us.c360a_api.meta/c360a_api/c360dm_commerce_product_category.htm?utm_source=chatgpt.com)** organiza os produtos dentro de um ProductCatalog e pode possuir outra categoria como parent, formando uma hierarquia.
A estrutura oficial associa cada `ProductCategory` a um catálogo e permite uma referência à categoria pai.

### Hierarquia de categorias
**[Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_categories_structure.htm&language=en_US&type=5&utm_source=chatgpt.com)** suporta até **cinco níveis de categorias/subcategorias** e até 15.000 categorias por store segundo os limites atuais. Não precisamos chegar perto desses limites, mas precisamos saber que hierarquia de catálogo é uma decisão de arquitetura.

Categoria não é apenas organização administrativa
Ela afeta diretamente:

```
Navigation
Breadcrumbs
Search
Filters
PLP
Product discovery
```

Salesforce permite inclusive escolher uma **primary category**, utilizada para construir caminhos/breadcrumbs. Produtos podem pertencer a múltiplas categorias.

![[mermaid-diagram.png]]

### ProductCategoryProduct
Objeto:
```
ProductCategoryProduct
```

ProductCategoryProduct é o junction object que relaciona `Product2` a `ProductCategory`.
O registro contém referências ao Product e à Category; o modelo também permite indicar a associação considerada primária.

### Product2 - o produto real
Objeto:
```
Product2
```

**[Product2](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-dev-data-model.html?utm_source=chatgpt.com)** representa o produto ou serviço comercial vendido pela empresa. Commerce reutiliza o objeto padrão de produto da Salesforce Platform.
O próprio Commerce Data Model identifica `Product2` como a entidade Product. [Developer](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-dev-data-model.html?utm_source=chatgpt.com)

### ProductCode vs SKU
Quero que essa diferença já fique clara. `Product2` possui conceitos separados para:

```
ProductCode
StockKeepingUnit
```

No **[modelo de Commerce](https://developer.salesforce.com/docs/data/data-cloud-dmo-mapping/guide/c360dm-commerce-product.html?utm_source=chatgpt.com)**, `StockKeepingUnit` é mapeado como o **product SKU**, enquanto `ProductCode` permanece como outro identificador do produto.
Para nosso projeto:

```
SKU
= identificador utilizado operacionalmente para estoque/variações.

Product Code
= código comercial adicional, quando precisarmos.
```

### O SKU será a ponte para Inventory
Ainda não entraremos em OCI, mas esta conexão precisa estar clara desde já:

![[mermaid-diagram (1).png]]

Primeiro construímos corretamente o produto e seu SKU. Depois a camada de inventory utilizará esse identificador para trabalhar com disponibilidade.

### [Product Class](https://help.salesforce.com/s/articleView?id=sf.comm_product_class.htm&language=en_US&type=5&utm_source=chatgpt.com)
Agora entramos em uma estrutura muito importante. Salesforce B2B Commerce suporta classes como:
 - Variation Parent
 - Variation Product
 - Product Set

### Buyer abre uma PLP
Agora vamos entender o lado runtime.
![[mermaid-diagram (2).png]]

### Commerce Product APIs
Salesforce possui **[APIs](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-d2c-comm-product-category-apis.html?utm_source=chatgpt.com)** específicas para Catalog, Products e Categories.
Entre elas:

```
POST /commerce/management/webstore/{webstoreId}/composite-products

PUT /commerce/management/webstore/{webstoreId}/composite-products/{productId}

POST /commerce/management/webstore/{webstoreId}/composite-variations
```

Essas APIs podem criar/atualizar produtos e associá-los ao catálogo, categorias e mídia no contexto da WebStore.

### Shopper Product APIs
Para consumo do storefront:

```
GET /commerce/webstores/{webstoreId}/products

GET /commerce/webstores/{webstoreId}/products/{productId}

GET /commerce/webstores/{webstoreId}/products/{productId}/children
```

### Category APIs
```
Category details
Category children
Category path
```

Exemplo:
```
GET
/commerce/webstores/{webstoreId}/product-categories/children
```

### Product Search API
Um dos endpoints mais importantes do storefront:

```
GET
/commerce/webstores/{webstoreId}/search/products
```

permite pesquisar produtos usando termos, categoria, refinements e outras configurações. Salesforce recomenda o endpoint GET atual em vez da versão POST anterior para aproveitar recursos mais recentes. [Developer](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-d2c-comm-product-category-apis.html?utm_source=chatgpt.com)
Esse endpoint será extremamente importante quando chegarmos ao Headless.

### Storefront API - `commerce/productApi`
No LWR, não precisamos necessariamente chamar REST diretamente.
Storefront APIs fornecem adapters e funções como:

```
ProductAdapter
ProductCollectionAdapter
ProductCategoryAdapter
ProductCategoryHierarchyAdapter
ProductCategoryPathAdapter
ProductChildrenAdapter
ProductSearchAdapter
```

### Source of Truth
|Informação|Representação|
|---|---|
|Produto|`Product2`|
|SKU|`Product2.StockKeepingUnit`|
|Catalog|`ProductCatalog`|
|Store ↔ Catalog|`WebStoreCatalog`|
|Categoria|`ProductCategory`|
|Produto ↔ Categoria|`ProductCategoryProduct`|
|Product attributes|Product Attribute model|
|Media association|`ProductMedia`|
|Category media|`ProductCategoryMedia`|
|Product discovery|Commerce Search Index|
|Store search configuration|Search settings / `WebStoreSearchProductSettings`|

### Apex Extensions
Sim, mas não para simplesmente criar um Product.
Salesforce Commerce oferece **Endpoint Extensions**.
No domínio Catalog existem extension points como:
```
Commerce_Endpoint_Catalog_Products

Commerce_Endpoint_Catalog_Product
```

E para Search:
```
Commerce_Endpoint_Search_Products

Commerce_Endpoint_Search_ProductSearch

Commerce_Endpoint_Search_Suggestions
```

### Product lifecycle 
![[mermaid-diagram (3).png]]

### Arquitetura completa
![[mermaid-diagram (4).png]]

