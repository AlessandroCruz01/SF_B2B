public virtual class B2BProductCarouselService {
    private B2BProduct2Utils productUtils;
    private B2BProduct2Repository productRepository;
    private List<ProductCartCarouselWrapper.ProductWrapper> response;

    public B2BProductCarouselService() {
        this.productUtils = new B2BProduct2Utils();
        this.productRepository = new B2BProduct2Repository();
        this.response = new List<ProductCartCarouselWrapper.ProductWrapper>();
    }

    public virtual String getProductsByCategory(
        String categoryId, 
        String effectiveAccountId
    ){
        string webstoreId = this.productUtils.getWebstoreId();

        if(String.isBlank(effectiveAccountId)) {
            effectiveAccountId = this.productUtils.resolveUserAccountId();
        }

        ConnectApi.ProductSearchResults searchResults = this.productRepository.findProductsByCategory(webstoreId, effectiveAccountId, categoryId);

        if( 
            searchResults != null && 
            searchResults.productsPage != null &&
            searchResults.productsPage.products != null
        ){

            for( ConnectApi.ProductSummary summary : searchResults.productsPage.products){
                ProductCartCarouselWrapper.ProductWrapper dto = new ProductCartCarouselWrapper.ProductWrapper();
                dto.id = summary.id;
                dto.name = summary.name;
                dto.imageUrl = this.productUtils.getFieldValue(summary, 'ImageURL__c');
                dto.sku = this.productUtils.getFieldValue(summary, 'ProductCode');
                this.response.add(dto);
            }
        }
        
        return JSON.serialize(this.response);
    }
}