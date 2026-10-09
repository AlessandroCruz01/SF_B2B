public virtual class B2BProduct2Utils {

    public virtual String getWebstoreId() {
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

    public virtual String getFieldValue(ConnectApi.ProductSummary summary, String fieldName) {
        if(summary.fields == null || !summary.fields.containsKey(fieldName)) {
            return null;
        }
        ConnectApi.FieldValue field = summary.fields.get(fieldName);
        return field == null ? null : field.value;
    }

    //* Fallback: conta do usuário buyer logado
    public virtual String resolveUserAccountId() {
        List<User> users = [SELECT Contact.AccountId FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
        return users.isEmpty() ? null : users[0].Contact?.AccountId;
    }

    public virtual List<ProductCartCarouselWrapper.ProductWrapper> productsWrapperResponse(List<Product2> products) {
        List<ProductCartCarouselWrapper.ProductWrapper> response = new List<ProductCartCarouselWrapper.ProductWrapper>();
        for(Product2 product : products) {
            ProductCartCarouselWrapper.ProductWrapper dto = new ProductCartCarouselWrapper.ProductWrapper();
            dto.id = product.Id;
            dto.name = product.Name;
            dto.imageUrl = product.ImageURL__c;
            dto.sku = product.ProductCode;
            response.add(dto);
        }
        return response;
    }

}