import { LightningElement, api } from 'lwc';
import { effectiveAccount } from 'commerce/effectiveAccountApi';
import getProductsByCategory from '@salesforce/apex/ProductCartCarouselController.getProductsByCategory';

interface Product {
  id: string;
  name: string;
  imageUrl: string;
  sku: string;
}
export default class ProductCartCarousel extends LightningElement {
  @api categoryId?: string;
  @api effectiveAccountId?: string = effectiveAccount?.accountId;
  @api enableLogging: boolean = false;

  _products?: Product[];
  error?: string;

  connectedCallback() {
    this.loadProducts();
  }

  //? Chamada imperativa: métodos Apex não-cacheable não podem ser usados com @wire
  async loadProducts(): Promise<void> {
    try {
      const data: string = await getProductsByCategory({
        categoryId: this.categoryId,
        effectiveAccountId: this.effectiveAccountId,
      });
      this._products = JSON.parse(data) as Product[];
      this.error = undefined;
      this.log('Products fetched successfully: ' + JSON.stringify(this._products));
    } catch (e) {
      const error = e as { body?: { message?: string } };
      this._products = undefined;
      this.error = error.body?.message ?? 'Erro ao carregar produtos';
    }
  }

  log(message: string): void {
    if (this.enableLogging) {
      console.log('[ProductCart] ' + message);
    }
  }
}
