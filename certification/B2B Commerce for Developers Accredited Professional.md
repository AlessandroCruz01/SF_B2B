---
tags:
  - salesforce
  - b2b-commerce
  - certification
  - lwc
exam: B2B Commerce for Developers Accredited Professional
github: https://github.com/forcedotcom/commerce-on-lightning-components/tree/release
forcedotcom: https://github.com/forcedotcom/b2b-commerce-open-source-components
---

# B2B Commerce for Developers Accredited Professional

## 🗺️ Mapa geral do Data Model

![[data-model-overview.png]]

## 📚 Temas da certificação

| Área                      | Tema                                                              | Conceitos-chave                                                                                  | Status      |
| ------------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ----------- |
| Data Management           | Store & Buyers                                                    | `WebStore`, `BuyerAccount`, `BuyerGroup`                                                         | ✅          |
| Data Management           | Products, Catalogs, Categories & Entitlements                     | `Product2`, `ProductCatalog`, `ProductCategory`, `CommerceEntitlementPolicy`                     | ✅          |
| Data Management           | Pricing                                                           | `Pricebook2`, `PricebookEntry`, `BuyerGroupPricebook`, `WebStorePricebook`, Pricing Strategy     | ✅          |
| Lightning Web Components  | Estrutura & fundamentos                                           | Bundle HTML/JS/XML, `@api`, events, `lwc:if`, `for:each`, `key`, `iterator`                      | ✅          |
| Lightning Web Components  | `@api`, Public Properties, Getters/Setters & LWC Reactivity       | Public API, getters, setters, backing field, reactive fields, `@track`                           | 📍 Atual    |

> [!info] Objetos associados padrão (vale para todos os SObjects abaixo)
> - **`<Object>ChangeEvent`** → Change Data Capture: stream de eventos de criação, update, delete e undelete. Não é um objeto Salesforce (não suporta CRUD nem query).
> - **`<Object>Feed`** → Feed tracking: posts e mudanças rastreadas no feed.
> - **`<Object>History`** → Histórico de mudanças nos campos rastreados.
> - **`<Object>Share`** → Entradas de sharing do registro.
> - **`<Object>OwnerSharingRule`** → Regras de sharing para usuários além do owner.

---

## 🏪 Data Management — Store & Buyers

> [!abstract] Data Management
> **Objetos:** `WebStore` · `BuyerAccount` · `BuyerGroup`

![[store-buyers-webstore-buyergroup-buyeraccount.png]]

### 1. [WebStore](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_webstore.htm)

![[store-buyers-webstore-erd.png]]

A website where buyers and shoppers complete wholesale and retail transactions. Includes the fields and properties that define your store. For example, supported currencies, languages, and price books. Many fields are customizable.

| Item                   | Detalhe                                                                                                                         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Definição (SObject)** | Represents a B2B or D2C store.                                                                                                  |
| **API version**        | 49.0+                                                                                                                           |
| **Supported calls**    | `create()`, `delete()`, `describeLayout()`, `describeSObjects()`, `getDeleted()`, `getUpdated()`, `query()`, `retrieve()`, `search()`, `undelete()`, `update()`, `upsert()` |

**Associated objects**

| Associated object                                                                                                                                                   | Habilita       | API  |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ---- |
| [WebStoreChangeEvent](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_change_event.htm)       | Change events  | 55.0 |

**See also**
- [WebStoreNetwork](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_webstorenetwork.htm) — relacionamento entre uma web store e um Experience site (API 49.0+).
- [Store Data Limits](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-data-model-store-limits.html)

### 2. [BuyerAccount](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_buyeraccount.htm)

The buyer's or shopper's financial information, including credit and order limits, some of which pertain only to B2B.

| Item                   | Detalhe                                                                                                                         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Definição (SObject)** | Represents an account that is enabled as a buyer for Lightning B2B Commerce.                                                    |
| **API version**        | 48.0+                                                                                                                           |
| **Supported calls**    | `create()`, `delete()`, `describeLayout()`, `describeSObjects()`, `getDeleted()`, `getUpdated()`, `query()`, `retrieve()`, `undelete()`, `update()`, `upsert()` |

**Associated objects**

| Associated object                                                                                                                                            | Habilita                         |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------- |
| [BuyerAccountFeed](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_feed.htm)           | Feed tracking                    |
| [BuyerAccountHistory](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_history.htm)     | History (campos rastreados)      |
| [BuyerAccountShare](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_share.htm)         | Sharing                          |

### 3. [BuyerGroup](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_buyergroup.htm)

A group of buyers with the same assigned entitlement policies, price books, and products. Buyer Group name and description are customizable.

| Item                   | Detalhe                                                                                                                         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Definição (SObject)** | Associates group qualifiers (entitlements, price books, promotions, and shipping methods) with buyer members based on buyer account ID or on the localized language and currency of the market browsed in a webstore. |
| **API version**        | 57.0; amended to support Market in 58.0+                                                                                        |
| **Supported calls**    | `create()`, `delete()`, `describeLayout()`, `describeSObjects()`, `getDeleted()`, `getUpdated()`, `query()`, `retrieve()`, `search()`, `undelete()`, `update()`, `upsert()` |

**Associated objects**

| Associated object                                                                                                                                                       | Habilita                    |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| [BuyerGroupChangeEvent](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_change_event.htm)        | Change events               |
| [BuyerGroupFeed](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_feed.htm)                       | Feed tracking               |
| [BuyerGroupHistory](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_history.htm)                 | History (campos rastreados) |
| [BuyerGroupOwnerSharingRule](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_ownersharingrule.htm) | Sharing rules               |
| [BuyerGroupShare](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_share.htm)                     | Sharing                     |

> [!tip] Resumo — Store & Buyers
> **WebStore** → a loja (currencies, languages, price books)
> **BuyerAccount** → a Account habilitada como buyer (crédito, limites)
> **BuyerGroup** → o segmento que recebe entitlements, price books, promotions e shipping methods
>
> `WebStore ──associa──► BuyerGroup ◄──é membro de── BuyerAccount`

---

## 📦 Data Management — Products, Catalogs, Categories & Entitlements

> [!abstract] Data Management
> **Objetos:** `Product2` · `ProductCatalog` · `ProductCategory` · `CommerceEntitlementPolicy`

![[catalog-entitlements-overview.png]]

### 1. [Products — `Product2`](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_product2.htm)

The items and services you sell. The Commerce Admin or Merchandiser uses data import to fill in a default compact layout, which includes a variety of customizable fields (name, family, and so on).

```text
Product2
   │
   ├── Catalog / Category
   │
   ├── Entitlement
   │
   └── Pricing
```

| Item                   | Detalhe                                                                                                                         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Schedules**          | Possui campos usados apenas para quantity e revenue schedules (ex.: annuities). Só aparecem se as features *products and schedules* estiverem habilitadas — caso contrário, não é possível fazer query, create ou update desses campos. |
| **Supported calls**    | `create()`, `delete()`, `describeLayout()`, `describeSObjects()`, `getDeleted()`, `getUpdated()`, `query()`, `retrieve()`, `search()`, `undelete()`, `update()`, `upsert()` |

**Associated objects**

