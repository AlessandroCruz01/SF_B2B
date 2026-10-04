import { LightningElement, api, wire } from 'lwc';
//https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-display-lwc-apis.html
import { ProductAdapter } from 'commerce/productApi';

export default class ProductCart extends LightningElement {
  @api recordId: string = '';
  @api enableLogging: boolean = false;

  _productData: any = null;

  @wire(ProductAdapter, { productId: '$recordId' })
  wiredProduct({ error, data }: { error: Object | undefined; data: Object | undefined }) {
    if (data) {
      this._productData = data;
    } else if (error) {
      this.log('Error fetching product data: ' + JSON.stringify(error));
    }
  }

  get productImageUrl(): string {
    return this._productData?.imageUrl || '';
  }

  log(message: string): void {
    if (this.enableLogging) {
      console.log('[ProductCart] ' + message);
    }
  }
}
