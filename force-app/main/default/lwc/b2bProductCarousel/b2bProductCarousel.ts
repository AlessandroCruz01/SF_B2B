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
  @api enableLogging: boolean = false;

  _products?: Products[];
  error?: string;

  async loadProducts() {
    try {
      this.effectiveAccountId = effectiveAccount?.accountId;
      const data = await getProductsByCategory({
        categoryId: this.categoryId,
        effectiveAccountId: this.effectiveAccountId,
      });
      this._products = data;
      this.log('Products loaded successfully');
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
