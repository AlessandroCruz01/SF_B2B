
| Object                            | Limit B2B Except Where Indicated | Store or Org | Notes                                                                                                                                                                                                                             |
| --------------------------------- | -------------------------------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Price Books                       | 300,000<sup>*</sup>              | Org          | Not enforced for Agentforce Sales                                                                                                                                                                                                 |
| Price Book Entries                | 50 million<sup>*</sup>           | Org          | Not enforced for Agentforce Sales                                                                                                                                                                                                 |
| Buyer Group Price books           | 100,000<sup>*</sup> B2B Only     | Org          | Total number of buyer group price books. There is a limit to the number of price books you can assign to a buyer group.                                                                                                           |
| Price Book Assigned to a Store    | 5 per Store. B2B Only            | Store        | Applies to the store. You can assign up to 25 price books to a buyer group and assign the buyer group to a store.                                                                                                                 |
| Price Book Entries per Price Book | B2B: 350,000<sup>*</sup>         | N/A          | Because this is a price book limit, you can assign it at the store, buyer group, or org level.                                                                                                                                    |
| Price Books per Buyer Group       | B2B: 50<sup>*</sup>              |              | The number of price books that you can associate with a buyer group.                                                                                                                                                              |
| Buyer Groups per Price Book       | 100<sup>*</sup>                  | N/A          | The number of buyer groups that you can associate with a price book.                                                                                                                                                              |
| Price Books per Pricing Call      | 25                               | N/A          | The number of valid price books the system evaluates for a single pricing call. Price books above the 25 limit are not included in the price evaluation. A valid price book is an active price that matches the buyer's currency. |


**Best Practice**

Salesforce recommends you manage pricing data within the scope of the established limits. To optimize a pricing strategy that works within the pricing limits, plan and adapt your pricing strategy within the limits.

Familiarize yourself with the Salesforce B2B limits on pricing objects. To organize and structure your pricing data, and to ensure that you make the most of the available limits, utilize pricing data relationships and dependencies to design an efficient pricing model that makes the most of the available limits.

Regularly audit and clean up pricing data. For example, over time a complex pricing strategy implementation can result in duplicate and irrelevant pricing. With regularly scheduled pricing audits, you can identify and remove duplicates and irrelevant information. Pricing audits help you keep your stores and org within the pricing data limits.

Avoid exceeding limits to irrelevant levels. For example, always keep the number of price books per call at or below 25 price books. Price books above the limit are not included in price call evaluations and result in unused data resources.

Consider customization carefully. Only add customizations when they add significant value. Salesforce recommends you manage pricing data within the scope of the established limits. If you have requirements that exceed the limits, consider the impact on performance and data storage limits.

- Does the additional data push the related data objects beyond their limits?
- Can you offset a data increase by decreasing data requirements in other store functions?

After you assess the impact of a data increase, if you still want to request an increase, contact Support.
