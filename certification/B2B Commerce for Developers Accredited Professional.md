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

