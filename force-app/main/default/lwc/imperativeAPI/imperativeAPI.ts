import { LightningElement, api } from 'lwc';
import { addItemToCart } from 'commerce/cartApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ImperativeAPI extends LightningElement {
  @api productId?: string;

  async handleAddToCart() {
    try {
      await addItemToCart(this.productId, 1); //? roda agora, só uma vez
    } catch (error) {''
      // Handle the operation error
    }
  }
}
