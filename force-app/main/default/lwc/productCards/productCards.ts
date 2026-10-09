import { LightningElement, api } from 'lwc';
import getProductsToFooterCarousel from '@salesforce/apex/B2BProductCarouselController.getProductsToFooterCarousel';

type productType = {
    id: string;
    name: string;
    imageUrl: string;
    sku: string;
}

export default class ProductCards extends LightningElement {
    _products?: productType[];
    @api enableLogging: boolean = false;

    connectedCallback(): void {
        this.doGetProductsToFooterCarousel();
    }
    
    async doGetProductsToFooterCarousel() {
        const response: productType[] = await getProductsToFooterCarousel();
        this.log('Products loaded successfully' + (response ? ` (${response.length} products)` : ''));
        this.products = response;
        
    }

    get products(): productType[] | undefined {
        return this._products;
    }

    set products(products: productType[]) {
        this._products = products;
    }

    log(message: string): void {
        if (this.enableLogging) {
        console.log('[productCards] ' + message);
        }
    }
}
