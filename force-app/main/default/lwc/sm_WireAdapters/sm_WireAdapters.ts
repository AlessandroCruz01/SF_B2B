//* ( Advanced LWC ) Storefront APIs & State Management - Wire Adapters *//
//? Wire Adapters - (Reactive data retrieval) - Manter componentes sincronizados com alterações.
//? Um Wire Adapter serve para o seu componente assinar (ficar inscrito em) um dado do Commerce e receber automaticamente toda nova versão desse dado.
//! Wire = "mantenha-me atualizado" → leitura reativa do estado compartilhado

import { LightningElement, wire } from 'lwc';
import { ProductSearchAdapter } from 'commerce/productApi';

const SEARCH_TERM = ['Mangá', 'Novels']
const DEFAULT_PRODUCT_SEARCH_QUERY = {
    includeQuantityRule: true,
    page: 0,
    fields: ['StockKeepingUnit', 'Name'],
    pageSize: 1,
    grouping: 'NoGrouping',
    webstoreId: '0ZEbm0000047o2bGAA',
    searchTerm: SEARCH_TERM[0],
};
export default class Sm_WireAdapters extends LightningElement {
    _searchQuery = DEFAULT_PRODUCT_SEARCH_QUERY;
    
    connectedCallback(): void {
        setTimeout(() => {
            console.log('Changing search term to:', SEARCH_TERM[1]);
            this._searchQuery = {
                ...DEFAULT_PRODUCT_SEARCH_QUERY,
                searchTerm: SEARCH_TERM[1],
            };
        }, 10000);
    }

    @wire(ProductSearchAdapter, { searchQuery: '$_searchQuery' })
    updateSearchResults({ data, error }: { data: any; error: any }) { 
        if(data){
            console.log('ProductSearchAdapter data:', data);
        }
        if(error){
            console.error('ProductSearchAdapter error:', error);
        }
    }
}


