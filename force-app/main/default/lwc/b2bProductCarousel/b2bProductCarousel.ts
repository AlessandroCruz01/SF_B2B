// Parent Component
import { LightningElement, api } from 'lwc';
import { effectiveAccount } from 'commerce/effectiveAccountApi';
import getProductsByCategory from '@salesforce/apex/B2BProductCarouselController.getProductsByCategory';

interface Products {
  id: string;
  name: string;
  imageUrl: string;
  sku: string;
}
export default class B2bProductCarousel extends LightningElement {
  @api categoryId?: string;
  @api effectiveAccountId?: string;
  @api enableLogging?: boolean;

  _products?: Products[];
  error?: string;

  connectedCallback(): void {
    this.loadProducts();
  }

  async loadProducts() {
    try {
      this.effectiveAccountId = effectiveAccount?.accountId;
      //? O Apex retorna JSON.serialize(...): precisa de parse para virar array
      const data: string = await getProductsByCategory({
        categoryId: this.categoryId,
        effectiveAccountId: this.effectiveAccountId,
      });
      this._products = JSON.parse(data) as Products[];
      this.log('Products loaded successfully' + (this._products ? ` (${this._products.length} products)` : ''));
    } catch (error) {
      this.error = 'Error occurred while loading products';
      this.log('Error occurred while loading products');
    }
  }

  get products() {
    return this._products;
  }

  log(message: string): void {
    if (this.enableLogging) {
      console.log('[b2bProductCarousel] ' + message);
    }
  }
}
