//* Data Access Strategy - (Priority 2) Commerce Storefront APIs
//? Commerce Storefront APIs São módulos JavaScript do runtime de Commerce que você importa direto no LWC de um store LWR (import ... from 'commerce/cartApi'). 
//? Eles são responsáveis por buscar dados do servidor, e não da página. O componente que importa o módulo é quem faz a busca, e não a página.
//? Por baixo, eles chamam as Connect REST APIs de Commerce, que já sabem qual é o webstore, a effective account e os entitlements do comprador. Eles também usam o State Management do store: quando um componente muda o carrinho, os outros componentes que leem o carrinho se atualizam sozinhos.

import { LightningElement, wire, api } from 'lwc';
import { ProductSearchAdapter } from 'commerce/productApi'

export default class Das_CommerceStorefrontAPIs extends LightningElement {
    //https://developer.salesforce.com/docs/platform/connect-rest-api/references/connect-rest-api-commerce#tag/Commerce-B2B-Resources/operation/postProductSearch

    @api searchTerm?: string;

    get searchQuery(): any {
        return {
            webstoreId: '0ZEbm0000047o2bGAA',
            searchTerm: this.searchTerm,
            pageSize: 10
        }
    }

    @wire(ProductSearchAdapter, { 'searchQuery': '$searchQuery' })
    productSearchResult?: any;


    get hasProductSearchResult(): boolean {
        console.log('productSearchResult', JSON.stringify(this.productSearchResult));
        return typeof this.productSearchResult === 'object' && this.productSearchResult !== null;
    }
}
