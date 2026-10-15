//* Data Access Strategy - (Priority 1) Data Providers + LWR Expressions
import { LightningElement, api } from 'lwc';

//? LWR Expressions são marcações no formato {!...} que você coloca nas propriedades de um componente, dentro do Experience Builder
//? Na hora de renderizar a página, a plataforma troca a expressão pelo dado real que vem de um Data Provider daquela página.
//? O componente não sai buscando o dado. A página entrega o dado pronto para ele.
//? O Data Provider é uma fonte de dados que pertence à página de um site LWR, configurada no Experience Builder. Cada tipo de página do store tem o seu: a página de Produto tem o Product, a de Carrinho tem o Cart, e Busca e Categoria têm os delas.
export default class Das_DataProviders_LWRExpressions extends LightningElement {
  @api productName?: string;

  get hasProductName(): boolean {
    return typeof this.productName === 'string' && this.productName.length > 0;
  }
}

/*
 Página de Produto (LWR)
 └─ Data Provider "Product" ──busca──▶ servidor (uma vez, com cache)
        │
        │  {!Product.Details.fields.Name}   ← configurado no Builder
        ▼
 seu componente:  @api productName = "Furadeira X"
*/
