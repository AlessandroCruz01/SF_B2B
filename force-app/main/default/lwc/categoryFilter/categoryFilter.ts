// Child: categoryFilter.js
import { LightningElement, api } from 'lwc';

type categoryFilterProps = {
  label: string;
  value: string;
};

export default class CategoryFilter extends LightningElement {
  @api selectedCategoryId = 'all';

  categoryOptions: categoryFilterProps[] = [
    { label: 'All Products', value: 'all' },
    { label: 'Hardware', value: 'hardware' },
    { label: 'Software', value: 'software' },
  ];

  handleEvent(event: CustomEvent) {
    const target = event.detail.value;

    this.dispatchEvent(
      new CustomEvent('categorychange', {
        detail: { selectedCategoryId: target },
      })
    );
  }
}
