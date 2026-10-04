// Parent: StorefrontContainer
import { LightningElement } from 'lwc';

export default class StorefrontContainer extends LightningElement {
  selectedCategoryId = 'all';

  handleCategoryChange(event: CustomEvent<{ categoryId: string }>) {
    this.selectedCategoryId = event.detail.categoryId;
  }
}
