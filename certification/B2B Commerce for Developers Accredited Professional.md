![[Pasted image 20260926211247.png]]

## 🗓️ Day 1 - 24/09 Data Management
![[Pasted image 20260924213934.png]]
### **Data Management**
- WebStore
- BuyerAccount
- BuyerGroup

#### [WebStore](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_webstore.htm?q=webstore)
![[Pasted image 20260926211420.png]]

A website where buyers and shoppers complete wholesale and retail transactions. Includes the fields and properties that define your store. For example, supported currencies, languages, and price books. Many fields are customizable.

##### SObject Details
**WebStore**: Represents a B2B or D2C store. This object is available in API version 49.0 and later.

###### Support Calls
create(), delete(), describeLayout(), describeSObjects(), getDeleted(), getUpdated(), query(), retrieve(), search(), undelete(), update(), upsert()

###### Associated Objects
This object has the following associated objects. If the API version isn’t specified, they’re available in the same API versions as this object. Otherwise, they’re available in the specified API version and later.

[WebStoreEvent](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_change_event.htm "A ChangeEvent object is available for each object that supports Change Data Capture. You can subscribe to a stream of change events using Change Data Capture to receive data tied to record changes in Salesforce. Changes include record creation, updates to an existing record, deletion of a record, and undeletion of a record. A change event isn’t a Salesforce object—it doesn’t support CRUD operations or queries. It’s included in the object reference so you can discover which Salesforce objects support change events.") (API version 55.0)
Change events are available for the object.

###### See Also
- [WebStoreNetwork](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_webstorenetwork.htm "Represents the relationship between a web store and an experience site. This object is available in API version 49.0 and later.")
- [Store Data Limits](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-data-model-store-limits.html)

#### [BuyerAccount](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_buyeraccount.htm?q=BuyerAccount)
The buyer’s or shopper’s financial information, including credit and order limits, some of which pertain only to B2B.

##### SObject Details
**BuyerAccount**: Represents an account that is enabled as a buyer for Lightning B2B Commerce. This object is available in API version 48.0 and later.

###### Support Calls
create(), delete(), describeLayout(), describeSObjects(), getDeleted(), getUpdated(), query(), retrieve(), undelete(), update(), upsert()

###### Associated Objects
This object has the following associated objects. If the API version isn’t specified, they’re available in the same API versions as this object. Otherwise, they’re available in the specified API version and later.

[BuyerAccountFeed](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_feed.htm "StandardObjectNameFeed is the model for all feed objects associated with standard objects. These objects represent the posts and feed-tracked changes of a standard object.")
Feed tracking is available for the object.

[BuyerAccountHistory](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_history.htm "StandardObjectNameHistory is the model for all history objects associated with standard objects. These objects represent the history of changes to the values in the fields of a standard object.")
History is available for tracked fields of the object.

[BuyerAccountShare](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_share.htm "StandardObjectNameShare is the model for all share objects associated with standard objects. These objects represent a sharing entry on the standard object.")
Sharing is available for the object.

#### [BuyerGroup](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_buyergroup.htm?q=BuyerGroup)
A group of buyers with the same assigned entitlement policies, price books, and products. Buyer Group name and description are customizable.

##### SObject Details
**BuyerGroup**: Associates group qualifiers (entitlements, price books, promotions, and shipping methods) with buyer members based on buyer account ID or on the localized language and currency of the market browsed in a webstore. This object is available in API version 57.0; amended to support Market in version 58.0 and later.

###### Support Calls
create(), delete(), describeLayout(), describeSObjects(), getDeleted(), getUpdated(), query(), retrieve(), search(), undelete(), update(), upsert()

###### Associated Objects
This object has the following associated objects. If the API version isn’t specified, they’re available in the same API versions as this object. Otherwise, they’re available in the specified API version and later.

[BuyerGroupChangeEvent](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_change_event.htm "A ChangeEvent object is available for each object that supports Change Data Capture. You can subscribe to a stream of change events using Change Data Capture to receive data tied to record changes in Salesforce. Changes include record creation, updates to an existing record, deletion of a record, and undeletion of a record. A change event isn’t a Salesforce object—it doesn’t support CRUD operations or queries. It’s included in the object reference so you can discover which Salesforce objects support change events.")
Change events are available for the object.

[BuyerGroupFeed](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_feed.htm "StandardObjectNameFeed is the model for all feed objects associated with standard objects. These objects represent the posts and feed-tracked changes of a standard object.")
Feed tracking is available for the object.

[BuyerGroupHistory](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_history.htm "StandardObjectNameHistory is the model for all history objects associated with standard objects. These objects represent the history of changes to the values in the fields of a standard object.")
History is available for tracked fields of the object.

[BuyerGroupOwnerSharingRule](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_ownersharingrule.htm "StandardObjectNameOwnerSharingRule is the model for all owner sharing rule objects associated with standard objects. These objects represent a rule for sharing a standard object with users other than the owner.")
Sharing rules are available for the object.

[BuyerGroupShare](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_share.htm "StandardObjectNameShare is the model for all share objects associated with standard objects. These objects represent a sharing entry on the standard object.")
Sharing is available for the object.

---

## 🗓️ Day 2 - 26/09 Data Management
![[ChatGPT Image Sep 26, 2026, 01_51_50 PM.png]]

### **Data Management**
- Products
- Catalogs
- Categories 
- Entitlement Policies

#### [Products](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_product2.htm?q=Product2)
The items and services you sell. The Commerce Admin or Merchandiser uses data import to fill in a default compact layout, which includes a variety of customizable fields (name, family, and so on).

Product2
   │
   ├── Catalog / Category
   │
   ├── Entitlement
   │
   └── Pricing


##### SObject Details
This object has several fields that are used only for quantity and revenue schedules (for example, annuities). Schedules are available only for orgs that have enabled the products and schedules features. If these features aren’t enabled, the schedule fields don’t appear, and you can’t query, create, or update the fields.

###### Support Calls
create(), delete(), describeLayout(), describeSObjects(), getDeleted(), getUpdated(), query(), retrieve(), search(), undelete(), update(), upsert()

###### Associated Objects
This object has the following associated objects. If the API version isn’t specified, they’re available in the same API versions as this object. Otherwise, they’re available in the specified API version and later.