| Associated object                                                                                                                                                          | Habilita                    | API  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------- | ---- |
| [Product2ChangeEvent](https://developer.salesforce.com/docs/atlas.en-us.264.0.object_reference.meta/object_reference/sforce_api_associated_objects_change_event.htm)        | Change events               | 44.0 |
| [Product2Feed](https://developer.salesforce.com/docs/atlas.en-us.264.0.object_reference.meta/object_reference/sforce_api_associated_objects_feed.htm)                       | Feed tracking               | 18.0 |
| [Product2History](https://developer.salesforce.com/docs/atlas.en-us.264.0.object_reference.meta/object_reference/sforce_api_associated_objects_history.htm)                 | History (campos rastreados) | —    |
| [Product2OwnerSharingRule](https://developer.salesforce.com/docs/atlas.en-us.264.0.object_reference.meta/object_reference/sforce_api_associated_objects_ownersharingrule.htm) | Sharing rules               | 50.0 |

### 2. [Product Catalog — `ProductCatalog`](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_productcatalog.htm)

A catalog is a collection of the products that you sell, organized into different categories. The Commerce Admin or Merchandiser uses data import to set up the catalog. ([Help](https://help.salesforce.com/s/articleView?id=sales.pricebooks_landing_page.htm&type=5))

O **ProductCatalog** representa a coleção estruturada dos produtos vendidos. A definição oficial é, essencialmente, uma coleção de produtos organizada em diferentes **Categories**.

```text
B2B Nexus Figures Store
        │
        ▼
Nexus Product Catalog
        │
        ├── Marvel
        ├── DC Comics
        └── Anime
```

> [!tip] 🎯 Regra importante de prova
> - ***A Store can be associated with only one Product Catalog.***
> - ***A Product Catalog can be associated with multiple Stores.***

```text
WebStore A ─────┐
                │
WebStore B ─────┼──► ProductCatalog
                │
WebStore C ─────┘
```

| Item                   | Detalhe                                                                                                                         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Definição (SObject)** | The container that holds a Product Category hierarchy.                                                                          |
| **API version**        | 55.0+                                                                                                                           |
| **Supported calls**    | `create()`, `delete()`, `describeLayout()`, `describeSObjects()`, `getDeleted()`, `getUpdated()`, `query()`, `retrieve()`, `search()`, `undelete()`, `update()`, `upsert()` |

> [!warning] ⚠️ Exam Alert
> Se aparecer:
> *"A company needs to organize the products available in its storefront into a centralized collection."*
>
> Pense em: **ProductCatalog**

### 3. [Product Category — `ProductCategory`](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_productcategory.htm)

Categories and subcategories organize and group products in your catalog and on your storefront. Layout is customizable.

> [!warning] Confusão comum: ***Catalog ≠ Category***
> O **Catalog** é o container/estrutura geral. As **Categories** organizam os produtos **dentro** desse Catalog.

```text
Nexus Product Catalog
│
├── Figures
│   ├── Marvel
│   ├── DC Comics
│   └── Anime
│
└── Accessories
    ├── Displays
    └── Stands
```

A Salesforce define Categories e Subcategories como estruturas usadas para **organizar e agrupar produtos no catalog e storefront**. Isso também influencia a experiência de:
- navigation
- browsing
- search
- category pages

#### Relacionamento com Product — `ProductCategoryProduct`

Existe um objeto importante no Data Model que faz a associação entre Product e Category:

```text
Product2
   ↕
ProductCategoryProduct
   ↕
ProductCategory
```

> [!tip] Mentalmente
> **`ProductCategoryProduct` = Product ↔ Category relationship**

| Item                   | Detalhe                                                                                                                         |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Definição (SObject)** | Represents the category that products are organized in.                                                                         |
| **API version**        | 49.0+                                                                                                                           |
| **Supported calls**    | `create()`, `delete()`, `describeLayout()`, `describeSObjects()`, `getDeleted()`, `getUpdated()`, `query()`, `retrieve()`, `search()`, `undelete()`, `update()`, `upsert()` |
| **Associated objects** | [ProductCategoryChangeEvent](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_change_event.htm) — Change events (API 55.0) |

#### [Category Hierarchy](https://help.salesforce.com/s/articleView?id=mktg.mc_pers_catalog_object_category_etl_hierarchy.htm&type=5)

Categories podem ter Subcategories. Atualmente, a documentação oficial indica suporte padrão de até **5 levels** de Category hierarchy.

```text
Figures                         ← Level 1
└── Superheroes                 ← Level 2
    └── DC                      ← Level 3
        └── Batman              ← Level 4
            └── Premium         ← Level 5
```

### 4. [Entitlement Policy — `CommerceEntitlementPolicy`](https://help.salesforce.com/s/articleView?id=commerce.comm_entitlement_policies_intro.htm&type=5)

A parte mais importante deste tema. Imagine:

```text
Nexus Product Catalog
├── Batman Figure
├── Superman Figure
├── Iron Man Figure
├── Naruto Figure
└── Premium Collector Figure
```

Todos existem no Catalog. Porém: *todo Buyer deveria enxergar todos?* **Não necessariamente!**
É aqui que entra o `CommerceEntitlementPolicy`.

> [!info] Definição oficial
> Entitlement Policies conectam **Buyer Groups** e **Products** e determinam quais produtos e informações relacionadas podem ser visualizados pelos compradores. Elas incluem controles como **`CanViewProduct`** e **`CanViewPrice`**.

```text
BuyerAccount → BuyerGroup → Entitlement Policy → Product
```

#### BuyerGroup × Entitlement Policy

Essa diferença precisa ficar automática:

| Objeto                 | Responde                                                                      |
| ---------------------- | ----------------------------------------------------------------------------- |
| **BuyerGroup**         | **Who is the buyer grouped with?**                                            |
| **Entitlement Policy** | **What products/product information is this Buyer Group allowed to see?**    |

#### `CanViewProduct` × `CanViewPrice`

| Controle         | Significado                       |
| ---------------- | --------------------------------- |
| `CanViewProduct` | O comprador pode visualizar o Product |
| `CanViewPrice`   | O comprador pode visualizar o preço   |

```text
CanViewProduct = false
→ Buyer cannot see the product.

CanViewProduct = true
CanViewPrice   = false
→ Product may be visible while price visibility is restricted.
```

Isso permite diferenciar **product visibility** de **price visibility**.

### ✅ Resumo — Products, Catalogs & Entitlements

| Requirement                             | Pense primeiro em              |
| --------------------------------------- | ------------------------------ |
| "What is being sold?"                   | `Product2`                     |
| "Collection of products for the Store?" | `ProductCatalog`               |
| "Organize products for navigation?"     | `ProductCategory`              |
| "Group similar buyers?"                 | `BuyerGroup`                   |
| "Which products can these buyers see?"  | `CommerceEntitlementPolicy`    |
| "Can the buyer see the price?"          | Entitlement / `CanViewPrice`   |

### 💲 Data Management — Pricing

> [!abstract] Data Management
> **Objetos:** `Pricebook2` · `PricebookEntry` · `BuyerGroupPricebook` · `WebStorePricebook`
> **Conceitos:** Store Price Book × Buyer Group Price Book · Standard Price Book · Pricing Strategy (Best Price × Priority Price)

![[pricing-buyer-pricing-flow.png]]

No B2B Commerce, um **Price Book** pode ser associado diretamente à **Store** ou a um **Buyer Group**. Quando associado à Store, compradores com acesso à Store podem receber esses preços; quando associado ao Buyer Group, os preços ficam disponíveis às Accounts pertencentes àquele grupo.

### 1. [Store Price Book × Buyer Group Price Book](https://help.salesforce.com/s/articleView?id=commerce.comm_set_up_pricing.htm&type=5)

- Price Book associado à **Store** → qualquer customer que possa acessar aquela Store é elegível aos preços dele.
- Price Book associado a um **Buyer Group** → somente Accounts associadas àquele Buyer Group são elegíveis. ([Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_assign_pricebooks.htm&language=en_US&type=5))

![[pricing-pricebook-assignment-store-vs-buyergroup.png]]

> [!tip] Portanto
> **Broad/default pricing → Store Price Book**
> **Segmented/negotiated pricing → Buyer Group Price Book**
>
> Criar um Buyer Group para cada buyer seria desnecessário quando todos devem receber o mesmo preço.

### 2. The Store's Pricing Strategy — visão geral

![[pricing-multiple-pricebooks-strategy.png]]

Como um buyer pode pertencer a múltiplos Buyer Groups e um Buyer Group ou Store pode ter múltiplos Price Books, o mesmo buyer pode acabar com **multiple applicable Price Books**. A **Pricing Strategy** determina qual preço deve ser apresentado quando existem múltiplos preços disponíveis.

> [!tip] Regra mental
> - **Entitlement → ACCESS**
> - **Price Book → PRICE**
> - **Pricing Strategy → WHICH PRICE**

![[pricing-rules-mental-model.png]]

| Concept                    | Mental model                       |
| -------------------------- | ---------------------------------- |
| **Store Price Book**       | Broad/store-level pricing          |
| **Buyer Group Price Book** | Segmented/negotiated pricing       |
| **Entitlement Policy**     | Access/visibility                  |
| **Pricing Strategy**       | Resolve multiple available prices  |

#### Mental model consolidado

![[pricing-consolidated-flow.png]]

- 🤺 **Buyer Group Member → Who belongs to the segment**
- 🤺 **Entitlement Policy → What the buyer can access**
- 🤺 **Price Book / Price Book Entry → What prices exist**
- 🤺 **Pricing Strategy → Which applicable price is displayed**

Um Store Price Book oferece pricing de forma ampla aos customers que podem acessar a Store, enquanto um Buyer Group Price Book restringe a elegibilidade dos preços às Accounts associadas ao Buyer Group. ([Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_assign_pricebooks.htm&language=en_US&type=5))

> [!warning] Detalhe importante para a prova
> Todo Product precisa estar no **Standard Price Book** antes de poder ser adicionado a custom Price Books de uma Store ou Buyer Group.

### 3. Pricing Data Model

A documentação oficial de B2B Commerce lista explicitamente no Pricing Data Model os objetos **Buyer Group Price Book**, **Price Book 2**, **Web Store Price Book**, **Price Book Entry**, além de **Account**, **Buyer Group** e **Buyer Group Member**.

![[pricing-data-model-erd.png]]

![[pricing-data-model-objects.png]]

#### `Pricebook2`

É o **Price Book propriamente dito** — pense nele como um **container de preços**.
Exemplo: **Gold Customers Price Book**

Mas o `Pricebook2` sozinho não diz *"Product X custa $80"*. Quem representa essa informação é o `PricebookEntry`.

#### `PricebookEntry`

Um dos objetos mais importantes para memorizar. O Salesforce define `PricebookEntry` como a associação entre **Pricebook2 + Product2**. ([Developer](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-dev-data-model.html))

![[pricing-pricebookentry-structure.png]]

> [!tip] Então
> **Pricebook2 = collection of prices**
> **PricebookEntry = price of a specific product inside that Price Book**

Isso também explica por que o mesmo Product pode ter preços diferentes:

![[pricing-same-product-multiple-pricebookentries.png]]

É o **mesmo `Product2`**, com diferentes `PricebookEntry` records.

#### `BuyerGroupPricebook`

Distinção importante para developer questions: `BuyerGroupPricebook` é o **relationship object** que conecta **BuyerGroup ↔ Pricebook2**. **Não é um novo Price Book.**

![[pricing-buyergrouppricebook.png]]

Portanto, quando um cenário fala *"Assign a Price Book to a Buyer Group"*, no Data Model existe um relacionamento entre esses objetos, representado por **Buyer Group Price Book** — objeto que faz parte explicitamente do Pricing Data Model oficial.

#### `WebStorePricebook`

Mesma lógica, mas agora para a Store: **WebStore ↔ Pricebook2**

![[pricing-webstorepricebook.png]]

A documentação confirma que um Price Book pode ser atribuído à **Store**, ao **Buyer Group**, ou a **ambos**. Quando atribuído à Store, customers que podem acessar aquela Store são elegíveis aos preços; quando atribuído ao Buyer Group, as Accounts pertencentes àquele grupo são elegíveis. ([Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_assign_pricebooks.htm&language=en_US&type=5))

#### Standard Price Book

O **Standard Price Book** continua sendo um `Pricebook2`, mas possui um papel especial:

> [!info] Regra
> Um Product precisa possuir uma entrada no **Standard Price Book antes de poder ser adicionado a outros Price Books**.
>
> A Salesforce permite apenas **one Standard Price Book**, e todos os Products utilizados nos custom Price Books devem primeiro existir nele. ([Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_commerce_pricebooks.htm&language=en_US&type=5))

![[pricing-standard-pricebook-prerequisite.png]]

> [!warning] Armadilha comum
> *"Gold customers need a negotiated price. Should we create another Product?"*
>
> **Não.** Normalmente: **same Product2 → different PricebookEntry → different Pricebook2**

### 4. Pricing Strategy — Best Price × Priority Price

Um buyer pode receber múltiplos Price Books porque pode pertencer a vários Buyer Groups, ou porque múltiplos Price Books podem estar associados à própria Store ou aos grupos. Quando mais de um preço é aplicável ao mesmo Product, a Store usa a **Pricing Strategy** para decidir qual preço apresentar.

| Strategy           | Regra                                                         |
| ------------------ | ------------------------------------------------------------- |
| **Best Price**     | Usa o **menor preço disponível** entre os Price Books aplicáveis |
| **Priority Price** | Usa o preço do **Price Book com maior prioridade**            |

#### 4.1 Best Price

Com **Best Price**, a Store procura o menor preço disponível entre os Price Books aplicáveis ao buyer. ([Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_priority_pricing.htm&language=en_US&type=5))

![[pricing-best-price-example.png]]

> [!tip] Best Price = lowest applicable price
> Não importa qual Price Book você considere mais importante administrativamente. Se `$80` for o menor preço aplicável, `$80` vence.

#### 4.2 Priority Price

**Priority Price não significa menor preço.**

O administrador define uma prioridade para os Price Books associados ao Buyer Group. O Price Book com prioridade superior é considerado primeiro. ([Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_priority_pricing.htm&language=en_US&type=5))

| Price Book | Price | Priority |
| ---------- | ----: | -------: |
| Platinum   |   $95 |    **1** |
| Gold       |   $80 |        2 |
| Seasonal   |   $70 |        3 |

Com **Priority Price**, o resultado é **$95** — mesmo existindo `$80` e `$70`.

![[pricing-priority-price-example.png]]

A documentação oficial dá exatamente esse tipo de comportamento: um Price Book prioritário pode fornecer `$15`, enquanto outro oferece `$14`, e ainda assim `$15` é mostrado porque o primeiro Price Book possui maior prioridade.

> [!tip] Regra mental
> **Best Price → compare prices**
> **Priority Price → compare Price Book priorities**

#### 4.3 Priority Number

> [!warning] Armadilha clássica
> **Lower number = Higher priority.**
> Portanto: `Priority 1` > `Priority 2` > `Priority 3`

#### 4.4 Comparação direta

Considere:
- Store Price Book → `$120`
- Silver Price Book → `$100`
- Gold Price Book → `$90`

| Strategy           | Cálculo                                                         | Resultado                    |
| ------------------ | --------------------------------------------------------------- | ---------------------------- |
| **Best Price**     | `min(120, 100, 90)`                                             | **$90**                      |
| **Priority Price** | Store → Priority 3 · Silver → Priority 1 · Gold → Priority 2    | **$100** (Silver Price Book) |

#### 4.5 Onde isso entra no fluxo completo?

![[pricing-strategy-full-flow.png]]

As Commerce Pricing APIs seguem a mesma lógica: o preço é determinado a partir dos Price Books atribuídos à Store e aos Buyer Groups do shopper, selecionando o menor preço ou o preço do Price Book de maior prioridade, de acordo com a estratégia configurada. ([Developer](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-d2c-comm-pricing-promotions-apis.html))

### ⚠️ Exam Traps — Pricing

| Conceito                   | Pergunta que ele responde                                        |
| -------------------------- | ---------------------------------------------------------------- |
| **Entitlement Policy**     | Can the buyer access the Product/Price?                          |
| **Buyer Group Price Book** | Which Price Books are available to that segment?                 |
| **Best Price**             | Which available price is the lowest?                             |
| **Priority Price**         | Which available Price Book has the highest configured priority?  |

---

## ⚡ LWC — Estrutura, HTML / JS / XML & fundamentos

> [!abstract] Lightning Web Components · Structure, HTML, JavaScript & Metadata
> **Goal:** entender exatamente a responsabilidade de cada arquivo de um Lightning Web Component e reconhecer a configuração correta em cenários de prova.

![[lwc-fundamentals-bundle-files.png]]

### 1. [LWC Component Bundle](https://developer.salesforce.com/docs/platform/lwc/guide/create-components-define.html)

Um **UI Lightning Web Component** normalmente começa com estes três arquivos essenciais:

```text
force-app/main/default/lwc/
└── productCard/
    ├── productCard.html
    ├── productCard.js
    └── productCard.js-meta.xml
```

Para um componente que [renderiza UI](https://developer.salesforce.com/docs/platform/lwc/guide/create-components-folder.html), a Salesforce documenta **HTML + JavaScript + configuration metadata** como parte do bundle básico. CSS, SVG, arquivos JS auxiliares e Jest tests são opcionais.

| File           | Responsibility                                |
| -------------- | --------------------------------------------- |
| `.html`        | **UI / presentation**                         |
| `.js`          | **logic / state / event handlers**            |
| `.js-meta.xml` | Salesforce exposure / targets / configuration |
| `.css`         | Styling — optional                            |

### 2. HTML — Presentation

```html
<template>
    <lightning-card title="Product">
        <p>{productName}</p>
    </lightning-card>
</template>
```

Todo UI component usa `<template>` como root element. O template pode acessar dados definidos pela classe JavaScript usando expressions como `{productName}`.

```text
JavaScript
productName = 'Astro Bot';
        ↓ binding
HTML
{productName}
        ↓
Browser
Astro Bot
```

> [!warning] Ponto importante
> **Evite pensar no HTML como local da business logic.** O template declara **o que será renderizado**.

### 3. JavaScript — Component Logic

```js
import { LightningElement } from 'lwc';

export default class ProductCard extends LightningElement {
    productName = 'Astro Bot';
}
```

A estrutura fundamental é:

```js
import { LightningElement } from 'lwc';

export default class MyComponent extends LightningElement {

}
```

`LightningElement` vem do módulo `lwc`, e a classe do UI component estende `LightningElement`. O arquivo também pode conter fields, public APIs e event handlers. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-components-javascript.html))

```text
HTML        →  Presentation
JavaScript  →  Behavior + State + Logic
```

### 4. `.js-meta.xml` — Salesforce Configuration

Imagine que seu componente existe corretamente:

```text
productCard.html ✅
productCard.js   ✅
```

Mas você precisa disponibilizá-lo no **Lightning App Builder** ou **Experience Builder**:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>66.0</apiVersion>
    <isExposed>true</isExposed>

    <targets>
        <target>lightning__RecordPage</target>
        <target>lightning__AppPage</target>
        <target>lightning__HomePage</target>
    </targets>
</LightningComponentBundle>
```

```text
isExposed = true
        ↓
Component can be exposed for use

targets
        ↓
WHERE the component can be used
```

### 5. Data Flow, `@api` & Events

Agora saímos da estrutura de arquivos e entramos em **como os components se comunicam**.

#### 5.1 Parent → Child: `@api`

Quando um parent component precisa enviar informação para um child component, o child expõe uma [**public property**](https://developer.salesforce.com/docs/platform/lwc/guide/reactivity-public.html) com `@api`. A Salesforce define `@api` como parte da public API do component.

***Child:***
```js
import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {
    @api productName;
}
```

***Parent:***
```html
<c-product-card
    product-name="Astro Bot">
</c-product-card>
```

> [!note] Observe a conversão: *camelCase → kebab-case*
> JavaScript `productName` → HTML `product-name`

![[lwc-fundamentals-parent-to-child-api.png]]

> [!tip] Regra de prova
> `@api` → expose property or method publicly.
> Ele também pode ser usado em **public methods**, permitindo que um parent chame um método do child.

#### 5.2 Child → Parent: Events

Um child **não deve simplesmente alterar os dados que pertencem ao parent**. O padrão recomendado é:

```text
Parent
   ↓ data
Child

Child
   ↑ event
Parent
```

A Salesforce recomenda **one-way data flow**: dados fluem do parent para o child; quando o child precisa comunicar uma mudança, ele dispara um event para o parent. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-components-data-flow.html))

***Child JS***
```js
handleClick() {
    this.dispatchEvent(
        new CustomEvent('select')
    );
}
```

***Parent HTML***
```html
<c-product-card
    onselect={handleProductSelect}>
</c-product-card>
```

***Parent JS***
```js
handleProductSelect() {
    // Handle the event
}
```

![[lwc-fundamentals-child-to-parent-customevent.png]]

> [!tip] Para prova
> - **Parent → Child = properties / `@api`**
> - **Child → Parent = events**

#### 5.3 Event Handlers

Para eventos padrão:

```html
<lightning-button
    label="Add to Cart"
    onclick={handleAddToCart}>
</lightning-button>
```

```js
handleAddToCart() {
    console.log('Added');
}
```

- O **HTML** declara **qual evento ouvir**: `onclick`
- O **JavaScript** contém o handler: `handleAddToCart()`

A Salesforce recomenda declarative event listeners no template quando possível. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/events-handling))

> [!note] Reactivity
> Como fields mudam o template e quando o componente rerenderiza está no tema seguinte: **`@api`, Public Properties, Getters/Setters & LWC Reactivity → 5. LWC Reactivity**.

![[lwc-fundamentals-api-vs-events.png]]

> [!note] Nota mental
> - **`@api`** → Public interface → Parent communicates **DOWN**
> - **Event** → Child communicates **UP**

### 6. Conditional Rendering & Lists

Dois recursos básicos de template que aparecem bastante em LWC: **mostrar conteúdo condicionalmente** e **renderizar listas**.

#### 6.1 Conditional Rendering

Para código novo, prefira:

```html
<template lwc:if={showProducts}>
    <p>Products available</p>
</template>

<template lwc:elseif={hasError}>
    <p>Error loading products</p>
</template>

<template lwc:else>
    <p>No products found</p>
</template>
```

A [Salesforce](https://developer.salesforce.com/docs/platform/lwc/guide/reference-directives.html) atualmente recomenda `lwc:if`, `lwc:elseif` e `lwc:else`; os antigos `if:true` e `if:false` **não são mais recomendados**.

```text
JavaScript boolean
       ↓
lwc:if
       ↓
Render / Don't render
```

Exemplo:

```js
showProducts = true;
```

```html
<template lwc:if={showProducts}>
    <p>Product catalog</p>
</template>
```

Se `showProducts = false;`, esse bloco não é renderizado.

#### 6.2 Render Lists — `for:each`

```js
products = [
    { id: '1', name: 'Laptop' },
    { id: '2', name: 'Monitor' },
    { id: '3', name: 'Keyboard' }
];
```

```html
<template for:each={products} for:item="product">
    <p key={product.id}>
        {product.name}
    </p>
</template>
```

| Parte                 | Significado                         |
| --------------------- | ----------------------------------- |
| `for:each={products}` | array being iterated                |
| `for:item="product"`  | variable representing current item  |
| `key={product.id}`    | unique identifier                   |

A Salesforce exige uma `key` única para cada item da lista. O framework usa essa key para identificar quais elementos mudaram e precisam ser renderizados novamente. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-lists.html))

#### 6.3 `key` — Important Exam Point

A melhor key normalmente é algo naturalmente único, como `product.id`, `record.Id`, `contact.Id`.

> [!warning] Exam trap
> A Salesforce documenta especificamente que **o index não pode ser usado como valor de `key`**. A key deve ser uma string ou number **única e estável** para cada item. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-lists.html))
>
> ✅ GOOD → `key={product.id}`
> ❌ BAD → `key={index}`

#### 6.4 Why does `key` matter?

```text
Product A
Product B   ← muda
Product C
```

Com keys únicas:

```text
A → unchanged
B → rerender
C → unchanged
```

O framework consegue identificar especificamente o elemento alterado. Por isso:

> **`key` = identity of the item during rendering** — não é simplesmente "um campo obrigatório porque Salesforce quer".

#### 6.5 `iterator`

O `iterator` é útil especialmente quando você precisa saber informações como `first`, `last`, `index`, `value`:

```html
<template iterator:item={products}>
    <div key={item.value.id}>
        {item.value.name}
    </div>
</template>
```

O `iterator` disponibiliza propriedades como `value`, `index`, `first` e `last`. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-lists.html))

```text
for:each  → normal list iteration
iterator  → iteration + first / last information
```

![[lwc-fundamentals-conditional-rendering-lists.png]]

### ✅ Resumo — LWC Fundamentals para a prova

| Need                                     | Use        |
| ---------------------------------------- | ---------- |
| Conditional UI?                          | `lwc:if`   |
| Display an array?                        | `for:each` |
| Unique identity for repeated items?      | `key`      |
| First/last information?                  | `iterator` |

---

## ⚡ LWC — `@api`, Public Properties, Getters/Setters & LWC Reactivity

> [!abstract] 📍 Tema atual · Lightning Web Components
> **Goal:** entender o que é public API de um componente, quando usar getters (valores derivados) e setters (transformar/validar valores recebidos), e quando uma mudança de estado faz o componente rerenderizar.

### 1. `@api` and Public Properties

O `@api` define parte da [**public API**](https://developer.salesforce.com/docs/platform/lwc/guide/reference-decorators) de um Lightning Web Component. Quando uma property é marcada com `@api`, outro componente — normalmente o **parent/owner** — pode fornecer um valor para ela.

#### 1.1 Private field vs Public property

Sem `@api` — `productName` pertence internamente ao componente:

```js
import { LightningElement } from 'lwc';

export default class ProductCard extends LightningElement {
    productName = 'Laptop';
}
```

Com `@api` — `productName` faz parte da API pública e pode receber dados de quem consome o componente: ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reactivity-public.html))

```js
import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {
    @api productName;
}
```

#### 1.2 Parent → Child

```text
productList
    ↓
productCard
```

No ***child***:

```js
// productCard.js
import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {
    @api productName;
    @api price;
}
```

No ***parent***:

```html
<c-product-card
    product-name={selectedProductName}
    price={selectedPrice}>
</c-product-card>
```

JavaScript usa **camelCase**; o atributo correspondente no HTML usa **kebab-case**. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reactivity-public.html))

| JavaScript       | HTML               |
| ---------------- | ------------------ |
| `productName`    | `product-name`     |
| `buyerAccountId` | `buyer-account-id` |
| `productId`      | `product-id`       |

#### 1.3 Mental model importante para a prova

Pense em `@api` como uma **entrada pública controlada pelo owner**:

```text
Parent
   │
   │ value
   ▼
@api property
   │
   ▼
Child
```

Em LWC, o fluxo recomendado é **one-way data flow**:

```text
DATA
Parent ───────────────► Child
         @api

EVENT
Parent ◄─────────────── Child
        CustomEvent
```

Se o child precisar solicitar uma mudança em dados pertencentes ao parent, ele deve disparar um evento; o parent atualiza o dado e o novo valor volta para o child. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-components-data-flow.html))

> [!example] Exemplo B2B Commerce
> ```js
> // buyerPricingCard.js
> import { LightningElement, api } from 'lwc';
>
> export default class BuyerPricingCard extends LightningElement {
>     @api buyerAccountId;
>     @api productId;
>     @api negotiatedPrice;
> }
> ```
>
> O parent poderia fazer:
>
> ```html
> <c-buyer-pricing-card
>     buyer-account-id={buyerId}
>     product-id={selectedProductId}
>     negotiated-price={price}>
> </c-buyer-pricing-card>
> ```
>
> O `buyerPricingCard` recebe essas informações, mas **não deve assumir ownership dos dados recebidos**.

#### 1.4 `@api` precisa ser importado

✅ Correto:

```js
import { LightningElement, api } from 'lwc';

export default class BuyerCard extends LightningElement {
    @api buyerId;
}
```

❌ Incorreto (falta importar `api`):

```js
import { LightningElement } from 'lwc';

export default class BuyerCard extends LightningElement {
    @api buyerId;
}
```

O decorator deve ser importado do módulo `lwc`. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reactivity-public.html))

#### 1.5 Exam trap

```js
export default class ProductCard extends LightningElement {
    productName;
    @api productId;
}
```

Temos duas properties, mas somente `productId` é **public API**. `productName` continua sendo um field normal do componente.

> [!warning] Atenção
> Isso **não** significa que `productName` não seja reactive. Em LWC moderno, fields são reactive para os casos comuns sem exigir `@track`; `@api` existe principalmente para definir a **public API**, não simplesmente para tornar um field reactive. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reference-decorators))

> [!note] Nota mental — decorators
> - **`@api`** → public property / public method
> - **`@wire`** → Salesforce data / reactive provisioning
> - **`@track`** → observação de mudanças internas em objetos/arrays em casos específicos

### 2. Getters

Um **getter** permite calcular ou transformar um valor sempre que a propriedade é acessada.

```js
import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {
    @api productName;
    @api price;

    get displayName() {
        return this.productName?.toUpperCase();
    }
}
```

```html
<p>{displayName}</p>
```

Se `productName = 'Laptop'`, o template exibirá **LAPTOP**.
O ponto importante é que `displayName` **não precisa armazenar um estado separado** — ele deriva seu valor:

```text
productName
      ↓
   getter
      ↓
displayName
```

#### 2.1 Por que usar getter?

```js
@api price;
@api discount;

get finalPrice() {
    return this.price - this.discount;
}
```

```html
<p>{finalPrice}</p>
```

```text
price ────────┐
              ├──► getter finalPrice ───► Template
discount ─────┘
```

Isso evita manter `finalPrice` como outro estado que precisaria ser sincronizado manualmente.

#### 2.2 Getter com lógica condicional

Exemplo B2B:

```js
@api negotiatedPrice;
@api listPrice;

get hasNegotiatedPrice() {
    return this.negotiatedPrice < this.listPrice;
}
```

```html
<template lwc:if={hasNegotiatedPrice}>
    <p>Special price available</p>
</template>
```

O getter funciona muito bem aqui porque transforma uma regra de negócio em um valor facilmente consumido pelo template.

#### 2.3 Exam trap — métodos no template

Em LWC, você normalmente **não chama funções com argumentos diretamente dentro de expressões do template**.

❌ Evite:

```html
<p>{calculatePrice(price, discount)}</p>
```

✅ O padrão esperado é colocar essa lógica em JavaScript:

```js
get finalPrice() {
    return this.price - this.discount;
}
```

```html
<p>{finalPrice}</p>
```

#### 2.4 Getter usando `@api`

```js
@api buyerName;

get formattedBuyerName() {
    return `Buyer: ${this.buyerName}`;
}
```

```text
Parent
  │
  ▼
@api buyerName
  │
  ▼
getter formattedBuyerName
  │
  ▼
HTML
```

> [!tip] Regra de prova
> Um getter é especialmente adequado para um valor **derived/computed from other component state**.

### 3. Setters

Um **setter** permite executar lógica quando um valor é atribuído a uma property.

```js
import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {
    _productName;

    @api
    get productName() {
        return this._productName;
    }

    set productName(value) {
        this._productName = value?.trim();
    }
}
```

O parent fornece:

```html
<c-product-card
    product-name={selectedProductName}>
</c-product-card>
```

Quando o valor chega ao child:

```text
Parent value
    ↓
setter productName(value)
    ↓
transform / validate
    ↓
_productName
```

#### 3.1 Backing field

`_productName` é chamado de **backing field**. A ideia é evitar isto:

```js
// ❌ Recursão: atribui à própria property e chama o setter outra vez
set productName(value) {
    this.productName = value;
}
```

O padrão correto é:

```js
// ✅
_productName;

set productName(value) {
    this._productName = value;
}
```

#### 3.2 Getter + Setter com `@api`

Quando você cria uma public property usando getter/setter, normalmente o `@api` fica no **getter**:

```js
_product;

@api
get product() {
    return this._product;
}

set product(value) {
    this._product = value;
}
```

Isso transforma `product` em parte da public API do componente.

#### 3.3 Por que usar setter?

Um setter é útil quando o componente precisa:
- normalize data
- validate incoming data
- transform incoming data
- execute logic when a value changes

```js
_price;

@api
get price() {
    return this._price;
}

set price(value) {
    this._price = Number(value);
}
```

Se o parent fornecer `"120.50"`, o componente pode armazenar `120.50` como número.

#### 3.4 Exemplo B2B Commerce

```js
_buyerSegment;

@api
get buyerSegment() {
    return this._buyerSegment;
}

set buyerSegment(value) {
    this._buyerSegment = value?.toUpperCase();
}
```

Se o parent passar `gold`, internamente o componente trabalha com `GOLD`:

```text
Parent
  │
  │ "gold"
  ▼
setter
  │
  │ toUpperCase()
  ▼
"GOLD"
```

### 4. Getter vs Setter

```text
GETTER                         SETTER
Component State                incoming value
      ↓                              ↓
 compute                       transform / validate
      ↓                              ↓
   output                      internal state
```

| | Exemplo | Pergunta |
|---|---|---|
| **Getter** | `get finalPrice() { return this.price - this.discount; }` | *"What value should I return?"* |
| **Setter** | `set price(value) { this._price = Number(value); }` | *"What should I do when someone assigns a value?"* |

### 5. LWC Reactivity

```js
quantity = 1;

handleIncrease() {
    this.quantity++;
}
```

```html
<p>Quantity: {quantity}</p>
```

Quando `quantity` muda, o component pode rerenderizar automaticamente porque o field usado pelo template é reactive. ([Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reference-decorators))

> [!warning] Pegadinha de material antigo
> Você pode encontrar conteúdos dizendo `@track quantity;` para qualquer field reactive. **Isso está desatualizado.**
>
> Hoje, fields do LWC já são reactive sem `@track` para mudanças normais de valor. `@track` ainda é relevante principalmente quando é necessário observar certas mudanças internas em **objects ou arrays**. Portanto, basta: `quantity = 1;`

### 6. Advanced Scenarios: Public API, Getters & Setters

#### Scenario 1 — Dependent Public Properties

> [!example] Cenário
> A B2B Commerce storefront uses a reusable `productPricingCard` component. The parent provides two properties: `@api listPrice;` e `@api negotiatedPrice;`. O developer precisa calcular qual preço deve ser exibido.

> [!warning] Armadilha
> A **ordem de atribuição entre diferentes `@api` properties não é garantida**. Portanto, um setter não deve depender de outra public property já estar disponível.

O padrão recomendado para valores derivados é:

```js
@api listPrice;
@api negotiatedPrice;

get displayPrice() {
    return this.negotiatedPrice ?? this.listPrice;
}
```

O getter calcula o valor com base no estado disponível quando é acessado.

#### Scenario 2 — Read-only Data from Parent

O parent passa um Product:

```html
<c-product-card product={selectedProduct}>
</c-product-card>
```

O child recebe:

```js
@api product;
```

Se `product` for um objeto fornecido pelo parent, o child **não deve modificar diretamente suas propriedades**. Se precisar de uma cópia local para manipulação independente, pode utilizar spread syntax para uma shallow copy:

```js
const localProduct = { ...this.product };
```

> [!warning] Shallow copy
> Essa operação copia apenas o primeiro nível do objeto. Objetos aninhados ainda compartilham referências.

![[lwc-api-getters-setters-data-flow.png]]

|Concept|Certification Rule|
|---|---|
|`@api`|Exposes Public Properties and Methods|
|Boolean Attributes|Static attribute presence means `true`|
|Primitive Reactivity|Does not require `@track`|
|Objects & Arrays|New references support reactive updates|
|`@track`|Tracks observed nested mutations in plain objects and arrays|
|Custom Setter|Requires a corresponding getter|
|Interdependent Properties|Prefer derived getters|
|Parent-Child Communication|One-way Data Flow|

## ⚡ LWC — Component Communication & Custom Events
Em Lightning Web Components, a comunicação é baseada em One-Way Data Flow. O componente pai controla os dados que fornece aos filhos, enquanto os filhos utilizam eventos para comunicar ações e mudanças.
A regra central é:
> ***Props Down, Events Up.***

![[mermaid-diagram (30).png]]

| Communication            | Recommended mechanism                               |
| ------------------------ | --------------------------------------------------- |
| Parent → Child (data)    | `@api` Public Properties                            |
| Parent → Child (actions) | `@api` Public Methods                               |
| Child → Parent           | `CustomEvent`                                       |
| Sibling → Sibling        | Common Parent + `CustomEvent` + reactive properties |
| Unrelated components     | Lightning Message Service (LMS), where supported    |
O parent pode invocar métodos públicos de um child utilizando `this.template.querySelector()` quando necessário. Para informar ações ao parent, o child deve disparar eventos, não tentar alterar diretamente o estado privado do parent.

### CustomEvent — Child-to-Parent Communication
Considere um storefront B2B Commerce com um componente `productTile` que permite adicionar um produto ao carrinho.

==🟢**Child Component**==
*Child Component — productTile.js*
```javascript
import { LightningElement, api } from 'lwc';

export default class ProductTile extends LightningElement {
    @api productId;

    handleAddToCart() {
        const event = new CustomEvent('addtocart', {
            detail: this.productId
        });

        this.dispatchEvent(event);
    }
}
```

*Child Component — productTile.html*
```html
<template>
    <lightning-button
        label="Add to Cart"
        onclick={handleAddToCart}>
    </lightning-button>
</template>
```

==🟠**Parent Component**==
*Parent Component — productPage.html*
```html
<template>
    <c-product-tile
        product-id={currentProductId}
        onaddtocart={handleAddToCart}>
    </c-product-tile>
</template>
```

*Parent Component — productPage.js*
```javascript
import { LightningElement } from 'lwc';

export default class ProductPage extends LightningElement {
    currentProductId = 'SKU-001';
    selectedProductId;

    handleAddToCart(event) {
        this.selectedProductId = event.detail;
    }
}
```

---

![[mermaid-diagram (31).png]]

---


> [!INFO] Pontos críticos para a certificação:
>>`CustomEvent()` cria o evento.
>
>>`dispatchEvent()` dispara o evento.
>
>>`detail` transporta o payload.
>
>>`onaddtocart` registra o listener no template do parent.
>
>>`event.detail` permite ao parent recuperar o payload.

O nome do evento deve seguir as recomendações da Salesforce: letras minúsculas, sem espaços, sem prefixo `on`; underscores são permitidos para separar palavras.

### [Event Propagation: bubbles & composed](https://developer.salesforce.com/docs/platform/lwc/guide/events-propagation.html)
Um dos conceitos mais importantes é determinar quais componentes conseguem receber um evento.

O `CustomEvent` possui duas configurações:
- `bubbles`: permite que o evento percorra os ancestrais do DOM.
- `composed`: permite que o evento atravesse um Shadow DOM boundary durante sua propagação.

Ambas são `false` por padrão.

|bubbles|composed|Behavior|
|---|---|---|
|`false`|`false`|Sem propagação; ideal para comunicação direta|
|`true`|`false`|Propaga pelos ancestrais dentro do mesmo Shadow DOM boundary|
|`true`|`true`|Pode atravessar Shadow DOM boundaries e alcançar ancestrais externos|

**Propagation visualizer**
> bubbles: false, composed: false

![[Pasted image 20261010153904.png]]

> bubbles: true, composed: false

![[Pasted image 20261010153941.png]]

> bubbles: true, composed: true

![[Pasted image 20261010154001.png]]

Exam trap: Um `CustomEvent` disparado com `this.dispatchEvent()` no child pode ser recebido diretamente no elemento `<c-child>` pelo parent mesmo com `bubbles: false` e `composed: false`. Portanto, não é necessário configurar ambos como `true` para a comunicação direta Child → Parent.
A Salesforce recomenda escolher a configuração menos permissiva possível, preservando encapsulamento e evitando expor eventos desnecessariamente.

### Event Payload, Encapsulation & Retargeting
#### Primitive vs. Object Payload
Evite expor referências de objetos internos sem necessidade.

| Preferred                | Risky                         |
| ------------------------ | ----------------------------- |
| Enviar um ID primitivo:  | Expor a referência do objeto: |
| `detail: this.productId` | `detail: this.product`        |

Caso o evento precise transportar um objeto, crie uma cópia contendo somente os dados necessários. Uma cópia superficial com spread syntax não isola automaticamente objetos aninhados.

**event.target vs. event.currentTarget**

|Property|Meaning|
|---|---|
|`event.target`|Target do evento, sujeito a retargeting ao atravessar Shadow DOM boundaries|
|`event.currentTarget`|Elemento ao qual o listener em execução está associado|
|`event.detail`|Payload definido no `CustomEvent`|

Exam trap: Acessar elementos internos do child através de `event.target` pode falhar devido ao Shadow DOM encapsulation. A comunicação entre componentes deve utilizar um contrato explícito, como `detail` para transportar dados.

#### Sibling Communication & [Lightning Message Service](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_lightningmessagechannel.htm)
Para dois componentes irmãos, o parent costuma atuar como coordenador.

![[mermaid-diagram (32).png]]

Se os componentes não compartilham uma relação de composição adequada, Lightning Message Service pode ser utilizado para comunicação entre componentes desacoplados, onde o ambiente oferece suporte.

LMS utiliza `LightningMessageChannel`, `publish()` e `subscribe()`. Há suporte em Lightning Experience e em componentes Lightning de Experience Builder Aura/LWR sites, com limitações documentadas. O módulo legado `pubsub` não é oficialmente mantido.

## ⚡ LWC — Wire Adapters vs Imperative Operations
**Objetivo**: dominar quando utilizar `@wire`, Imperative APIs e Storefront Actions em componentes LWC para B2B Commerce, considerando reatividade, cache, sincronização de estado e segurança.

### Core Concept: Reactive vs Imperative
Em B2B Commerce, a diferença não é simplesmente ler ou escrever dados. A decisão envolve quem controla a execução e quem mantém o estado atualizado.

| Aspect              | Wire Adapter                           | Imperative Operation               |
| ------------------- | -------------------------------------- | ---------------------------------- |
| Execution           | Framework-controlled                   | Developer-controlled               |
| Typical purpose     | Reactive data retrieval                | Explicit operations                |
| Result              | Stream of values                       | Promise / single result            |
| Reactive parameters | Supported                              | Explicitly passed                  |
| Mutations           | Not appropriate                        | Supported                          |
| Cache               | Adapter/service-managed                | Depends on API                     |
| Typical trigger     | Initial configuration or state changes | Button click, event, explicit call |

Um detalhe crítico: uma chamada imperative também pode ser utilizada para leitura. Já métodos Apex que realizam DML não podem ser utilizados com `@wire`.

### B2B Commerce Storefront Architecture
No B2B Commerce com LWR, existem três mecanismos importantes: Wire Adapters, Imperative APIs e Storefront Actions.

![[mermaid-diagram (34).png]]

Por exemplo, ao adicionar um produto ao carrinho, uma *Imperative API* pode executar a operação, enquanto o *Commerce State Management* coordena atualizações dos adapters associados ao carrinho. Esse mecanismo evita a necessidade de criar eventos customizados para sincronizar manualmente cada componente.

### Practical Example — Shopping Cart

| Reactive Read                                                                                                                          | Explicit Mutation                                                                                         |
| -------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `CartSummaryAdapter`                                                                                                                   | `addItemToCart()`                                                                                         |
| Recupera informações sobre os totais do carrinho e permite que a interface reaja às atualizações disponibilizadas pelo Commerce state. | Adiciona um produto mediante uma operação explícita, normalmente iniciada por uma interação do comprador. |

####  **Example A — Wire Adapter**
```typescript
import { LightningElement, wire } from 'lwc';
import { CartSummaryAdapter } from 'commerce/cartApi';

export default class CartTotals extends LightningElement {
    @wire(CartSummaryAdapter)
    cartSummary;
}
```

> O resultado é disponibilizado por meio do wire, e alterações relevantes no estado do Commerce podem produzir novos valores.


> [!NOTE] @Wire
> O `@wire` é um decorator do LWC que **liga uma propriedade (ou função) do componente a uma fonte de dados reativa**, chamada de _wire adapter_. Você não chama nada manualmente: o framework faz a chamada, guarda em cache e atualiza o componente quando os dados mudam.
> 
>> `import { CartSummaryAdapter } from 'commerce/cartApi'; // ← o adapter (a fonte de dados)`
>>> - **Adapter** (`CartSummaryAdapter`): um objeto que sabe buscar dados e avisar quando há dados novos. Quem o fornece é a plataforma (`commerce/cartApi`, `lightning/uiRecordApi`, Apex etc.).
>>> - **Destino** (`cartSummary`): onde o LWC entrega o resultado.
>
>A propriedade sempre recebe um objeto com este formato:
>> `{ data: <resultado> | undefined, error: <erro> | undefined }`
>> Logo depois do componente ser criado, `data` e `error` estão os dois `undefined`. Eles só ganham valor quando o adapter responde.
>> Nos adapters de Commerce, o código de referência da Salesforce também lê um terceiro campo, `loaded`: `{ data, error, loaded }`.
>> ⚠️ Como a propriedade é **sempre um objeto**, testar `typeof this.x === 'object'` dá `true` mesmo sem resultado. Teste `this.x?.data`.
>
>**Ciclo de vida**
>> O componente é criado → o LWC instancia o adapter.
>
>> O componente entra no DOM (`connectedCallback`) → o adapter começa a buscar os dados.
>
>> Os dados chegam → o LWC atribui `{ data, error }` à propriedade → o template **re-renderiza automaticamente**.
>
>> Os dados mudam na fonte (por exemplo, um item é adicionado ao carrinho) → o adapter **avisa de novo** e a propriedade é atualizada. Isso é o que torna o wire _reativo_.
>
> O componente sai do DOM → o adapter é desconectado.
>No `CartSummaryAdapter` esse passo 4 é o ponto principal: quando qualquer parte da loja altera o carrinho, todo componente que usa o wire recebe o resumo atualizado sem você fazer nada.
##### Parâmetros reativos (`$`)
Muitos adapters recebem configuração. Se você prefixar um valor com `$`, ele vira **reativo**: quando a propriedade muda, o wire roda de novo.
```javascript
import { ProductAdapter } from 'commerce/productApi';

@api productId: string;

@wire(ProductAdapter, { productId: '$productId' })
product: any;
```

- Com `'$productId'`, se o `productId` mudar, o wire busca o novo produto.
- Com `'productId'` (sem `$`), o adapter recebe a **string literal** "productId", o que é um bug comum.
- O wire só roda quando todos os parâmetros reativos estão definidos (diferentes de `undefined`).

O `CartSummaryAdapter` não precisa de configuração, por isso o seu código passa só o adapter.

> [!warning] O formato da configuração muda de adapter para adapter
> O `ProductAdapter` recebe `{ productId }` solto, mas o `ProductSearchAdapter` recebe tudo dentro de `{ searchQuery }`. A documentação oficial não lista esses parâmetros. Veja as tabelas em [[#Configuração do wire por adapter]] e o [[#Estudo de caso — ProductSearchAdapter|estudo de caso do ProductSearchAdapter]].

##### @Wire em função (quando precisa tratar os dados)
Em vez de uma propriedade, você pode ligar o wire a um método e transformar o resultado:
```typescript
cartTotal?: string;

@wire(CartSummaryAdapter)
handleCart({ data, error }: { data?: any; error?: any }) {
  if (data) {
    this.cartTotal = data.grandTotalAmount;
  } else if (error) {
    console.error(error);
  }
}
```

Use a forma de ***propriedade*** quando só vai exibir os dados. Use a forma de função ***quando*** precisa calcular, mapear ou guardar partes do resultado.

#####  `@wire` vs chamada imperativa

|             | `@wire`                                                   | Imperativo (`await getX()`)                                              |
| ----------- | --------------------------------------------------------- | ------------------------------------------------------------------------ |
| Quando roda | Automaticamente, ao conectar e quando os parâmetros mudam | Quando você chama                                                        |
| Atualização | Reativa (recebe mudanças)                                 | Só uma vez                                                               |
| Uso típico  | **Ler** dados para exibir                                 | **Ações** (adicionar ao carrinho, salvar), ou buscar depois de um clique |
| Cache       | Sim (LDS / Commerce store)                                | Depende                                                                  |

Na loja, o padrão comum é: o **wire lê** o carrinho e **funções imperativas alteram** o carrinho (`addItemToCart`, por exemplo). A alteração dispara a atualização, e o wire entrega o carrinho novo para todos os componentes.

##### 🚩 Ponto de atenção no seu código (TypeScript)
`cartSummary: any` funciona, mas você perde a checagem de tipos. Se quiser tipar:
```typescript
@wire(CartSummaryAdapter)
cartSummary?: { data?: CartSummaryData; error?: unknown };
```

(`CartSummaryData` seria a sua interface com os campos que você usa, como `totalProductCount` e `grandTotalAmount`.)


#### **Example B — Imperative API**
Uma API imperativa é **uma função que você chama quando quer**. Ela retorna uma `Promise`. É o oposto do `@wire`: o framework não faz nada sozinho, o seu código decide o momento.

```typescript
import { LightningElement, api } from 'lwc';
import { addItemToCart } from 'commerce/cartApi';

export default class AddProduct extends LightningElement {
    @api productId;

    async handleAddToCart() {
        try {
            await addItemToCart(this.productId, 1);
        } catch (error) {
            // Handle the operation error
        }
    }
}
```

> O componente controla quando adicionar o produto. A função retorna uma Promise. Os mecanismos nativos de Commerce State Management podem refletir a alteração em outros componentes que utilizam os adapters correspondentes.

#####  Quando usar

| `@wire`                   | Imperativo                                        |
| ------------------------- | ------------------------------------------------- |
| **Ler** dados para exibir | **Alterar** dados (adicionar, atualizar, remover) |
| Roda sozinho ao conectar  | Roda quando você chama (clique, submit, etc.)     |
| Recebe atualizações       | Resposta única                                    |

![[mermaid-diagram (35).png]]

## ⚡ LWC — Commerce-specific LWC Fundamentals
**Objetivo**: compreender o que diferencia um Lightning Web Component tradicional de um componente desenvolvido especificamente para um B2B Commerce storefront.

### LWC vs Commerce-specific LWC
Um LWC tradicional é um componente de interface criado com HTML, JavaScript, CSS e metadata. Um Commerce-specific LWC utiliza essa mesma tecnologia, mas opera dentro do ecossistema comercial da loja.

|Traditional LWC|Commerce-specific LWC|
|---|---|
|Salesforce Platform context|LWR Commerce storefront context|
|General-purpose data APIs|Commerce Data Providers e Storefront APIs|
|Record-centric behavior|Buyer, Product, Cart e Checkout behavior|
|Conventional component state|Shared storefront state|
|General record access|Buyer entitlements e Commerce business rules|

O ponto central é que um Commerce component precisa respeitar as regras comerciais da loja, não apenas carregar e apresentar registros.

Por exemplo, um componente que mostra preços precisa considerar o buyer context, incluindo o effective account e as regras de precificação aplicáveis. Recuperar diretamente um valor de `Product2` não equivale a obter o preço comercial válido para aquele comprador.

Os Storefront APIs aplicam guardrails comerciais e oferecem mecanismos otimizados de integração entre componentes.

### A estratégia correta para customizar componentes
A Salesforce recomenda priorizar componentes existentes e fontes de dados nativas, evitando desenvolvimento desnecessário.

![[mermaid-diagram (36).png]]

A ordem recomendada é:
1. [OOTB Components](https://help.salesforce.com/s/articleView?id=commerce.comm_components.htm&type=5): aproveitar componentes padrão existentes.
	* **OOTB** quer dizer **Out-Of-The-Box**, "pronto para uso". São os **componentes padrão que a Salesforce já entrega com a loja LWR** de B2B/D2C. Eles aparecem no Experience Builder, e você só arrasta para a página e configura. Não precisa escrever código para [componentes personalizados](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-custom-component.html).
2. Data Providers + LWR Expressions: consumir dados fornecidos pelo contexto da página.
3. Commerce Storefront APIs: utilizar interfaces especializadas de dados e operações comerciais.
4. Custom Apex / Backend for Frontend (BFF): utilizar quando as opções anteriores não atendem à necessidade.


Evite chamadas diretas aos Connect APIs com `fetch()` quando uma Storefront API atende ao caso. Isso pode contornar otimizações de caching e coordenação de dados fornecidas pela plataforma.

### Commerce Data Binding e Rendering
Considere uma Product Detail Page (PDP) com um componente customizado que exibe uma informação adicional sobre o produto.

O Experience Builder pode fornecer dados por meio de [LWR Expressions](https://developer.salesforce.com/docs/platform/exp-cloud-lwr/guide/advanced-expressions.html), vinculando-os às propriedades `@api` do componente.

> ***Atenção***: os dados podem não estar disponíveis imediatamente. A plataforma pode preencher o contexto progressivamente, provocando novas renderizações.

Exemplo conceitual de um componente preparado para receber uma string configurada ou vinculada pelo Builder:

```typescript
import { LightningElement, api } from 'lwc';

export default class ProductMessage extends LightningElement {
    @api productMessage;

    get hasMessage() {
        return typeof this.productMessage === 'string'
            && this.productMessage.trim().length > 0;
    }
}
```

```html
<template>
    <template lwc:if={hasMessage}>
        <p>{productMessage}</p>
    </template>
</template>
```

O componente não pressupõe que o valor foi entregue antes da primeira renderização. Quando a propriedade pública recebe um valor posteriormente, o LWC pode atualizar a interface reativamente.

 >**Exam Trap**: não confunda ausência inicial de dados com falha definitiva de carregamento. O componente deve tolerar dados ainda não definidos ou incompletos.

### Experience Builder e Commerce Metadata
Para que esse componente seja adicionado visualmente à storefront, sua configuração `.js-meta.xml` precisa expor os targets apropriados.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>64.0</apiVersion>
    <isExposed>true</isExposed>
    <targets>
        <target>lightningCommunity__Page</target>
        <target>lightningCommunity__Default</target>
    </targets>
    <targetConfigs>
        <targetConfig targets="lightningCommunity__Default">
            <property
                name="productMessage"
                type="String"
                label="Product Message"/>
        </targetConfig>
    </targetConfigs>
</LightningComponentBundle>
```

Esse exemplo ilustra os targets e a propriedade editável. Em um projeto real, a versão e as capabilities adicionais devem ser compatíveis com o runtime da storefront.

| Metadata                      | Purpose                                 |
| ----------------------------- | --------------------------------------- |
| `isExposed=true`              | Permite exposição no Builder            |
| `lightningCommunity__Page`    | Disponibiliza como componente de página |
| `lightningCommunity__Default` | Habilita configuração de propriedades   |
| `targetConfigs`               | Define as propriedades configuráveis    |
| `@api`                        | Expõe a propriedade no JavaScript       |

A documentação específica de Commerce LWR também descreve a capability `lightningCommunity__RelaxedCSP` para componentes utilizados nesse runtime. Ela é distinta dos targets de posicionamento e edição de propriedades.

### Storefront APIs: três tipos de interação
| Mechanism          | Responsibility                                           | Example          |
| ------------------ | -------------------------------------------------------- | ---------------- |
| Wire Adapters      | Observação e provisionamento reativo de dados            | Cart summary     |
| Imperative APIs    | Execução de operações                                    | Add item to cart |
| Storefront Actions | Integração contextual entre componentes e Data Providers | Cart item action |

Considere um Product Detail component e um Cart Badge no mesmo storefront.

Quando o usuário adiciona um produto ao carrinho por uma interface Commerce suportada, a camada de state management coordena a atualização dos dados relevantes. Componentes inscritos nos adapters correspondentes podem receber as atualizações sem desenvolver uma solução paralela de sincronização.

Essa integração de estado é uma diferença importante em relação a tratar componentes como interfaces isoladas.

### Exam Decision Rules
|Requirement|Best-practice starting point|
|---|---|
|Standard PDP customization|Existing OOTB component|
|Data already supplied to a page|Data Provider + LWR Expression|
|Reactive cart summary|Commerce Wire Adapter|
|Buyer-initiated commerce operation|Commerce Imperative API ou Storefront Action apropriada|
|Unsupported specialized business process|Custom backend integration|
|Component missing from Builder|Check `isExposed`, targets and runtime requirements|

Regra fundamental do Day 15: Commerce-native first. Escolha uma solução que preserve buyer context, platform security, caching e storefront consistency antes de criar mecanismos customizados.

## ⚡ Advanced LWC — Custom Commerce Component Architecture
Hoje, nosso objetivo é compreender como projetar componentes personalizados para storefronts B2B Commerce, considerando arquitetura, responsabilidades, reatividade, integração com Commerce APIs e manutenção.

### Custom Commerce Component Architecture
#### Architecture: Standard vs Custom
Em um storefront B2B Commerce desenvolvido com Lightning Web Runtime (LWR), o arquiteto deve priorizar componentes padrão e utilizar custom LWCs quando houver requisitos não atendidos.

| Requirement                                                         | Preferred Architecture          |
| ------------------------------------------------------------------- | ------------------------------- |
| Ajustar aparência de um componente existente                        | OOTB Component + supported CSS  |
| Criar uma funcionalidade visual não disponível                      | Focused Custom LWC              |
| Consumir informações disponíveis na página                          | Data Provider + LWR Expressions |
| Acessar Commerce data sem Data Provider adequado                    | Storefront APIs                 |
| Implementar lógica de backend não suportada pelas opções anteriores | Custom Apex BFF                 |

Essa ordem reduz duplicação, facilita upgrades e aproveita mecanismos nativos de cache, segurança e reatividade.

#### Architectural Layers
![[mermaid-diagram (37).png]]
O Data Provider e os Storefront APIs integram componentes personalizados ao comportamento da plataforma, evitando fluxos paralelos desnecessários.

#### Data Access Strategy
A seleção da fonte de dados é uma das decisões mais importantes de arquitetura. A própria Salesforce recomenda esta ordem em [Commerce LWR Storefront Performance Best Practices](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-storefront-performance-best-practices.html): **Data Providers → Storefront APIs no cliente → Apex BFF**.

| Prioridade | Mecanismo                        | Quem busca o dado                        | Use quando                                                     |
| ---------- | -------------------------------- | ---------------------------------------- | -------------------------------------------------------------- |
| 1          | Data Providers + LWR Expressions | A **página**                             | O dado já existe no contexto da página                         |
| 2          | Commerce Storefront APIs         | O **componente**, via runtime de Commerce | O dado não está na página, ou é preciso **executar uma ação** |
| 3          | Custom Apex BFF                  | O **componente**, via Apex               | Nenhuma das opções anteriores atende                           |

*Priority 1* - **Data Providers + LWR Expressions**
Use quando as informações já estiverem disponíveis no contexto da página. É a abordagem preferencial, inclusive para dados utilizados em Server-Side Rendering (SSR).
	*LWR Expressions*: **LWR Expressions** são marcações no formato `{!...}` que você coloca **nas propriedades de um componente, dentro do Experience Builder**. Na hora de renderizar a página, a plataforma troca a expressão pelo dado real que vem de um **Data Provider** daquela página. O componente não sai buscando o dado. A página entrega o dado pronto para ele. As três peças:
```txt
Data Provider            →  LWR Expression              →  @api property do componente
(o dado da página)          (o "endereço" do dado)         (quem recebe)

Product page provider    →  {!Product.Details.fields.Name} →  @api productName
```

|Peça|Papel|
|---|---|
|**Data Provider**|Fonte de dados disponível naquela página. Exemplo: a página de produto tem os dados do produto que está sendo exibido.|
|**Expression `{!...}`**|O caminho até o dado dentro do provider.|
|**Propriedade `@api`**|Onde o valor chega no seu LWC.|

##### Onde a expressão fica de fato
**No componente, a LWR Expression não está no código.** Ela é o valor que a página coloca na propriedade `@api` de fora para dentro.

| Camada                       | O que tem                                                                 | Papel                                                                           |
| ---------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `.ts` / `.js`                | `@api productName?: string`                                               | **Recebe** o valor. O componente só diz: "aceito um texto aqui".                |
| `.js-meta.xml`               | `<property name="productName" default="{!Product.Details.fields.Name}"/>` | **Expõe** a propriedade no Builder e pode deixar a expressão como valor padrão. |
| Página no Experience Builder | campo "Product Name" = `{!Product.Details.fields.Name}`                   | **É aqui que a expressão fica.** Ela é salva nos metadados da página do site.   |

```txt
Builder (salvo na página):   productName = "{!Product.Details.fields.Name}"
                                    │
               plataforma resolve usando o Data Provider "Product"
                                    ▼
Seu componente recebe:       this.productName = "Furadeira X"
```

O componente **nunca vê** a string `{!...}`, só o valor já resolvido. Pense em uma função: o componente é a função e a expressão é o argumento que a página passa para ela. Por isso, num teste Jest você simula o resultado direto, sem expressão nenhuma:

```typescript
element.productName = 'Furadeira X';
```

O mesmo componente pode receber outra coisa em outra página (outra expressão ou um texto fixo como `"Promoção"`) e não percebe a diferença.

##### Exemplo completo
```xml
<!-- .js-meta.xml: isExposed=true + targets lightningCommunity__Page / __Default -->
<targetConfig targets="lightningCommunity__Default">
    <property name="productName" type="String" label="Product Name"
              default="{!Product.Details.fields.Name}" />
</targetConfig>
```

```typescript
import { LightningElement, api } from 'lwc';

export default class ProductHeading extends LightningElement {
    @api productName?: string;

    get hasProductName(): boolean {
        return typeof this.productName === 'string' && this.productName.length > 0;
    }
}
```

```html
<template>
    <template lwc:if={hasProductName}>
        <h1>{productName}</h1>
    </template>
</template>
```

> [!warning] `{!...}` ≠ `{...}`
> - `{!Product.Details.fields.Name}` é a **LWR Expression**. Ela fica no Builder e liga a **página ao componente**.
> - `{productName}` é o **binding de template do LWC**. Ele fica no HTML e liga o **JS ao HTML**.

##### Por que é a Prioridade 1
- **Nenhuma chamada a mais:** o componente não usa wire, não chama Apex e não faz fetch.
- **Mesmo dado dos componentes padrão:** preço e nome são os mesmos que os componentes OOTB da página mostram.
- **Atualiza sozinho:** se o provider muda (por exemplo, o carrinho é atualizado), o `@api` recebe o valor novo e o componente renderiza de novo.
- **Componente só de exibição:** reaproveitável e fácil de testar. O admin pode ligar outra expressão sem deploy.

##### Limites (quando descer para a Prioridade 2 ou 3)
| Limite                                                                           | Alternativa                         |
| -------------------------------------------------------------------------------- | ----------------------------------- |
| Só funciona na página que tem aquele provider (`Product` não existe no carrinho) | Storefront APIs ou Apex BFF         |
| Só traz o que o provider expõe; dado customizado ou agregado fica de fora        | Apex BFF                            |
| Só leitura: não serve para ações como adicionar ao carrinho                      | Storefront APIs (Imperative/Action) |
| O dado chega de forma assíncrona e pode vir `undefined` no primeiro render       | Getter de guarda (`hasProductName`) |

> [!caution] Não validado na documentação
> Os caminhos dentro de cada provider (ex.: `Product.Details.fields.Name`) não foram conferidos na documentação oficial. Confirme no Builder antes de usar.

---

*Priority 2* - **[Commerce Storefront APIs](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-display-lwc-apis.html)**
Use quando o Data Provider não fornecer os dados ou o comportamento necessário. O Storefront Runtime oferece mecanismos de caching, buyer entitlements e sincronização de estado.

> Commerce Storefront APIs São módulos JavaScript do runtime de Commerce que você importa direto no LWC de um store LWR (import ... from 'commerce/cartApi').

> Eles são responsáveis por buscar dados do servidor, e não da página. O componente que importa o módulo é quem faz a busca, e não a página.

> Por baixo, eles chamam as Connect REST APIs de Commerce, que já sabem qual é o webstore, a effective account e os entitlements do comprador. Eles também usam o State Management do store: quando um componente muda o carrinho, os outros componentes que leem o carrinho se atualizam sozinhos.

| Tipo                   | Para quê                                                            | Quando roda                                                                                      | Exemplo                        |
| ---------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------ |
| **Wire Adapters**      | **Ler** dados (GET)                                                 | Quando o componente carrega ou um parâmetro muda. Atualiza sozinho quando o dado muda.           | `@wire(CartSummaryAdapter)`    |
| **Imperative APIs**    | **Executar ações** (POST/PUT/PATCH)                                 | Quando você chama, por exemplo num clique de botão                                               | `addItemToCart(...)`           |
| **Storefront Actions** | Reagir a eventos da tela e avisar os componentes vizinhos em cadeia | No evento. São mais rápidas que ir ao backend, mas podem disparar wires ou chamadas imperativas. | `createCartItemAddAction(...)` |

> **Resumo:** wire para **ler**, imperativo para **fazer**, action para **avisar os vizinhos**.

##### Módulos por área (segundo a documentação)
Lista da tabela oficial de [Storefront APIs](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-display-lwc-apis.html). Os módulos e funções disponíveis mudam conforme a versão da API (a doc vai da 53.0 à 64.0), então confira a versão da sua org.

| Módulo                         | Wire Adapters                                                                                                                                                                                       | Imperative APIs                                                                                                                                                                                 |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `commerce/productApi`          | `ProductAdapter`, `ProductCollectionAdapter`, `ProductCategoryAdapter`, `ProductCategoryHierarchyAdapter`, `ProductCategoryPathAdapter`, `ProductChildrenAdapter`, `ProductPricingAdapter`, `ProductSearchAdapter`, `ProductTaxAdapter` | `getProductCollection`, `getProductPricingCollection`, `getProductRecommendations`, `searchProducts`                                                                                            |
| `commerce/cartApi`             | `CartAdapter`, `CartSummaryAdapter`, `CartItemsAdapter`, `CartStatusAdapter`, `CartCouponsAdapter`, `CartPromotionsAdapter`                                                                         | `addItemToCart`, `addItemsToCart`, `updateItemInCart`, `deleteItemFromCart`, `deleteCurrentCart`, `applyCouponToCart`, `deleteCouponFromCart`, `refreshCartSummary`, `updateCartStatusProcessing` |
| `commerce/checkoutApi`         | `CheckoutInformationAdapter`, `CheckoutAddressAdapter`, `CheckoutGuestEmailAdapter`                                                                                                                 | `loadCheckout`, `updateShippingAddress`, `updateDeliveryMethod`, `updateContactInformation`, `updateGuestEmail`, `authorizePayment`, `simplePurchaseOrderPayment`, `placeOrder`, `restartCheckout` |
| `commerce/orderApi`            | `OrderAdapter`, `OrdersAdapter`, `OrderItemsAdapter`, `OrderDeliveryGroupsAdapter`, `OrdersAdjustmentsAdapter`, `OrderItemsAdjustmentsAdapter`, `OrderSummaryLookupAdapter`                         | `startReOrder`, `authorizeOrderSummaryAccess`                                                                                                                                                   |
| `commerce/wishlistApi`         | `WishlistAdapter`, `WishlistsAdapter`                                                                                                                                                               | `addItemToWishlist`, `addWishlistToCart`, `createWishlist`, `updateWishlist`, `deleteItemFromWishlist`, `deleteWishlist`                                                                        |
| `commerce/contextApi`          | `AppContextAdapter`, `SessionContextAdapter`                                                                                                                                                        | `getAppContext`, `getSessionContext`                                                                                                                                                            |
| `commerce/effectiveAccountApi` | —                                                                                                                                                                                                   | `effectiveAccount.update` (troca de conta)                                                                                                                                                      |
| `commerce/myAccountApi`        | —                                                                                                                                                                                                   | `createMyAccountAddress`, `updateMyAccountAddress`, `deleteMyAccountAddress`, `updateMyAccountProfile`, `resetPassword`                                                                         |
| `commerce/promotionApi`        | —                                                                                                                                                                                                   | `getPromotionPricingCollection`                                                                                                                                                                 |
| `commerce/activitiesApi`       | —                                                                                                                                                                                                   | `trackViewProduct`, `trackAddProductToCart`, `trackViewReco`, `trackClickReco` (tracking do Einstein)                                                                                           |
| `commerce/recommendationsApi`  | `ProductRecommendationsAdapter`*                                                                                                                                                                    | —                                                                                                                                                                                               |
| `commerce/actionApi`           | —                                                                                                                                                                                                   | Fábricas de **Storefront Actions**: `createCartItemAddAction`, `createCartItemUpdateAction`, `createCartItemDeleteAction`, `createCouponApplyAction`, `createCheckoutPlaceOrderAction`, `createSearchFiltersUpdateAction`, `createWishlistItemAddAction`... |
| `experience/navigationMenuApi` | `getNavigationMenu`                                                                                                                                                                                 | —                                                                                                                                                                                               |
| `experience/cmsDeliveryApi`    | `getContent`                                                                                                                                                                                        | —                                                                                                                                                                                               |

\* A própria doc cita dois módulos para esse adapter (`commerce/recommendationsApi` e `commerce/einsteinAPI`). Veja a tabela de divergências abaixo.

> [!warning] Divergências entre a doc e o código de referência da Salesforce
> | Adapter                                  | Doc                                                    | Código de referência        |
> | ---------------------------------------- | ------------------------------------------------------ | --------------------------- |
> | `CartAdapter`, `CartStatusAdapter`       | `commerce/cartApi`                                     | `commerce/checkoutCartApi`  |
> | `ProductRecommendationsAdapter`          | `commerce/recommendationsApi` ou `commerce/einsteinAPI` | `commerce/productApi`       |
>
> Se um import falhar, tente o outro módulo.
>
> O código de referência também usa adapters que **não aparecem na tabela da doc**: `ProductPricingCollectionAdapter`, `ProductInventoryLevelsAdapter`, `ProductSearchSuggestionAdapter`, `CartContentsAdapter`, `CheckoutAdapter`, `MyAccountProfileAdapter`, `MyAccountAddressesAdapter`, `ManagedAccountsAdapter`, `PromotionApplicableAdapter`.

##### Configuração do wire por adapter
> [!important] A documentação não lista os parâmetros dos adapters
> A tabela oficial só traz o nome, o módulo, a versão e um link para o endpoint REST. **O formato da configuração do `@wire` não está documentado e muda de adapter para adapter.**
> As tabelas abaixo foram levantadas a partir de todos os `@wire` dos dois repositórios de referência da Salesforce: [b2b-commerce-open-source-components](https://github.com/forcedotcom/b2b-commerce-open-source-components) e [commerce-on-lightning-components](https://github.com/forcedotcom/commerce-on-lightning-components/tree/release).

**Padrão 1: sem configuração (o contexto já basta)**

Todos dizem respeito ao comprador ou à sessão atual, então não precisam de parâmetro.

| Adapter                                         | Módulo (no código de referência) | Config |
| ----------------------------------------------- | -------------------------------- | ------ |
| `AppContextAdapter`, `SessionContextAdapter`    | `commerce/contextApi`            | —      |
| `CartAdapter`, `CartStatusAdapter`, `CheckoutAdapter` | `commerce/checkoutCartApi`  | —      |
| `MyAccountProfileAdapter`                       | `commerce/myAccountApi`          | —      |
| `ManagedAccountsAdapter`                        | `commerce/effectiveAccountApi`   | —      |

**Padrão 2: parâmetros soltos (o mais comum)**

| Adapter                            | Módulo                    | Config                                                                         |
| ---------------------------------- | ------------------------- | ------------------------------------------------------------------------------ |
| `ProductAdapter`, `ProductTaxAdapter` | `commerce/productApi`  | `{ productId }`                                                                |
| `ProductPricingAdapter`            | `commerce/productApi`     | `{ productId, allProductSellingModelPrices }`                                  |
| `ProductPricingCollectionAdapter`  | `commerce/productApi`     | `{ productIds }` (array)                                                       |
| `ProductInventoryLevelsAdapter`    | `commerce/productApi`     | `{ productIds }` (array)                                                       |
| `ProductCategoryPathAdapter`       | `commerce/productApi`     | `{ categoryId }`                                                               |
| `ProductChildrenAdapter`           | `commerce/productApi`     | `{ productId, mediaGroups, pageSize, includeProductSellingModels }`            |
| `ProductSearchSuggestionAdapter`   | `commerce/productApi`     | `{ searchTerm, includeSuggestedProducts, includeSuggestedTerms, popularCategory }` |
| `ProductRecommendationsAdapter`    | `commerce/productApi`     | `{ anchorValues, recommender }`                                                |
| `CartContentsAdapter`              | `commerce/checkoutCartApi` | `{ pageSize }` ou `{ cartId }` (ou sem config)                                |
| `MyAccountAddressesAdapter`        | `commerce/myAccountApi`   | `{ accountId, addressType, excludeUnsupportedCountries, defaultOnly }`         |
| `MyAccountAddressDetailAdapter`    | `commerce/myAccountApi`   | `{ addressId }`                                                                |
| `WishlistsAdapter`                 | `commerce/wishlistApi`    | `{ includeDisplayedList, pageSize, productFields }`                            |
| `ChildSubscriptionsAdapter`        | `commerce/subscriptionApi` | `{ subscriptionId, effectiveAccountId }`                                      |

**Padrão 3: um objeto embrulhado numa única chave (exceção)**

| Adapter                      | Módulo                 | Config            |
| ---------------------------- | ---------------------- | ----------------- |
| `ProductSearchAdapter`       | `commerce/productApi`  | `{ searchQuery }` |
| `PromotionApplicableAdapter` | `commerce/promotionApi` | `{ cart }`       |

O `ProductSearchAdapter` foge do padrão. O `ProductSearchSuggestionAdapter`, que também é de busca, recebe `searchTerm` solto. Ou seja, **não dá para deduzir o formato pelo nome**.

```typescript
// Padrão 1: sem config
@wire(CartStatusAdapter) cartStatus;

// Padrão 2: parâmetros soltos
@wire(ProductAdapter, { productId: '$recordId' }) product;
@wire(ProductPricingCollectionAdapter, { productIds: '$productIds' }) prices;

// Padrão 3: objeto embrulhado
@wire(ProductSearchAdapter, { searchQuery: '$searchQuery' }) searchResult;
```

**O que se mantém em todos**
- **`webstoreId` nunca é passado.** O `effectiveAccountId` também quase nunca (a única exceção encontrada é o `commerce/subscriptionApi`). O runtime do store já conhece esse contexto.
- O **`$`** funciona igual em todos os adapters.
- Nos exemplos, o resultado vem como **`{ data, error, loaded }`**.

##### Estudo de caso — ProductSearchAdapter
Na [tabela de Wire Adapters da doc](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-display-lwc-apis.html#wire-adapters-in-the-commerce-namespace), o `ProductSearchAdapter` aparece só com módulo (`commerce/productApi`), versão (57.0), descrição ("Retrieves products by search parameters") e um link para o endpoint **Commerce Webstore Product Search**. O erro natural é copiar os parâmetros do endpoint REST para o `@wire`:

```typescript
// ❌ NÃO FUNCIONA: parâmetros do REST soltos + webstoreId fixo
@wire(ProductSearchAdapter, { webstoreId: '0ZE...', searchTerm: '$searchTerm', pageSize: 10 })
productSearchResult?: any;

get hasProductSearchResult(): boolean {
    // ❌ sempre true: a propriedade do wire é sempre um objeto { data, error, loaded }
    return typeof this.productSearchResult === 'object' && this.productSearchResult !== null;
}
```

O adapter recebe **uma única chave, `searchQuery`**, com os campos do **corpo** do REST dentro dela. O `webstoreId` vem do contexto.

```typescript
// ✅ Formato usado pelos componentes de referência da Salesforce
import { LightningElement, api, wire } from 'lwc';
import { ProductSearchAdapter } from 'commerce/productApi';

export default class ProductSearchList extends LightningElement {
    @api searchTerm?: string;

    get searchQuery() {
        return { searchTerm: this.searchTerm, page: 0, pageSize: 10, includePrices: false };
    }

    @wire(ProductSearchAdapter, { searchQuery: '$searchQuery' })
    productSearchResult?: { data?: any; error?: any; loaded?: boolean };

    get products(): any[] {
        return this.productSearchResult?.data?.productsPage?.products ?? [];
    }

    get hasProductSearchResult(): boolean {
        return (this.productSearchResult?.data?.productsPage?.total ?? 0) > 0;
    }
}
```

| Campo de `searchQuery` (vistos no código de referência) | Para quê                                  |
| ------------------------------------------------------- | ----------------------------------------- |
| `searchTerm`                                            | Termo buscado                             |
| `categoryId`                                            | Restringe a uma categoria                 |
| `refinements`                                           | Filtros (facets) aplicados                |
| `page`, `pageSize`                                      | Paginação (`page` começa em 0)            |
| `fields`                                                | Campos do produto a retornar              |
| `grouping`                                              | Agrupamento dos resultados (ex.: `'NoGrouping'`) |
| `includePrices`, `includeQuantityRule`                  | Incluir preço / regra de quantidade       |

O resultado fica em `data.productsPage.products` e o total em `data.productsPage.total`.

> [!tip] Getter ou setter para montar o `searchQuery`?
> O getter funciona como parâmetro reativo porque depende do `@api searchTerm` (ainda não testado em org). O código da Salesforce prefere **recriar o objeto num setter**, que é o padrão mais seguro:
> ```typescript
> _searchTerm?: string;
> _searchQuery?: object;
>
> @api
> get searchTerm() { return this._searchTerm; }
> set searchTerm(value) {
>     this._searchTerm = value;
>     this._searchQuery = { searchTerm: value, page: 0, includePrices: false };
> }
>
> @wire(ProductSearchAdapter, { searchQuery: '$_searchQuery' })
> ```
> Prefira **recriar o objeto** (como faz o `searchFiltersModalPanel`) em vez de alterar um campo dele. Assim o wire percebe a mudança com certeza.

> [!note] Endpoint REST
> O link da doc aponta para o endpoint `POST /commerce/webstores/{webstoreId}/search/product-search` ([Commerce Webstore Product Search](https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/connect_resources_commerce_webstore_product_search.htm)). Segundo a doc de [Product and Category APIs](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-d2c-comm-product-category-apis.html), ele foi substituído pelo `GET` [Commerce Webstore Search Products](https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/connect_resources_commerce_webstore_search_products.htm). Use esses endpoints só para conhecer os **nomes dos campos**. O LWC continua usando o adapter.

##### Como descobrir o formato de um adapter
1. **Doc oficial:** confirme nome, módulo e versão mínima na tabela de [Storefront APIs](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-display-lwc-apis.html).
2. **Código de referência:** procure `@wire(NomeDoAdapter` nos dois repositórios da Salesforce. É a fonte mais confiável para a configuração.
3. **Endpoint REST** linkado na doc: serve para conhecer os nomes dos campos.

```bash
# No Windows, core.longpaths evita o erro "Filename too long"
git -c core.longpaths=true clone --depth 1 https://github.com/forcedotcom/b2b-commerce-open-source-components.git
git -c core.longpaths=true clone --depth 1 https://github.com/forcedotcom/commerce-on-lightning-components.git
grep -rn "@wire(ProductSearchAdapter" --include=*.js .
```

> [!caution] Sem exemplo de referência
> Adapters como `OrderAdapter` e `CheckoutInformationAdapter` não têm nenhum `@wire` nesses repositórios, então o formato deles não foi confirmado.

##### Fontes
- [Storefront APIs](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-display-lwc-apis.html): tipos, módulos e lista de adapters
- [Commerce LWR Storefront Performance Best Practices](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-storefront-performance-best-practices.html): ordem de prioridade
- [Salesforce Commerce Cart APIs](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-d2c-comm-cart-apis.html)
- [Salesforce Commerce Product and Category APIs](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-d2c-comm-product-category-apis.html)
- [Public Commerce LWR Library](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-public-lwr-library.html)
- Uso real do `ProductSearchAdapter`: [searchFiltersModalPanel.js](https://github.com/forcedotcom/commerce-on-lightning-components/blob/release/force-app/main/default/lwc/searchFiltersModalPanel/searchFiltersModalPanel.js), [topSellers.js](https://github.com/forcedotcom/b2b-commerce-open-source-components/blob/main/force-app/main/default/sfdc_cms__lwc/topSellers/topSellers.js), [orderQuickOrderItem.js](https://github.com/forcedotcom/b2b-commerce-open-source-components/blob/main/force-app/main/default/sfdc_cms__lwc/orderQuickOrderItem/orderQuickOrderItem.js)

---

*Priority 3* - **Custom Apex Backend For Frontend (BFF)**
Reserve para operações específicas que não possam ser resolvidas adequadamente pelos mecanismos anteriores. Minimize chamadas de rede e implemente controles apropriados de acesso e caching.

Uma implementação que recupera diretamente dados comerciais por `fetch()` usando Connect APIs pode funcionar em determinados contextos, mas não é o padrão recomendado para custom Commerce LWCs.

#### Component Responsibilities & Communication
Uma arquitetura bem organizada separa responsabilidades:

|Layer|Responsibility|
|---|---|
|Presentation|Exibir valores, estados de loading e erros|
|Component Logic|Validar inputs, controlar interações e coordenar operações|
|Commerce Integration|Consumir dados e executar ações por meio dos Storefront APIs|
|Commerce State|Manter o estado compartilhado sincronizado com outros componentes|
|Backend|Aplicar regras de negócio, segurança e processamento server-side|
**Important distinction:** `CustomEvent` resolve comunicação entre componentes LWC, mas não substitui uma Commerce API. Disparar um evento customizado não atualiza automaticamente o cart ou os dados gerenciados pelo Commerce State Management.

Também é importante evitar duplicar o mesmo estado em componentes independentes. Para informações compartilhadas do Commerce, prefira a fonte de estado fornecida pela plataforma.

#### Experience Builder Metadata
Um custom LWC precisa estar configurado corretamente para ser disponibilizado no Experience Builder.

O exemplo abaixo apresenta um componente arrastável com uma propriedade editável:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>64.0</apiVersion>
    <isExposed>true</isExposed>
    <targets>
        <target>lightningCommunity__Page</target>
        <target>lightningCommunity__Default</target>
    </targets>
    <targetConfigs>
        <targetConfig targets="lightningCommunity__Default">
            <property
                name="heading"
                type="String"
                label="Heading"
            />
        </targetConfig>
    </targetConfigs>
</LightningComponentBundle>
```

E na classe JavaScript:
```typescript
import { LightningElement, api } from 'lwc';

export default class CommerceBanner extends LightningElement {
    @api heading;
}
```

`lightningCommunity__Page` permite inserir o componente na página. `lightningCommunity__Default` define as propriedades configuráveis no Experience Builder. A propriedade declarada no metadata deve corresponder à propriedade pública do LWC.

#### Asynchronous Expressions & SSR
Um erro comum em custom Commerce components é presumir que valores recebidos por expressions estejam disponíveis imediatamente.

Exemplo:
```typescript
import { LightningElement, api } from 'lwc';

export default class ProductBadge extends LightningElement {
    @api product;

    get productName() {
        return this.product?.name ?? 'Loading...';
    }

    get hasProduct() {
        return Boolean(this.product?.id);
    }
}
```

O componente deve aceitar a ausência inicial dos dados e reagir quando as propriedades públicas forem atualizadas.

Para componentes que participam do Server-Side Rendering, as funções executadas no servidor não podem depender incondicionalmente de APIs exclusivas do navegador, como `window` e `document`. O código SSR deve ser portátil e as operações browser-only precisam ser isoladas do caminho de execução no servidor.

#### Exam Decision Framework
Ao analisar um cenário de certificação, considere primeiro estas decisões arquiteturais:

![[mermaid-diagram (38).png]]

Exam trap: Não confunda facilidade de implementação com a melhor decisão arquitetural. Uma solução baseada em Apex ou chamadas REST adicionais pode ser tecnicamente possível, mas ser inferior a uma solução declarativa ou a um Storefront API suportado.

## ⚡ Advanced LWC — Storefront APIs & State Management
Study objectives:
- Commerce Storefront APIs
- Storefront State Management
- Reactive Cart and Session Data
- Wire Adapters vs Imperative API Operations
- Data Consistency and Component Synchronization

### Technical Study — Storefront APIs
O ponto central do Day 17 é compreender como diferentes LWCs compartilham dados e permanecem sincronizados sem criar requisições redundantes ou manter estados conflitantes.

---

***Three Storefront API mechanisms***

|Mechanism|Primary Responsibility|Typical Use|
|---|---|---|
|Wire Adapters|Reactive data retrieval|Manter componentes sincronizados com alterações|
|Imperative APIs|Explicit operations|Executar uma operação iniciada pelo buyer|
|Storefront Actions|Context-aware interactions|Encaminhar ações ao Data Provider aplicável|

***Os três mecanismos participam do State Management do Commerce Runtime, mas possuem responsabilidades distintas***

---

### State Management Architecture
![[mermaid-diagram (39).png]]

***Key principle***: Component synchronization should be managed through the platform's State Management mechanisms rather than independently coordinating every custom LWC.

### Choosing the Correct Data Access Strategy
For Commerce LWR storefronts, the recommended priority is:
- Existing OOTB components when sufficient.
- Data Providers + LWR Expressions for custom components.
- Commerce Runtime Storefront APIs when provider data is insufficient.
- Custom Apex Backend-for-Frontend APIs when necessary.

Avoid direct Connect API calls through browser `fetch()` when Commerce Storefront APIs can perform the operation. This preserves supported caching, Commerce security behavior, and coordinated state updates.

#### Commerce Context APIs
The `commerce/contextApi` module offers:

|API|Responsibility|
|---|---|
|`AppContextAdapter`|Reactive application context|
|`SessionContextAdapter`|Reactive session context|
|`getAppContext()`|Imperative application-context retrieval|
|`getSessionContext()`|Imperative session-context retrieval|

A critical exam distinction is that retrieving a context value once is not equivalent to subscribing to reactive context updates.

#### Advanced B2B Considerations
A buyer switching `effectiveAccount` introduces a context change that can affect entitlements, pricing, and other account-dependent results.

Custom asynchronous operations must also guard against responses from an earlier account context. A response completing later does not make it valid for the current buyer context.

For the exam, distinguish shared Commerce-managed state from component-local temporary state. They should not be treated as interchangeable.