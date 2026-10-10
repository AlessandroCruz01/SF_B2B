import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import MESSAGE_CHANNEL from '@salesforce/messageChannel/Message__c';

export default class LmsPublisherComponent extends LightningElement {
  message = 'Hello from LWC Publisher Component!';

  @wire(MessageContext)
  messageContext: any;

  handleClick(event: Event) {
    const messagePayload = {
      message: this.message,
    };
    publish(this.messageContext, MESSAGE_CHANNEL, messagePayload);
  }
}
