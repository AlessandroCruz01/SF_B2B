import { LightningElement, api } from 'lwc';

export default class B2bProductCarouselControls extends LightningElement {
  @api enableLogging: boolean = false;
  @api _direction: string = 'right';

  get icon(): string {
    if (this._direction === 'left') {
      return 'utility:chevronleft';
    } else if (this._direction === 'right') {
      return 'utility:chevronright';
    }
    return 'utility:chevronright';
  }
}
