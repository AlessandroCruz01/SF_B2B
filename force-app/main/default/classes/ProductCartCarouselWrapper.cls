public virtual class ProductCartCarouselWrapper {
     public virtual class ProductWrapper {
        @AuraEnabled public String id {get;set;}
        @AuraEnabled public String name {get;set;}
        @AuraEnabled public String imageUrl {get;set;}
        @AuraEnabled public String sku {get;set;}
    }
}