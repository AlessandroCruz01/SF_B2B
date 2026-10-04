public with sharing class ProductCartCarouselService {
    List<ProductCartCarouselWrapper> productCarouselWrapper;
    ProductCartCarouselRepository productCarouselRepository;

    public ProductCartCarouselService() {
        this.productCarousel = new List<ProductCartCarouselWrapper>();
        this.productCarouselRepository = new ProductCartCarouselRepository();
    }

    public static string findProducts(
        String webstoreId, 
        String effectiveAccountId, 
        String searchInput
    ){
        try {
            ConnectApi.ProductSearchInput searchInput = new ConnectApi.ProductSearchInput();
            ConnectApi.ProductSearchResults searchResults = this.productCarouselRepository.findActiveByCategoryId(
                webstoreId, 
                effectiveAccountId, 
                searchInput
            );

            //? 3. Parsear os resultados elegíveis
            if (searchResults != null && searchResults.productsPage != null) {
                for (ConnectApi.ProductSummary prod : searchResults.productsPage.products) {
                    ProductCartCarouselWrapper.ProductWrapper dto = new ProductCartCarouselWrapper.ProductWrapper();
                    dto.id = prod.Id;
                    dto.name = prod.Name;
                    dto.sku = prod.ProductCode ;
                    dto.imageUrl = prod.ImageURL__c;
                    this.productCarousel.add(dto);
                }
            }

            return this.productCarousel;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


}