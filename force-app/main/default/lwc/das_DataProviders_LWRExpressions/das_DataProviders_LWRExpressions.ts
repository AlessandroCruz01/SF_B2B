//* Data Access Strategy - (Priority 1) Data Providers + LWR Expressions
import { LightningElement, api } from 'lwc';

//? LWR Expressions são marcações no formato {!...} que você coloca nas propriedades de um componente, dentro do Experience Builder
//? Na hora de renderizar a página, a plataforma troca a expressão pelo dado real que vem de um Data Provider daquela página.
//? O componente não sai buscando o dado. A página entrega o dado pronto para ele.
export default class Das_DataProviders_LWRExpressions extends LightningElement {
  @api productName?: string;

  get hasProductName(): boolean {
    return typeof this.productName === 'string' && this.productName.length > 0;
  }

  get productName(): string | undefined {
    return this.productName;
  }
}
