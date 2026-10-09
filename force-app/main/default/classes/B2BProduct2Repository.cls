public virtual with sharing class B2BProduct2Repository {
    public virtual ConnectApi.ProductSearchResults findProductsByCategory(
        String webstoreId, 
        String effectiveAccountId, 
        String categoryId
    ){
        //? Instanciar a entrada de busca do Commerce
        ConnectApi.ProductSearchInput searchInput = new ConnectApi.ProductSearchInput();

        //? Se você quiser filtrar por uma categoria padrão do carrossel:
        if(String.isNotBlank(categoryId)) {
            searchInput.categoryId = categoryId;
        } else {
            searchInput.searchTerm = ''; //* Busca geral default
        }

        searchInput.pageSize = 10; //* Limite de itens pro carrossel
        searchInput.fields = new List<String>{ 'ProductCode', 'ImageURL__c' }; //* Campos extras no ProductSummary.fields

        //? Executar a busca respeitando estritamente o contexto do Buyer
        ConnectApi.ProductSearchResults searchResults = ConnectApi.CommerceSearch.searchProducts(
            webstoreId, 
            effectiveAccountId, 
            searchInput
        );

         return searchResults;
    }

    public virtual List<Product2> getGenericProductsForFooterCarousel(){
        List<Product2> products = [
            SELECT Id, Name, ProductCode, ImageURL__c
            FROM Product2
            WHERE IsActive = true
                AND ImageURL__c != null
            LIMIT 10
        ];
        return products;
    }
}