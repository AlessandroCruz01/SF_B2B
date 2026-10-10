import { LightningElement, api } from 'lwc';

export default class ChildComponent extends LightningElement {
  _message?: string;
  messageToChild: string = 'Message from Child Component!';

  @api
  get message(): string | undefined {
    return this._message;
  }

  set message(value: string | undefined) {
    this._message = value;
  }

  _child2Message?: string;

  // Recebe do parent e repassa para o child2 (parent -> child -> child2)
  @api
  get child2Message(): string | undefined {
    return this._child2Message;
  }

  set child2Message(value: string | undefined) {
    this._child2Message = value;
  }

  handleClick() {
    this.dispatchEvent(
      new CustomEvent('childclick', {
        detail: {
          message: 'Button clicked in child 1 component',
        },
        bubbles: true,
        composed: true,
      })
    );
  }

  @api
  changeMessageToChild(message: string) {
    this.messageToChild = message;
  }
}
