import { LightningElement, api } from 'lwc';

export default class ProductResults extends LightningElement {
  @api selectedCategoryId = 'all';

  products = [
    { id: 'P1', name: 'Laptop', categoryId: 'hardware' },
    { id: 'P2', name: 'CRM License', categoryId: 'software' },
    { id: 'P3', name: 'Keyboard', categoryId: 'hardware' },
  ];

  get filteredProducts() {
    if (this.selectedCategoryId === 'all') {
      return this.products;
    }

    return this.products.filter((product) => product.categoryId === this.selectedCategoryId);
  }
}
