import { LightningElement, api, wire } from 'lwc';
import { ProductSearchAdapter } from 'commerce/productApi';

interface CategorySearchQueryProps {
  categoryId: string;
  page: number;
  pageSize: number;
  includePrices: boolean;
}

export default class ProductCartCarousel extends LightningElement {
  @api categoryId: string = '';
  @api enableLogging: boolean = false;
  _productData: any = null;

  get searchQueryCategory(): CategorySearchQueryProps | undefined {
    if (!this.categoryId) {
      return undefined;
    }
    return {
      categoryId: this.categoryId,
      page: 0,
      pageSize: 10,
      includePrices: true,
    };
  }

  @wire(ProductSearchAdapter, { categoryId: '$searchQueryCategory' })
  wiredProducts({ data, error }: { data: any; error: any }) {
    if (data) {
      this.log('Fetched product data: ' + JSON.stringify(data));
      this._productData = data;
    } else if (error) {
      this.log('Error fetching product data: ' + JSON.stringify(error));
    }
  }

  log(message: string): void {
    if (this.enableLogging) {
      console.log('[productCartCarousel] ' + message);
    }
  }
}
