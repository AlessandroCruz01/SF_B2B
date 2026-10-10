import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import MESSAGE_CHANNEL from '@salesforce/messageChannel/Message__c';
export default class LmsSubscriberComponent extends LightningElement {
  @wire(MessageContext)
  messageContext: any;
  subscription: any;

  _message: string = 'Ainda nao recebi nenhuma mensagem do Publisher Component';

  subscribeToMessageChannel() {
    this.subscription = subscribe(this.messageContext, MESSAGE_CHANNEL, (message: any) => {
      console.log('Received message from Publisher Component:', message);
      this.handleMessage(message.message);
    });
  }

  get message() {
    return this._message;
  }

  set message(value: string) {
    this._message = value;
  }

  connectedCallback() {
    this.subscribeToMessageChannel();
  }

  handleMessage(message: string) {
    this._message = message;
  }
}
