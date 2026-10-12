import { api, LightningElement, wire } from 'lwc';
//https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-display-lwc-apis.html
import { CartSummaryAdapter } from 'commerce/cartApi';

export default class WireAdapter extends LightningElement {
  _productId?: string;
  cartTotal?: string;

  //? @wire: O @wire é um decorator do LWC que liga uma propriedade (ou função) do componente a uma fonte de dados reativa, chamada de wire adapter. Você não chama nada manualmente: o framework faz a chamada, guarda em cache e atualiza o componente quando os dados mudam.

  //* Wire com propriedade
  @wire(
    CartSummaryAdapter,
    { productId: '$productId' }
    //* Adapter (CartSummaryAdapter): um objeto que sabe buscar dados e avisar quando há dados novos. Quem o fornece é a plataforma (commerce/cartApi, lightning/uiRecordApi, Apex etc.).
    //! Com '$productId', se o productId mudar, o wire busca o novo produto.
    //! Com 'productId' (sem $), o adapter recebe a string literal "productId", o que é um bug comum.
    //! O wire só roda quando todos os parâmetros reativos estão definidos (diferentes de undefined).
  )
  cartSummary: Object | undefined; //! Destino (cartSummary): onde o LWC entrega o resultado.
  //* A propriedade sempre recebe um objeto com este formato: { data: <resultado> | undefined, error: <erro> | undefined }

  @api
  get productId(): string | undefined {
    return this._productId;
  }

  set productId(value: string) {
    this._productId = value;
  }

  //* Wire com Function
  @wire(CartSummaryAdapter)
  handleCart({ data, error }: { data?: any; error?: any }) {
    //! Em vez de uma propriedade, você pode ligar o wire a um método e transformar o resultado
    if (data) {
      this.cartTotal = data.grandTotalAmount;
    } else if (error) {
      console.error(error);
    }
  }
}
