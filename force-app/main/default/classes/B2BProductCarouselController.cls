public with sharing class B2BProductCarouselController {
    private static B2BProductCarouselService service;
    static {
        service = new B2BProductCarouselService();
    }

    @AuraEnabled
    public static string getProductsByCategory(
        String categoryId, String effectiveAccountId
    ){
        try {
            return service.getProductsByCategory(
                categoryId, effectiveAccountId
            );
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}