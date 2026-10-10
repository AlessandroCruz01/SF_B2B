import { LightningElement, api } from 'lwc';

export default class Child2Component extends LightningElement {
  _message: string = 'Ainda nao recebi nenhuma mensagem do Parent Component';

  @api
  get message(): string {
    return this._message;
  }
  set message(value: string) {
    this._message = value;
  }

  handleClick() {
    // child2 está dentro do shadow DOM do childComponent, então precisa de
    // bubbles + composed para atravessar essa fronteira e chegar ao parent
    this.dispatchEvent(
      new CustomEvent('child2click', {
        detail: {
          message: 'Button clicked in child 2 component',
        },
        bubbles: true,
        composed: true,
      })
    );
  }
}
