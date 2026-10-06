import { LightningElement, api } from 'lwc';

interface Products {
  id: string;
  name: string;
  imageUrl: string;
  sku: string;
}

export default class B2bProductCard extends LightningElement {
  @api product?: Products;
  @api enableLogging?: boolean;

  connectedCallback(): void {
    this.log('Product card initialized for product: ' + this.product?.name);
  }

  get productName(): string {
    return this.product?.name || '';
  }

  get productImageUrl(): string {
    this.log('Fetching image URL for product: ' + this.product?.imageUrl);
    return this.product?.imageUrl || '';
  }

  get productSku(): string {
    this.log('Fetching SKU for product: ' + this.product?.sku);
    return this.product?.sku || '';
  }

  get productId(): string {
    return this.product?.id || '';
  }

  log(message: string): void {
    if (this.enableLogging) {
      console.log('[b2bProductCard] ' + message);
    }
  }
}
