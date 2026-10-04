import { LightningElement, api } from 'lwc';

interface Products {
  id: string;
  name: string;
  imageUrl: string;
  sku: string;
}

export default class B2bProductCard extends LightningElement {
  @api product?: Products;

  get productName(): string {
    return this.product?.name || '';
  }

  get productImageUrl(): string {
    return this.product?.imageUrl || '';
  }

  get productSku(): string {
    return this.product?.sku || '';
  }

  get productId(): string {
    return this.product?.id || '';
  }
}
