import { LightningElement, api } from 'lwc';

type productType = {
    id: string;
    name: string;
    imageUrl: string;
    sku: string;
}

export default class ProductCardsItem extends LightningElement {

    _product?: productType;

    @api
    get product(): productType | undefined {
        return this._product;
    }
    
    set product(value: productType) {
        this._product = value;
    }
}