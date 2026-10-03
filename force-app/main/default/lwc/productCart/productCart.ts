import { LightningElement, api, wire } from 'lwc';
//https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-display-lwc-apis.html
import { getProduct } from 'commerce/productApi';

export default class ProductCart extends LightningElement {
  @api recordId: string = '';
  @api enableLogging: boolean = false;

  _productData: any = null;

  @wire(getProduct, { productId: '$recordId' })
  wiredProduct({ error, data }: { error: Object | undefined; data: Object | undefined }) {
    if (data) {
      this._productData = data;
    } else if (error) {
      this.log('Error fetching product data: ' + JSON.stringify(error));
    }
  }

  log(message: string): void {
    if (this.enableLogging) {
      console.log('[ProductCart] ' + message);
    }
  }
}