[Product2ChangeEvent](https://developer.salesforce.com/docs/atlas.en-us.264.0.object_reference.meta/object_reference/sforce_api_associated_objects_change_event.htm) (API version 44.0)
Change events are available for the object.

[Product2Feed](https://developer.salesforce.com/docs/atlas.en-us.264.0.object_reference.meta/object_reference/sforce_api_associated_objects_feed.htm) (API version 18.0)
Feed tracking is available for the object.

[Product2History](https://developer.salesforce.com/docs/atlas.en-us.264.0.object_reference.meta/object_reference/sforce_api_associated_objects_history.htm)
History is available for tracked fields of the object.

[Product2OwnerSharingRule](https://developer.salesforce.com/docs/atlas.en-us.264.0.object_reference.meta/object_reference/sforce_api_associated_objects_ownersharingrule.htm) (API version 50.0)
Sharing rules are available for the object.

#### [Product Catalog](https://help.salesforce.com/s/articleView?id=sales.pricebooks_landing_page.htm&type=5)
A catalog is a collection of the products that you sell, organized into different categories. The Commerce Admin or Merchandiser uses data import to set up the catalog.

![[Pasted image 20260926212000.png]]

O [**ProductCatalog**](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_productcatalog.htm) representa a coleção estruturada dos produtos vendidos.

B2B Nexus Figures Store
        │
        ▼
Nexus Product Catalog
        │
        ├── Marvel
        ├── DC Comics
        └── Anime
A definição oficial é, essencialmente, uma coleção de produtos organizada em diferentes **Categories**

🎯 **Regra importante de prova**
> ***A Store can be associated with only one Product Catalog.***

Por outro lado:

> ***A Product Catalog can be associated with multiple Stores.***

WebStore A ─────┐
                │
WebStore B ─────┼──► ProductCatalog
                │
WebStore C ─────┘

##### SObject Details
The container that holds a Product Category hierarchy. This object is available in API version 55.0 and later.

###### Support Calls
create(), delete(), describeLayout(), describeSObjects(), getDeleted(), getUpdated(), query(), retrieve(), search(), undelete(), update(), upsert()

###### ⚠️ Exam Alert

Se aparecer:

> A company needs to organize the products available in its storefront into a centralized collection.

Pense em: **ProductCatalog**

#### [Product Category](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_productcategory.htm)
> Categories and subcategories organize and group products in your catalog and on your storefront. Layout is customizable.

Aqui aparece uma confusão comum.
> ***Catalog ≠ Category***

O Catalog é o container/estrutura geral. As **Categories** organizam os produtos dentro desse Catalog.

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

A Salesforce define Categories e Subcategories como estruturas usadas para **organizar e agrupar produtos no catalog e storefront**.

- Isso também influencia a experiência de:
	- navigation
	- browsing
	- search
	- category pages

**Relacionamento com Product**
Existe um objeto importante no Data Model: `ProductCategoryProduct`

Ele faz a associação entre:
Product2
   ↕
ProductCategoryProduct
   ↕
ProductCategory

Mentalmente:
> ProductCategoryProduct = Product ↔ Category relationship

##### SObject Details
Represents the category that products are organized in.This object is available in API version 49.0 and later.

###### Support Calls
create(), delete(), describeLayout(), describeSObjects(), getDeleted(), getUpdated(), query(), retrieve(), search(), undelete(), update(), upsert()

###### Associated Objects
This object has the following associated objects. If the API version isn’t specified, they’re available in the same API versions as this object. Otherwise, they’re available in the specified API version and later.

[ProductCategoryChangeEvent](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_associated_objects_change_event.htm "A ChangeEvent object is available for each object that supports Change Data Capture. You can subscribe to a stream of change events using Change Data Capture to receive data tied to record changes in Salesforce. Changes include record creation, updates to an existing record, deletion of a record, and undeletion of a record. A change event isn’t a Salesforce object—it doesn’t support CRUD operations or queries. It’s included in the object reference so you can discover which Salesforce objects support change events.") (API version 55.0)
Change events are available for the object.

#### [Category Hierarchy](https://help.salesforce.com/s/articleView?id=mktg.mc_pers_catalog_object_category_etl_hierarchy.htm&type=5)
Categories podem ter Subcategories. Atualmente, a documentação oficial indica suporte padrão de até **5 levels** de Category hierarchy.

Figures                                       ← Level 1
└── Superheroes                     ← Level 2
    └── DC                             ← Level 3
        └── Batman             ← Level 4
            └── Premium   ← Level 5

#### [Entitlement Policy](https://help.salesforce.com/s/articleView?id=commerce.comm_entitlement_policies_intro.htm&type=5)
Agora entramos na parte mais importante do conteúdo de hoje. 
Imagine:

| Nexus Product Catalog<br><br>Batman Figure<br>Superman Figure<br>Iron Man Figure<br>Naruto Figure<br>Premium Collector Figure |
| ----------------------------------------------------------------------------------------------------------------------------- |

Todos existem no Catalog.
Porém:

*todo Buyer deveria enxergar todos?*
**Não necessariamente!**

É aqui que entra: `CommerceEntitlementPolicy`

A definição oficial é particularmente importante:
> Entitlement Policies conectam **Buyer Groups** e **Products** e determinam quais produtos e informações relacionadas podem ser visualizados pelos compradores.

Elas incluem controles como **CanViewProduct** e **CanViewPrice**.

> BuyerAccount -> BuyerGroup -> Entitlement Policy -> Product

#### BuyerGroup × Entitlement Policy
Essa diferença precisa ficar automática.

***BuyerGroup***
Responde:
> **Who is the buyer grouped with?**

***Entitlement Policy***
Responde:
> **What products/product information is this Buyer Group allowed to see?**

#### `CanViewProduct` × `CanViewPrice`
Esse detalhe é bastante relevante.
Uma Entitlement Policy pode controlar aspectos como:

### `CanViewProduct`
O comprador pode visualizar o Product.

### `CanViewPrice`
O comprador pode visualizar o preço.

CanViewProduct = false
→ Buyer cannot see the product.

CanViewProduct = true
CanViewPrice   = false
→ Product may be visible while price visibility is restricted.

Isso permite diferenciar: **product visibility** de **price visibility**

#### Summary
| Requirement                             | Pense primeiro em            |
| --------------------------------------- | ---------------------------- |
| “What is being sold?”                   | `Product2`                   |
| “Collection of products for the Store?” | `ProductCatalog`             |
| “Organize products for navigation?”     | `ProductCategory`            |
| “Group similar buyers?”                 | `BuyerGroup`                 |
| “Which products can these buyers see?”  | `CommerceEntitlementPolicy`  |
| “Can the buyer see the price?”          | Entitlement / `CanViewPrice` |

## 🗓️ Day 3 - 28/09 Data Management
![[certification/sources/mermaid-diagram (5).png]]

No B2B Commerce, um **Price Book** pode ser associado diretamente à Store ou a um **Buyer Group**. Quando associado à Store, compradores com acesso à Store podem receber esses preços; quando associado ao Buyer Group, os preços ficam disponíveis às Accounts pertencentes àquele grupo.

#### [Store Price Book](https://help.salesforce.com/s/articleView?id=commerce.comm_set_up_pricing.htm&type=5)
Quando um Price Book é associado à **Store**, qualquer customer que possa acessar aquela Store é elegível aos preços dele.
Quando o Price Book é associado a um **Buyer Group**, somente Accounts associados àquele Buyer Group são elegíveis aos preços desse Price Book. [Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_assign_pricebooks.htm&language=en_US&type=5&utm_source=chatgpt.com)

![[certification/sources/mermaid-diagram (6).png]]

**Portanto**:

>**Broad/default pricing → Store Price Book**
>**Segmented/negotiated pricing → Buyer Group Price Book**

Criar um Buyer Group para cada buyer seria desnecessário nesse cenário porque todos devem receber o mesmo preço.

#### The store's Pricing Strategy
![[certification/sources/mermaid-diagram (8).png]]
Como um buyer pode pertencer a múltiplos Buyer Groups e um Buyer Group ou Store pode ter múltiplos Price Books, o mesmo buyer pode acabar com **multiple applicable Price Books**. A **Pricing Strategy** determina qual preço deve ser apresentado quando existem múltiplos preços disponíveis.

###### Regra mental
- **Entitlement → ACCESS**  
- **Price Book → PRICE**  
- **Pricing Strategy → WHICH PRICE**

![[certification/sources/mermaid-diagram (9).png]]

|Concept|Mental model|
|---|---|
|**Store Price Book**|Broad/store-level pricing|
|**Buyer Group Price Book**|Segmented/negotiated pricing|
|**Entitlement Policy**|Access/visibility|
|**Pricing Strategy**|Resolve multiple available prices|

##### Mental model consolidado
![[certification/sources/mermaid-diagram (10).png]]

🤺 **Buyer Group Member → Who belongs to the segment**
🤺 **Entitlement Policy → What the buyer can access**
🤺 **Price Book / Price Book Entry → What prices exist**
🤺 **Pricing Strategy → Which applicable price is displayed**

Um Store Price Book oferece pricing de forma ampla aos customers que podem acessar a Store, enquanto um Buyer Group Price Book restringe a elegibilidade dos preços às Accounts associadas ao Buyer Group. [Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_assign_pricebooks.htm&language=en_US&type=5&utm_source=chatgpt.com)
Também vale guardar um detalhe importante para a prova: todo Product precisa estar no **Standard Price Book** antes de poder ser adicionado a custom Price Books de uma Store ou Buyer Group.

#### Pricing Data Model
A documentação oficial de B2B Commerce lista explicitamente no Pricing Data Model os objetos **Buyer Group Price Book**, **Price Book 2**, **Web Store Price Book**, **Price Book Entry**, além de Account, Buyer Group e Buyer Group Member.

![[certification/sources/mermaid-diagram (11).png]]

##### `Pricebook2`
É o **Price Book propriamente dito**.
Pense nele como um container de preços.
Exemplo:

> old Customers Price Book**

Mas o `Pricebook2` sozinho não diz:

> Product X custa $80.

Quem representa essa informação é o `PricebookEntry`.

##### `PricebookEntry`
Esse é um dos objetos mais importantes para memorizar.
O Salesforce define `PricebookEntry` como a associação entre:
**Pricebook2 + Product2**. [Developer](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-dev-data-model.html?utm_source=chatgpt.com)

![[certification/sources/mermaid-diagram (12).png]]

Então:

> **Pricebook2 = collection of prices**  
> **PricebookEntry = price of a specific product inside that Price Book**

Isso também explica por que o mesmo Product pode ter preços diferentes:
![[certification/sources/mermaid-diagram (13).png]]

É o **mesmo `Product2`**, com diferentes `PricebookEntry` records.

##### `BuyerGroupPricebook`
Aqui está uma distinção importante para developer questions.
`BuyerGroupPricebook` é o **relationship object** que conecta:

> **BuyerGroup ↔ Pricebook2**

Não é um novo Price Book.

![[certification/sources/mermaid-diagram (14).png]]

Portanto, quando um cenário fala:

> "Assign a Price Book to a Buyer Group"

No Data Model existe um relacionamento entre esses objetos, representado por **Buyer Group Price Book**. Esse objeto faz parte explicitamente do Pricing Data Model oficial.

##### `WebStorePricebook`
Mesma lógica, mas agora para a Store:
> **WebStore ↔ Pricebook2**

![[certification/sources/mermaid-diagram (15).png]]

A documentação confirma que um Price Book pode ser atribuído à **Store**, ao **Buyer Group**, ou a ambos. Quando atribuído à Store, customers que podem acessar aquela Store são elegíveis aos preços; quando atribuído ao Buyer Group, as Accounts pertencentes àquele grupo são elegíveis. [Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_assign_pricebooks.htm&language=en_US&type=5&utm_source=chatgpt.com)

##### Standard Price Book
Aqui temos outra camada.
O **Standard Price Book** continua sendo um `Pricebook2`.
Mas ele possui um papel especial:

> Um Product precisa possuir uma entrada no **Standard Price Book antes de poder ser adicionado a outros Price Books**.

Salesforce permite apenas **one Standard Price Book**, e todos os Products utilizados nos custom Price Books devem primeiro existir nele. [Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_commerce_pricebooks.htm&language=en_US&type=5&utm_source=chatgpt.com)
Portanto:

![[certification/sources/mermaid-diagram (16).png]]

Uma armadilha comum seria:
> "Gold customers need a negotiated price. Should we create another Product?"

**Não.**

Normalmente:
**same Product2 → different PricebookEntry → different Pricebook2**

#### Pricing Strategy
No B2B Commerce, um buyer pode receber múltiplos Price Books porque pode pertencer a vários Buyer Groups, ou porque múltiplos Price Books podem estar associados à própria Store ou aos grupos. Quando mais de um preço é aplicável ao mesmo Product, a Store usa a **Pricing Strategy** para decidir qual preço apresentar.
Existem duas estratégias principais no standard B2B pricing:

|Strategy|Regra|
|---|---|
|**Best Price**|Usa o **menor preço disponível** entre os Price Books aplicáveis|
|**Priority Price**|Usa o preço do **Price Book com maior prioridade**|

##### 1. Best Price
Com **Best Price**, a Store procura o menor preço disponível entre os Price Books aplicáveis ao buyer. [Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_priority_pricing.htm&language=fi&type=5&utm_source=chatgpt.com)
Exemplo:

![[certification/sources/mermaid-diagram (17).png]]

Portanto:

> **Best Price = lowest applicable price**

Não importa qual Price Book você considere mais importante administrativamente. Se `$80` for o menor preço aplicável, `$80` vence.

##### 2. Priority Price
**Priority Price não significa menor preço.**

O administrador define uma prioridade para os Price Books associados ao Buyer Group. O Price Book com prioridade superior é considerado primeiro. Na configuração da Salesforce, **quanto menor o número, maior a prioridade**. [Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_priority_pricing.htm&language=fi&type=5&utm_source=chatgpt.com)

| Price Book | Price | Priority |
| ---------- | ----: | -------: |
| Platinum   |   $95 |    **1** |
| Gold       |   $80 |        2 |
| Seasonal   |   $70 |        3 |
Com **Priority Price**, o resultado é: **$95**
Mesmo existindo `$80` e `$70`.

![[certification/sources/mermaid-diagram (18).png]]

A documentação oficial dá exatamente esse tipo de comportamento: um Price Book prioritário pode fornecer `$15`, enquanto outro oferece `$14`, e ainda assim `$15` é mostrado porque o primeiro Price Book possui maior prioridade. [Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_priority_pricing.htm&language=fi&type=5&utm_source=chatgpt.com)

###### Regra mental
> **Best Price → compare prices**
> **Priority Price → compare Price Book priorities**

##### 3. Priority Number
Aqui existe uma armadilha clássica:
**Lower number = Higher priority.** [Salesforce](https://help.salesforce.com/s/articleView?id=commerce.comm_priority_pricing.htm&language=fi&type=5&utm_source=chatgpt.com)
Portanto:

##### 4. Comparação direta
Considere:
- Store Price Book → `$120`
- Silver Price Book → `$100`
- Gold Price Book → `$90`

**Best Price**:  min(120, 100, 90) = $90
**Priority Price**: Suponha: Store → Priority 3 | Silver → Priority 1 | Gold → Priority 2 (Silver Price Book = $100)

##### 5. Onde isso entra no fluxo completo?
![[certification/sources/mermaid-diagram (19).png]]

As Commerce Pricing APIs seguem a mesma lógica: o preço é determinado a partir dos Price Books atribuídos à Store e aos Buyer Groups do shopper, selecionando o menor preço ou o preço do Price Book de maior prioridade, de acordo com a estratégia configurada. [Developer](https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-d2c-comm-pricing-promotions-apis.html?utm_source=chatgpt.com)

##### [ ! Exam Traps ]
**Entitlement Policy**
> Can the buyer access the Product/Price?

**Buyer Group Price Book**
> Which Price Books are available to that segment?

**Best Price**
> Which available price is the lowest?

**Priority Price**
> Which available Price Book has the highest configured priority?

## 🗓️ Day 4 - 29/09  Basic LWC: LWC structure, HTML / JS / XML, fundamentals 
**Topic:** LWC Structure, HTML, JavaScript & Metadata  
**Goal:** entender exatamente a responsabilidade de cada arquivo de um Lightning Web Component e reconhecer a configuração correta em cenários de prova.

![[mermaid-diagram (20).png]]

### [Basic LWC](https://developer.salesforce.com/docs/platform/lwc/guide/create-components-define.html?utm_source=chatgpt.com)
#### 1. LWC Component Bundle
Um **UI Lightning Web Component** normalmente começa com estes três arquivos essenciais:
- force-app/main/default/lwc/
	└── productCard/
	    ├── productCard.html
	    ├── productCard.js
	    └── productCard.js-meta.xml
Para um componente que[ renderiza UI](https://developer.salesforce.com/docs/platform/lwc/guide/create-components-folder.html?utm_source=chatgpt.com), Salesforce documenta **HTML + JavaScript + configuration metadata** como parte do bundle básico. CSS, SVG, arquivos JS auxiliares e Jest tests são opcionais.

A associação mental para a prova:

| File           | Responsibility                                |
| -------------- | --------------------------------------------- |
| `.html`        | **UI / presentation**                         |
| `.js`          | **logic / state / event handlers**            |
| `.js-meta.xml` | Salesforce exposure / targets / configuration |
| `.css`         | Styling — optional                            |

#### 2. HTML — Presentation
Exemplo:
<template>
    <lightning-card title="Product">
        <p>{productName}</p>
    </lightning-card>
</template>
<template>
    <lightning-card title="Product">
        <p>{productName}</p>
    </lightning-card>
</template>
```
<template>
    <lightning-card title="Product">
        <p>{productName}</p>
    </lightning-card>
</template>
```

Todo UI component usa `<template>` como root element. O template pode acessar dados definidos pela classe JavaScript usando expressions como `{productName}`
Então:

JavaScript
productName = 'Astro Bot';
        ↓ binding
HTML
{productName}
        ↓
Browser
Astro Bot

Um ponto importante:

> **Evite pensar no HTML como local da business logic.**

O template declara **o que será renderizado**.

#### 3. JavaScript — Component Logic
```
import { LightningElement } from 'lwc';

export default class ProductCard extends LightningElement {
    productName = 'Astro Bot';
}
```

A estrutura fundamental é:

```
import { LightningElement } from 'lwc';

export default class MyComponent extends LightningElement {

}
```

`LightningElement` vem do módulo `lwc`, e a classe do UI component estende `LightningElement`. O arquivo também pode conter fields, public APIs e event handlers. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-components-javascript.html?utm_source=chatgpt.com)

Mental model:
	HTML
	    ↓
	Presentation
	
	JavaScript
	    ↓
	Behavior + State + Logic

#### 4. `.js-meta.xml` — Salesforce Configuration
Agora vem uma diferença muito importante para prova.
Imagine que seu componente existe corretamente:

	productCard.html ✅
	productCard.js   ✅

Mas você precisa disponibilizá-lo no **Lightning App Builder** ou **Experience Builder**.
Exemplo:
```
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

Interpretação:
isExposed = true
        ↓
Component can be exposed for use

targets
        ↓
WHERE the component can be used

### Data Flow, `@api` & Events
Agora saímos da estrutura de arquivos e entramos em **como os components se comunicam**.

#### 1. Parent → Child: `@api`
Quando um parent component precisa enviar informação para um child component, o child expõe uma [**public property**](https://developer.salesforce.com/docs/platform/lwc/guide/reactivity-public.html?utm_source=chatgpt.com) com `@api`. Salesforce define `@api` como parte da public API do component.

***Child***:
```
import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {
    @api productName;
}
```

***Parent:***
```
<c-product-card
    product-name="Astro Bot">
</c-product-card>
```

> [!NOTE] Observe a conversão:
> JavaScript
productName
>
>HTML
>product-name

***Ou seja:*** *camelCase → kebab-case*

![[certification/sources/mermaid-diagram (21).png]]

> [!NOTE] Regra de prova:
> `@api` → expose property or method publicly.
> 
> Ele também pode ser usado em **public methods**, permitindo que um parent chame um método do child.

#### 2. Child → Parent: Events
Agora o caminho inverso.
Um child **não deve simplesmente alterar os dados que pertencem ao parent**.
O padrão recomendado é:

	Parent
	   ↓ data
	Child
	
	Child
	   ↑ event
	Parent

A Salesforce recomenda **one-way data flow**: dados fluem do parent para o child; quando o child precisa comunicar uma mudança, ele dispara um event para o parent. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-components-data-flow.html?utm_source=chatgpt.com)
Exemplo:

***Child JS***
```
handleClick() {
    this.dispatchEvent(
        new CustomEvent('select')
    );
}
```

***Parent HTML***
```
<c-product-card
    onselect={handleProductSelect}>
</c-product-card>
```

***Parent JS***
```
handleProductSelect() {
    // Handle the event
}
```

![[certification/sources/mermaid-diagram (22).png]]

> [!NOTE] Para prova:
>>**Parent → Child = properties / `@api`**
>
>>**Child → Parent = events**

#### 3. Event Handlers
Para eventos padrão
```
<lightning-button
    label="Add to Cart"
    onclick={handleAddToCart}>
</lightning-button>
```

JavaScript:
```
handleAddToCart() {
    console.log('Added');
}
```

O HTML declara **qual evento ouvir**:
```
onclick
```

O JavaScript contém:
```
handleAddToCart()
```

Salesforce recomenda declarative event listeners no template quando possível. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/events-handling?utm_source=chatgpt.com)

#### 4. Reactivity
Exemplo:
```
quantity = 1;

handleIncrease() {
    this.quantity++;
}
```

HTML:
```
<p>Quantity: {quantity}</p>
```

Quando `quantity` muda, o component pode rerenderizar automaticamente porque o field usado pelo template é reactive. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reference-decorators?utm_source=chatgpt.com)

***Pegadinha de material antigo***
Você pode encontrar conteúdos dizendo:
```
@track quantity;
```

para qualquer field reactive.
Isso está desatualizado.
Hoje, fields do LWC já são reactive sem `@track` para mudanças normais de valor. `@track` ainda é relevante principalmente quando é necessário observar certas mudanças internas em **objects ou arrays**. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reference-decorators?utm_source=chatgpt.com)
Portanto:
```
quantity = 1;
```

![[certification/sources/mermaid-diagram (23).png]]

> [!NOTE] Nota Mental
>> **`@api`**
> → Public interface
> → Parent communicates DOWN
>
>> ***Event***
>→ Child communicates UP

### Conditional Rendering & Lists
Agora entramos em dois recursos básicos de template que aparecem bastante em LWC: **mostrar conteúdo condicionalmente** e **renderizar listas**.

#### 1. Conditional Rendering
Para código novo, prefira:
```
<template lwc:if={showProducts}>
    <p>Products available</p>
</template>
```

Também existem:
```
<template lwc:elseif={hasError}>
    <p>Error loading products</p>
</template>

<template lwc:else>
    <p>No products found</p>
</template>
```

[Salesforce](https://developer.salesforce.com/docs/platform/lwc/guide/reference-directives.html?utm_source=chatgpt.com) atualmente recomenda `lwc:if`, `lwc:elseif` e `lwc:else`; os antigos `if:true` e `if:false` não são mais recomendados.
Mental model:

JavaScript boolean
       ↓
lwc:if
       ↓
Render / Don't render

Exemplo:
```
showProducts = true;
```

HTML:
```
<template lwc:if={showProducts}>
    <p>Product catalog</p>
</template>
```

Se:
```
showProducts = false;
```
esse bloco não é renderizado.

#### 2. Render Lists — `for:each`
Imagine que temos:
```
products = [
    { id: '1', name: 'Laptop' },
    { id: '2', name: 'Monitor' },
    { id: '3', name: 'Keyboard' }
];
```

Podemos renderizar todos:
```
<template for:each={products} for:item="product">
    <p key={product.id}>
        {product.name}
    </p>
</template>
```

Aqui temos três partes importantes:
```
for:each={products}
→ array being iterated

for:item="product"
→ variable representing current item

key={product.id}
→ unique identifier
```

Salesforce exige uma `key` única para cada item da lista. O framework usa essa key para identificar quais elementos mudaram e precisam ser renderizados novamente. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-lists.html?utm_source=chatgpt.com)

#### 3. `key` — Important Exam Point
Considere:
```
<template for:each={products} for:item="product">
    <p key={product.id}>
        {product.name}
    </p>
</template>
```

A melhor key normalmente é algo naturalmente único, como:
```
product.id
record.Id
contact.Id
```

Evite pensar assim:
```
key={index}
```

Salesforce especificamente documenta que **o index não pode ser usado como valor de `key`**. A key deve ser uma string ou number única e estável para cada item. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-lists.html?utm_source=chatgpt.com)
Mental note:
```
GOOD
key={product.id}

BAD
key={index}
```

#### 4. Why does `key` matter?
Imagine:
```
Product A
Product B
Product C
```

Então Product B muda.
Com keys únicas:
```
A → unchanged
B → rerender
C → unchanged
```

O framework consegue identificar especificamente o elemento alterado.
Por isso:

> **`key` = identity of the item during rendering**

Não é simplesmente "um campo obrigatório porque Salesforce quer".

#### 5. `iterator`
Existe também:
```
<template iterator:product={products}>
```

O `iterator` é útil especialmente quando você precisa saber informações como:
```
first
last
index
value
```

Por exemplo:
```
<template iterator:item={products}>
    <div key={item.value.id}>
        {item.value.name}
    </div>
</template>
```

O `iterator` disponibiliza propriedades como `value`, `index`, `first` e `last`. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-lists.html?utm_source=chatgpt.com)
Para o nível deste bloco, pense:
```
for:each
→ normal list iteration

iterator
→ iteration + first / last information
```

![[certification/sources/mermaid-diagram (24).png]]


> [!NOTE] Para a prova
>>Need conditional UI?
>→ lwc:if
>
>>Need to display an array?
>→ for:each
>
>>Need unique identity for repeated items?
→ key
>
>>Need first/last information?
→ iterator

## 🗓️ Day 5 - 30/09 Basic LWC: `@api`, public properties, getters/setters

**`@api` and Public Properties**
O `@api` define parte da [**public API** ](https://developer.salesforce.com/docs/platform/lwc/guide/reference-decorators?utm_source=chatgpt.com) de um Lightning Web Component. Quando uma property é marcada com `@api`, outro componente — normalmente o **parent/owner** — pode fornecer um valor para ela.

#### Private field vs Public property
Sem `@api`:
```
import { LightningElement } from 'lwc';

export default class ProductCard extends LightningElement {
    productName = 'Laptop';
}
```
`productName` pertence internamente ao componente.

Com `@api`:
```
import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {
    @api productName;
}
```
Agora `productName` faz parte da API pública do componente e pode receber dados de quem consome o componente. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reactivity-public.html?utm_source=chatgpt.com)

#### Parent → Child
Imagine:
```
productList
    ↓
productCard
```

No ***child***:
```
// productCard.js
import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {
    @api productName;
    @api price;
}
```

No ***parent***:
```
<c-product-card
    product-name={selectedProductName}
    price={selectedPrice}>
</c-product-card>
```
JavaScript usa **camelCase**; o atributo correspondente no HTML usa **kebab-case**. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reactivity-public.html?utm_source=chatgpt.com)
> [!NOTE] Observe a conversão:
> *JavaScript*         /                *HTML*
> productName        →         product-name
> buyerAccountId    →         buyer-account-id
> productId               →         product-id

#### Mental model importante para a prova
Pense em `@api` como uma **entrada pública controlada pelo owner**:
```
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
```
DATA
Parent ───────────────► Child
         @api

EVENT
Parent ◄─────────────── Child
        CustomEvent
```

Se o child precisar solicitar uma mudança em dados pertencentes ao parent, ele deve disparar um evento; o parent atualiza o dado e o novo valor volta para o child. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/create-components-data-flow.html?utm_source=chatgpt.com)

***Exemplo B2B Commerce***
```
// buyerPricingCard.js
import { LightningElement, api } from 'lwc';

export default class BuyerPricingCard extends LightningElement {
    @api buyerAccountId;
    @api productId;
    @api negotiatedPrice;
}
```

O parent poderia fazer:
```
<c-buyer-pricing-card
    buyer-account-id={buyerId}
    product-id={selectedProductId}
    negotiated-price={price}>
</c-buyer-pricing-card>
```

O `buyerPricingCard` recebe essas informações, mas **não deve assumir ownership dos dados recebidos**.

#### `@api` precisa ser importado
Isto está correto:
```
import { LightningElement, api } from 'lwc';

export default class BuyerCard extends LightningElement {
    @api buyerId;
}
```

Isto não:
```
import { LightningElement } from 'lwc';

export default class BuyerCard extends LightningElement {
    @api buyerId;
}
```

O decorator deve ser importado do módulo `lwc`. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reactivity-public.html?utm_source=chatgpt.com)

#### Exam trap
Considere:
```
export default class ProductCard extends LightningElement {
    productName;
    @api productId;
}
```

Temos duas properties, mas somente:
```
productId
```
é **public API**. `productName` continua sendo um field normal do componente.

Isso não significa que `productName` não seja reactive. Em LWC moderno, fields são reactive para os casos comuns sem exigir `@track`; `@api` existe principalmente para definir a **public API**, não simplesmente para tornar um field reactive. [Salesforce Developers](https://developer.salesforce.com/docs/platform/lwc/guide/reference-decorators?utm_source=chatgpt.com)


> [!NOTE] Nota Mental
>> @api       → public property / public method
>
>>@wire      → Salesforce data / reactive provisioning
>
>> @track     → observação de mudanças internas em objetos/arrays em casos específicos

---

#### Getters
Um **getter** permite calcular ou transformar um valor sempre que a propriedade é acessada.
```
import { LightningElement, api } from 'lwc';

export default class ProductCard extends LightningElement {
    @api productName;
    @api price;

    get displayName() {
        return this.productName?.toUpperCase();
    }
}
```

***HTML***:
```
<p>{displayName}</p>
```

Se: `productName = 'Laptop';`
o template exibirá: **LAPTOP**
O ponto importante é que `displayName` **não precisa armazenar um estado separado**.
Ele deriva seu valor de:
```
productName
      ↓
   getter
      ↓
displayName
```

##### Por que usar getter?
Considere:
```
@api price;
@api discount;
```

Você pode calcular:
```
get finalPrice() {
    return this.price - this.discount;
}
```

HTML:
```
<p>{finalPrice}</p>
```

Mental model:
price ────────┐
              ├──► getter finalPrice ───► Template
discount ─────┘

Isso evita manter: `finalPrice`, como outro estado que precisaria ser sincronizado manualmente.

##### Getter com lógica condicional
Exemplo B2B:
```
@api negotiatedPrice;
@api listPrice;

get hasNegotiatedPrice() {
    return this.negotiatedPrice < this.listPrice;
}
```

HTML:
```
<template lwc:if={hasNegotiatedPrice}>
    <p>Special price available</p>
</template>
```

Aqui o getter funciona muito bem porque transforma uma regra de negócio em um valor facilmente consumido pelo template.

##### Exam trap — métodos no template
Em LWC, você normalmente não chama funções com argumentos diretamente dentro de expressões do template.
Evite pensar em algo assim:
```
<p>{calculatePrice(price, discount)}</p>
```

O padrão esperado é colocar essa lógica em JavaScript:
```
get finalPrice() {
    return this.price - this.discount;
}
```

e no template:
```
<p>{finalPrice}</p>
```

##### Getter usando `@api`
Esse padrão aparece bastante:
```
@api buyerName;

get formattedBuyerName() {
    return `Buyer: ${this.buyerName}`;
}
```

O fluxo fica:
```
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


> [!NOTE] Regra de prova
> Um getter é especialmente adequado para um valor:
> 
> **derived/computed from other component state.**

#### Setters
Um **setter** permite executar lógica quando um valor é atribuído a uma property.
Exemplo:
```
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
```
<c-product-card
    product-name={selectedProductName}>
</c-product-card>
```

Quando o valor chega ao child:
```
Parent value
    ↓
setter productName(value)
    ↓
transform / validate
    ↓
_productName
```

##### 1. Backing field
Observe:
```
_productName
```

> Esse campo é chamado de **backing field**.

A ideia é evitar isto:
```
set productName(value) {
    this.productName = value;
}
```

Esse código tentaria atribuir novamente à própria property, chamando o setter outra vez e criando recursão.

O padrão correto é:
```
_productName;

set productName(value) {
    this._productName = value;
}
```

##### 2. Getter + Setter com `@api`
Quando você cria uma public property usando getter/setter, normalmente o `@api` fica no **getter**:
```
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

##### 3. Por que usar setter?
Um setter é útil quando o componente precisa:
- normalize data
- validate incoming data
- transform incoming data
- execute logic when a value changes
Exemplo:
```
_price;

@api
get price() {
    return this._price;
}

set price(value) {
    this._price = Number(value);
}
```

Agora, se o parent fornecer: `"120.50"`
o componente pode armazenar: `120.50` como número.

#####  4. Exemplo B2B Commerce
```
_buyerSegment;

@api
get buyerSegment() {
    return this._buyerSegment;
}

set buyerSegment(value) {
    this._buyerSegment = value?.toUpperCase();
}
```

Se o parent passar:
```
gold
```

internamente o componente trabalha com:
```
GOLD
```

Fluxo:
```
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

##### 5. Getter vs Setter
Pense assim:
```
GETTER
Component State
      ↓
 compute
      ↓
   output
```

```
SETTER
incoming value
      ↓
 transform / validate
      ↓
 internal state
```

###### Getter
```
get finalPrice() {
    return this.price - this.discount;
}
```

Pergunta:
> "What value should I return?"

###### Setter
```
set price(value) {
    this._price = Number(value);
}
```

Pergunta:
> "What should I do when someone assigns a value?"


#### Advanced Scenarios: Public API, Getters & Setters
##### Scenario 1 — Dependent Public Properties
A B2B Commerce storefront uses a reusable `productPricingCard` component.
The parent provides two properties:
```
@api listPrice;
@api negotiatedPrice;
```

O developer precisa calcular qual preço deve ser exibido.
Armadilha: a ordem de atribuição entre diferentes `@api` properties não é garantida. Portanto, um setter não deve depender de outra public property já estar disponível.
O padrão recomendado para valores derivados é:
```
@api listPrice;
@api negotiatedPrice;

get displayPrice() {
    return this.negotiatedPrice ?? this.listPrice;
}
```
O getter calcula o valor com base no estado disponível quando é acessado.

##### Scenario 2 — Read-only Data from Parent
Imagine que o parent passa um Product:
```
<c-product-card product={selectedProduct}>
</c-product-card>
```
O child recebe:

```
@api product;
```
Se `product` for um objeto fornecido pelo parent, o child não deve modificar diretamente suas propriedades.
Se precisar de uma cópia local para manipulação independente, pode utilizar spread syntax para uma shallow copy:

```
const localProduct = { ...this.product };
```
Essa operação copia apenas o primeiro nível do objeto. Objetos aninhados ainda compartilham referências.
![[mermaid-diagram (25).png]]

## 🗓️ Day 6 - 01/10 Basic LWC: Component communication & Custom Events

> [!INFO] Objetivos de aprendizagem
> **Ao concluir o conteúdo de hoje, você deverá conseguir:**
> > Distinguir Parent-to-Child, Child-to-Parent e Sibling Communication
> 
> >Implementar `@api` public properties e public methods.
> 
> >Criar e tratar `CustomEvent`, utilizando `event.detail`.
> 
> >Entender `bubbles`, `composed` e `event.target`.
> 
> >Escolher a estratégia adequada de comunicação em um LWR Storefront.

### 1. Component Communication
O LWC utiliza um modelo de fluxo unidirecional: properties down, events up.

| Direction            | Mechanism                 | Purpose                                          |
| -------------------- | ------------------------- | ------------------------------------------------ |
| Parent → Child       | `@api` property           | Passar dados                                     |
| Parent → Child       | `@api` method             | Invocar comportamento                            |
| Child → Parent       | CustomEvent               | Comunicar ações ou mudanças                      |
| Sibling → Sibling    | Common Parent             | Compartilhar atualizações                        |
| Unrelated Components | Lightning Message Service | Comunicação desacoplada em ambientes compatíveis |

![[mermaid-diagram (26).png]]

> **Regra arquitetural**: ***componentes irmãos não precisam se conhecer diretamente. O componente responsável pelo estado coordena as atualizações.***

### 2. Implementando Custom Events em um B2B Storefront
#### Business Requirement
Uma loja B2B possui dois componentes independentes dentro do mesmo Parent:
- `categoryFilter`: permite selecionar uma categoria.
- `productResults`: exibe os produtos associados à categoria selecionada.
Quando o comprador altera a categoria, os produtos exibidos devem ser atualizados.
##### Step 1 — Child: categoryFilter.js
```
import { LightningElement, api } from 'lwc';

export default class CategoryFilter extends LightningElement {
	    @api selectedCategoryId = 'all';

    categoryOptions = [
        { label: 'All Products', value: 'all' },
        { label: 'Hardware', value: 'hardware' },
        { label: 'Software', value: 'software' }
    ];

    handleChange(event) {
        const categoryId = event.detail.value;

        this.dispatchEvent(
            new CustomEvent('categorychange', {
                detail: { categoryId }
            })
        );
    }
}
```

##### Step 2 — Child: categoryFilter.html
```
<template>
    <lightning-combobox
        label="Product Category"
        value={selectedCategoryId}
        options={categoryOptions}
        onchange={handleChange}>
    </lightning-combobox>
</template>
```


> [!NOTE] Pontos importantes:
>> `new CustomEvent()` cria o evento; `this.dispatchEvent()` o dispara; `detail` transporta os dados.
> 
>>O nome `categorychange` não recebe o prefixo `on` na declaração. O prefixo aparece no listener HTML: `oncategorychange`

##### Step 3 — Parent Component
> `storefrontContainer.html`
```
<template>
    <c-category-filter
        selected-category-id={selectedCategoryId}
        oncategorychange={handleCategoryChange}>
    </c-category-filter>

    <c-product-results
        selected-category-id={selectedCategoryId}>
    </c-product-results>
</template>
```

> `storefrontContainer.js`
```
import { LightningElement } from 'lwc';

export default class StorefrontContainer
    extends LightningElement {

    selectedCategoryId = 'all';

    handleCategoryChange(event) {
        this.selectedCategoryId =
            event.detail.categoryId;
    }
}
```

##### Step 4 — Receiving Child
> `productResults.js`
```
import { LightningElement, api } from 'lwc';

export default class ProductResults extends LightningElement {
    @api selectedCategoryId = 'all';

    products = [
        { id: 'P1', name: 'Laptop', categoryId: 'hardware' },
        { id: 'P2', name: 'CRM License', categoryId: 'software' },
        { id: 'P3', name: 'Keyboard', categoryId: 'hardware' }
    ];

    get filteredProducts() {
        if (this.selectedCategoryId === 'all') {
            return this.products;
        }

        return this.products.filter(
            product =>
                product.categoryId === this.selectedCategoryId
        );
    }
}
```

> `productResults.html`
```
<template>
    <template for:each={filteredProducts}
              for:item="product">
        <p key={product.id}>
            {product.name}
        </p>
    </template>
</template>
```

O Parent mantém o estado e o segundo Child recebe a atualização por meio de uma public property. O getter recalcula a lista filtrada quando a propriedade reativa utilizada no template muda.
Na loja real, este exemplo não substituiria as verificações de acesso, Entitlement Policies ou os Commerce APIs responsáveis por fornecer os produtos permitidos para o comprador.

### 3. Parent-to-Child — Public Methods
Além de propriedades, o Parent pode chamar métodos do Child usando `@api`.
Exemplo: limpar os filtros de um componente.

##### Child — categoryFilter.js (trecho)
```
@api
resetFilters() {
    this.dispatchEvent(
        new CustomEvent('categorychange', {
            detail: { categoryId: 'all' }
        })
    );
}
```

##### Parent — storefrontContainer.js (trecho)
```
handleReset() {
    const child = this.template.querySelector(
        'c-category-filter'
    );

    child?.resetFilters();
}
```

O Parent invoca um método público no Child, que solicita a atualização do estado por meio de um evento. Assim, a propriedade controlada pelo Parent continua sendo a fonte de verdade. [Salesforce](https://developer.salesforce.com/docs/platform/lwc/guide/create-javascript-methods.html)

### 4. Event Propagation & Shadow DOM
Por padrão, um `CustomEvent` possui estas configurações:

```
new CustomEvent('productselected', {
    detail: { productId: 'P1' },
    bubbles: false,
    composed: false
});
```

|Property|Default|Responsibility|
|---|---|---|
|`bubbles`|`false`|Permitir que o evento suba pela árvore DOM|
|`composed`|`false`|Permitir que o evento atravesse uma Shadow DOM boundary|

Quando usamos `this.dispatchEvent()` no Child, o evento é disparado no host do componente. O Parent pode recebê-lo com um listener diretamente nesse host, mesmo sem bubbling.
Por outro lado, um evento disparado em um elemento interno do template pode exigir configuração adicional para alcançar listeners fora desse template. A Salesforce recomenda utilizar a configuração de propagação mais restritiva possível. [Salesforce](https://developer.salesforce.com/docs/platform/lwc/guide/events-propagation.html)

##### Event Retargeting
Ao atravessar uma Shadow DOM boundary, `event.target` pode ser alterado para preservar o encapsulamento.

Por isso:
- `event.target`: elemento identificado como origem do evento no contexto do listener.
- `event.currentTarget`: elemento em que o listener está registrado.
- `event.detail`: payload explícito transportado pelo `CustomEvent`.

Para dados de negócio, como `productId`, prefira o uso de `event.detail` com valores primitivos ou cópias independentes de objetos. [Salesforce](https://developer.salesforce.com/docs/platform/lwc/guide/events-best-practices)

### 5. Lightning Message Service — Quando utilizar?
Quando componentes não compartilham uma relação direta de Parent/Child, considere Lightning Message Service (LMS).
Em ambientes compatíveis, como Lightning Experience e componentes Lightning em LWR Experience Builder Sites, LMS permite comunicação através de **[Lightning Message Channels](https://developer.salesforce.com/docs/platform/lwc/guide/use-message-channel)**
O mecanismo é diferente de `CustomEvent`: em vez de percorrer a hierarquia de componentes, uma mensagem é publicada em um canal e recebida por seus subscribers.

### 6. Knowledge Check — Exam Decision Rules
| Business Requirement                   | Expected Solution                                    |
| -------------------------------------- | ---------------------------------------------------- |
| Parent sends a buyerId to Child        | `@api` property                                      |
| Parent invokes a Child operation       | `@api` public method                                 |
| Child reports a product selection      | `CustomEvent`                                        |
| Child sends productId                  | `event.detail`                                       |
| Two siblings share a selection         | Common Parent                                        |
| Unrelated components exchange messages | Lightning Message Service, when supported            |
| Event should remain locally scoped     | `bubbles: false`, `composed: false`, when sufficient |
### 7. Practical Lab — B2B Product Carousel
Construiremos três Lightning Web Components:
![[mermaid-diagram (27).png]]

|Component|Responsibility|
|---|---|
|`productCarousel`|Gerenciar produtos, posição atual e seleção|
|`productCarouselCard`|Exibir informações de um produto e emitir `productselect`|
|`carouselControls`|Navegar entre produtos emitindo `previous` e `next`|

#### Step 1 — Estrutura dos componentes
force-app/main/default/lwc/
│
├── productCarousel/
│   ├── productCarousel.html
│   ├── productCarousel.js
│   ├── productCarousel.css
│   └── productCarousel.js-meta.xml
│
├── productCarouselCard/
│   ├── productCarouselCard.html
│   ├── productCarouselCard.js
│   ├── productCarouselCard.css
│   └── productCarouselCard.js-meta.xml
│
└── carouselControls/
    ├── carouselControls.html
    ├── carouselControls.js
    └── carouselControls.js-meta.xml

## 🗓️ Day 7 - 02/10 Basic LWC: Wire Adapters vs Imperative Operations
### Core Architecture Decisions

> When should an LWC retrieve data reactively using `@wire`, and when should it execute an imperative operation?

| Feature             | `@wire`                          | Imperative                                                 |
| ------------------- | -------------------------------- | ---------------------------------------------------------- |
| Execution           | Framework-managed, reactive      | Explicitly invoked                                         |
| Typical purpose     | Read data and respond to changes | User-triggered actions, reads or mutations                 |
| Return model        | Stream of provisioned values     | Promise for asynchronous APIs                              |
| Reactive parameters | `$propertyName`                  | Pass parameters when invoking                              |
| Apex requirement    | `@AuraEnabled(cacheable=true)`   | `@AuraEnabled`; <br>caching optional for read-only methods |
| DML through Apex    | Not allowed                      | Supported                                                  |
| Commerce example    | `CartSummaryAdapter`             | `addItemToCart()`                                          |

Apex calls and Commerce Storefront APIs have their own caching and refresh behavior. `@wire` does not guarantee that every backend change will trigger a new fetch.

#### The Salesforce decision model
![[mermaid-diagram.png]]

Prefer standard Salesforce APIs over custom Apex when they satisfy the requirement. In Commerce, Storefront APIs also handle buyer context and integrate with Storefront State Management.

#### Practical examples — Nexus Figures
*Example A — Reactive reading of cart totals:* The adapter provides current cart summary data, and Commerce State Management coordinates updates to subscribed components.
```
import { LightningElement, wire } from 'lwc';
import { CartSummaryAdapter } from 'commerce/cartApi';

export default class CartSummaryViewer extends LightningElement {
    @wire(CartSummaryAdapter)
    cartSummary;
}
```

*Example B — Buyer adds a product*: Here, `addItemToCart()` is an imperative Commerce API triggered by user interaction. Both APIs are officially supported in B2B Commerce.
```
import { LightningElement, api } from 'lwc';
import { addItemToCart } from 'commerce/cartApi';

export default class ProductCartButton extends LightningElement {
    @api productId;

    async handleAddToCart() {
        try {
            await addItemToCart(this.productId, 1);
        } catch (error) {
            console.error('Add to cart failed', error);
        }
    }
}
```


> [!NOTE] Important exam traps
>> `@wire` isn't exclusively for Apex; Salesforce provides UI API and Commerce Wire Adapters.
>
>>`@wire` with Apex requires `cacheable=true`, which prohibits data mutations.
>
>>An imperative Apex method can also be `cacheable=true` when it is read-only.
>
>>Use `refreshApex()` for Apex-wired data, not for the result of an imperative Apex invocation.
>
>>When imperative Apex changes records used by LDS, `notifyRecordUpdateAvailable()` can refresh affected LDS-managed record data.

