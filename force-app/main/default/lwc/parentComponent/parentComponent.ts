import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
  _messageChild?: string;
  parentMessage: string = 'Hello Child from Parent Component!';
  child2Message: string = 'Hello Child 2 from Parent Component!';
  messageChild2?: string;

  set messageChild(value: string | undefined) {
    this._messageChild = value;
  }

  get messageChild(): string | undefined {
    return this._messageChild;
  }

  childButtonClickHandler(event: CustomEvent<{ message: string }>) {
    this.messageChild = event.detail.message;
    this.callMethodInChild();
  }

  child2ButtonClickHandler(event: CustomEvent<{ message: string }>) {
    // event.target aqui é o <c-child-component>, não o child2 (retargeting)
    this.messageChild2 = event.detail.message;
    // evento composed continua subindo acima do parent; já foi tratado aqui
    event.stopPropagation();
  }

  callMethodInChild() {
    const childComponent = this.template?.querySelector('c-child-component') as
      | (Element & { changeMessageToChild(message: string): void })
      | null
      | undefined;
    if (childComponent) {
      childComponent.changeMessageToChild('Updated message from Parent Component!');
    }
  }
}
