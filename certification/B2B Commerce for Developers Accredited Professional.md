---
tags:
  - salesforce
  - b2b-commerce
  - certification
  - lwc
exam: B2B Commerce for Developers Accredited Professional
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
