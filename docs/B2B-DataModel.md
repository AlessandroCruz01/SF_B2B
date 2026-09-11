# B2B Commerce Data Model

The Commerce store template is built on a pre-configured data model. The data model supports standard and customizable business objects for a multitude of business relationships and interoperability with B2B stores, Salesforce Order Management, and Agentforce Service.

| Required Editions                                                       |
| ----------------------------------------------------------------------- |
| Available in: **Enterprise**, **Unlimited**, and **Developer** Editions |
| Available in: B2B Commerce                                              |

The Commerce data model connects the store objects. Default object relationships support a full-featured B2B store experience.

![Diagram of B2C data  model.](https://a.sfdcstatic.com/developer-website/sfdocs/commerce-cloud/media/d2c-commerce/commerce_data_model.png)

Among the object relationships in the Commerce app data model are those that you use to quickly:

- Add product catalogs to provision your stores.
- Configure product variants (product size, shape, color, and so on), categories, bundles, and more.
- Select customer search capabilities and how your store displays results.
- Differentiate buyer groups and associate them with specific products and volume-discounted prices.
- Configure tax, shipping, and payment for cart checkout.
- Create promotional campaigns for targeted products.

Here’s a list of some of the default data model objects.

| Data Model Object  | Description                                                                                                                                                                                                                             | API Name                                                                                                                                                                                           |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Store              | A website where buyers and shoppers complete wholesale and retail transactions. Includes the fields and properties that define your store. For example, supported currencies, languages, and price books. Many fields are customizable. | [WebStore](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_webstore.htm?q=webstore)                                                    |
| Cart               | Represents an online shopping cart in a store built with B2B Commerce on Lightning, with total amounts for products, shipping and handling, and taxes.                                                                                  | [WebCart](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_webcart.htm)                                                                 |
| Catalog            | A catalog is a collection of the products that you sell, organized into different categories. The Commerce Admin or Merchandiser uses data import to set up the catalog.                                                                | [ProductCatalog](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_productcatalog.htm?q=ProductCatalog)                                  |
| Category           | Categories and subcategories organize and group products in your catalog and on your storefront. Layout is customizable.                                                                                                                | [ProductCategory](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_productcategory.htm?q=ProductCategory)                               |
| Entitlement Policy | Entitlement policies are simple entities that bring together buyer groups and products. Filtered by BuyerGroup membership. Includes CanViewPrice and CanViewProduct fields, which are customizable.                                     | [CommerceEntitlementPolicy](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_commerceentitlementpolicy.htm?q=CommerceEntitlementPolicy) |
| Product            | The items and services you sell. The Commerce Admin or Merchandiser uses data import to fill in a default compact layout, which includes a variety of customizable fields (name, family, and so on).                                    | [Product2](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_product2.htm?q=Product2)                                                    |
| Buyer Account      | The buyer’s or shopper’s financial information, including credit and order limits, some of which pertain only to B2B.                                                                                                                   | [BuyerAccount](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_buyeraccount.htm?q=BuyerAccount)                                        |
| Buyer Group        | A group of buyers with the same assigned entitlement policies, price books, and products. Buyer Group name and description are customizable.                                                                                            | [BuyerGroup](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_buyergroup.htm?q=BuyerGroup)                                              |
| Buyer Group Member | An individual buyer associated with a buyer group.                                                                                                                                                                                      | [BuyerGroupMember](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_buyergroupmember.htm?q=BuyerGroup)                                  |
| Price Book         | A price book contains price definitions for a group of products. Typically added during setup with your store’s data import, but you can add custom fields.                                                                             | [PriceBook2](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_pricebook2.htm?q=PriceBook2)                                              |
| Price Book Entry   | A product entry (an association between a Pricebook2 and Product2) in a price book.                                                                                                                                                     | [PricebookEntry](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_pricebookentry.htm?q=PricebookEntry)                                  |
