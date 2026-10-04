public with sharing class ProductCartCarouselController {
    //! Sem cacheable: CommerceSearch.searchProducts faz DML interno (log de busca)
    @AuraEnabled
    public static string getProductsByCategory( String categoryId, String effectiveAccountId ){
        try {

            String webstoreId = resolveWebstoreId();
            if(String.isBlank(effectiveAccountId)) {
                effectiveAccountId = resolveUserAccountId();
            }

            ProductCartCarouselRepository repository = new ProductCartCarouselRepository();
            ConnectApi.ProductSearchResults searchResults = repository.findActiveByCategoryId(webstoreId, effectiveAccountId, categoryId);

            List<ProductCartCarouselWrapper.ProductWrapper> products = new List<ProductCartCarouselWrapper.ProductWrapper>();

            if(searchResults != null && searchResults.productsPage != null && searchResults.productsPage.products != null) {
                for(ConnectApi.ProductSummary summary : searchResults.productsPage.products) {
                    ProductCartCarouselWrapper.ProductWrapper dto = new ProductCartCarouselWrapper.ProductWrapper();
                    dto.id = summary.id;
                    dto.name = summary.name;
                    dto.imageUrl = getFieldValue(summary, 'ImageURL__c');
                    if(String.isBlank(dto.imageUrl) && summary.defaultImage != null) {
                        dto.imageUrl = summary.defaultImage.url; //* Fallback: imagem padrão do produto
                    }
                    dto.sku = getFieldValue(summary, 'ProductCode');
                    products.add(dto);
                }
            }

            return JSON.serialize(products);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    //? O mapa fields só traz campos indexados na busca; qualquer chave pode faltar
    private static String getFieldValue(ConnectApi.ProductSummary summary, String fieldName) {
        if(summary.fields == null || !summary.fields.containsKey(fieldName)) {
            return null;
        }
        ConnectApi.FieldValue field = summary.fields.get(fieldName);
        return field == null ? null : field.value;
    }

    //? Não existe ConnectApi.CommerceContext: o webstore é resolvido pela Network (site) atual
    private static String resolveWebstoreId() {
        String networkId = Network.getNetworkId();
        if(networkId == null) {
            throw new AuraHandledException('Não foi possível identificar o site (Network) atual.');
        }
        List<WebStoreNetwork> storeNetworks = [
            SELECT WebStoreId
            FROM WebStoreNetwork
            WHERE NetworkId = :networkId
            LIMIT 1
        ];
        if(storeNetworks.isEmpty()) {
            throw new AuraHandledException('Nenhuma WebStore associada a este site.');
        }
        return storeNetworks[0].WebStoreId;
    }

    //* Fallback: conta do usuário buyer logado
    private static String resolveUserAccountId() {
        List<User> users = [SELECT Contact.AccountId FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
        return users.isEmpty() ? null : users[0].Contact?.AccountId;
    }
}
