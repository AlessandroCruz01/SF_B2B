@isTest
private class B2BOCIReservationHelperTest {

    @isTest
    static void createReservationTest() {
        Map<String,Map<String,Decimal>> quantityMapByLocation = new Map<String,Map<String,Decimal>>();
        Map<String,Decimal> skuQuantityMap1 = new Map<String,Decimal>{'SKU123' => 2.0};
        quantityMapByLocation.put('Location1', skuQuantityMap1);

        Test.startTest();

        ConnectApi.OCICreateReservationOutputRepresentation responseMock = new ConnectApi.OCICreateReservationOutputRepresentation();
        responseMock.success = true;
        responseMock.errors = new List<ConnectApi.OCICreateReservationErrorOutputRepresentation>();

        ConnectApi.OCICreateReservationSingleOutputRepresentation detail = new ConnectApi.OCICreateReservationSingleOutputRepresentation();
        detail.locationIdentifier = 'Location1';
        detail.stockKeepingUnit = 'SKU123';
        detail.quantity = 2.0;

        responseMock.details = new List<ConnectApi.OCICreateReservationSingleOutputRepresentation>{detail};

        B2BOCIReservationHelper.createReservationResponseForTest = responseMock;

        Map<String,String> response = B2BOCIReservationHelper.createReservation(quantityMapByLocation);

        System.Assert.isTrue(response != null, 'Should return a response');
        System.Assert.isTrue(response.size() > 0, 'Should return a response');

        Test.stopTest();
    }

    @isTest
    static void createReservationWithErrorTest() {
        Map<String,Map<String,Decimal>> quantityMapByLocation = new Map<String,Map<String,Decimal>>();
        Map<String,Decimal> skuQuantityMap1 = new Map<String,Decimal>{'SKU123' => 2.0};
        quantityMapByLocation.put('Location1', skuQuantityMap1);

        Test.startTest();

        ConnectApi.OCICreateReservationOutputRepresentation responseMock = new ConnectApi.OCICreateReservationOutputRepresentation();
        responseMock.success = false;
        responseMock.details = new List<ConnectApi.OCICreateReservationSingleOutputRepresentation>();
        
        ConnectApi.OCICreateReservationErrorOutputRepresentation error = new ConnectApi.OCICreateReservationErrorOutputRepresentation();
        error.errorCode = 'ERROR';
        error.message = 'Test';

        responseMock.errors = new List<ConnectApi.OCICreateReservationErrorOutputRepresentation>{error};

        B2BOCIReservationHelper.createReservationResponseForTest = responseMock;

        Map<String,String> response = B2BOCIReservationHelper.createReservation(quantityMapByLocation);

        System.Assert.isTrue(response != null, 'Should return a response');
        System.Assert.isTrue(response.get('success') == 'false', 'Should return a response with error');

        Test.stopTest();
    }

    @isTest
    static void releaseReservationTest() {
        Map<String,Map<String, Decimal>> quantityMapByLocation = new Map<String,Map<String,Decimal>>();
        Map<String,Decimal> skuQuantityMap1 = new Map<String,Decimal>{'SKU123' => 2.0};
        quantityMapByLocation.put('Location1', skuQuantityMap1);

        Test.startTest();

        ConnectApi.OCIReleaseReservationOutputRepresentation responseMock = new ConnectApi.OCIReleaseReservationOutputRepresentation();
        responseMock.success = true;
        responseMock.errors = new List<ConnectApi.OCIReleaseReservationErrorOutputRepresentation>();

        B2BOCIReservationHelper.releaseReservationResponseForTest = responseMock;

        Map<String,String> response = B2BOCIReservationHelper.releaseReservation(quantityMapByLocation);

        System.Assert.isTrue(response != null, 'Should return a response');
        System.Assert.isTrue(response.size() > 0, 'Should return a response');

        Test.stopTest();
    }

    @isTest
    static void releaseReservationWithErrorTest() {
        Map<String,Map<String, Decimal>> quantityMapByLocation = new Map<String,Map<String,Decimal>>();
        Map<String,Decimal> skuQuantityMap1 = new Map<String,Decimal>{'SKU123' => 2.0};
        quantityMapByLocation.put('Location1', skuQuantityMap1);

        Test.startTest();

        ConnectApi.OCIReleaseReservationOutputRepresentation responseMock = new ConnectApi.OCIReleaseReservationOutputRepresentation();
        responseMock.success = false;

        ConnectApi.OCIReleaseReservationErrorOutputRepresentation error = new ConnectApi.OCIReleaseReservationErrorOutputRepresentation();
        error.errorCode = 'ERROR';
        error.message = 'Test';

        ConnectApi.OCIReleaseReservationSingleOutputRepresentation singleOutput = new ConnectApi.OCIReleaseReservationSingleOutputRepresentation();
        singleOutput.stockKeepingUnit = 'SKU123';
        singleOutput.locationIdentifier = 'Location1';

        error.details = singleOutput;

        responseMock.errors = new List<ConnectApi.OCIReleaseReservationErrorOutputRepresentation>{error};

        B2BOCIReservationHelper.releaseReservationResponseForTest = responseMock;

        Map<String,String> response = B2BOCIReservationHelper.releaseReservation(quantityMapByLocation);

        System.Assert.isTrue(response != null, 'Should return a response');
        System.Assert.isTrue(response.size() > 0, 'Should return a response');

        Test.stopTest();
    }

    @isTest 
    static void releaseCartItemsReservationTest() {

        Account account = B2BAccountFactory.newAccountWithId('Test Account');
        account.Channel__c = 'Lojas Próprias';
        account.BillingPostalCode = '45920003';

        Map<String,String> externalRefByAccountId = new Map<String,String>();
        externalRefByAccountId.put(account.Id, 'TEST-001');


        B2BInventoryProviderMock inventoryProviderMock = new B2BInventoryProviderMock(
            JSON.serialize(
                externalRefByAccountId
            )
        );

        WebStore newWebStore = B2BWebStoreFactory.newWebStore('WebStore1');
        newWebStore.Id = IdGenerator.generateByObjectType(
            WebStore.SObjectType
        );

        List<String> productSkus = new List<String>{
            'SKU123',
            'SKU456'
        };

        List<Product2> products = new List<Product2>();

        for(String productSku : productSkus){
            Product2 product = B2BProduct2Factory.newProduct2WithId('Product for ' + productSku, productSku);
            products.add(product);
        }

        Map<WebCart, List<CartItem>> cartItemsByCart = B2BWebCartFactory.createCartWithItems(account.Id, 'Active', newWebStore.Id, products);
        List<WebCart> cart = new List<WebCart>(cartItemsByCart.keySet());

        Map<String, String> accountIdByCartId = new Map<String, String>();
        accountIdByCartId.put(cart[0].Id, account.Id);

        List<CartItem> cartItems = cartItemsByCart.get(cart[0]);

        ConnectApi.OCIReleaseReservationOutputRepresentation responseMock = new ConnectApi.OCIReleaseReservationOutputRepresentation();
        responseMock.success = false;

        ConnectApi.OCIReleaseReservationErrorOutputRepresentation error = new ConnectApi.OCIReleaseReservationErrorOutputRepresentation();
        error.errorCode = 'ERROR';
        error.message = 'Test';

        ConnectApi.OCIReleaseReservationSingleOutputRepresentation singleOutput = new ConnectApi.OCIReleaseReservationSingleOutputRepresentation();
        singleOutput.stockKeepingUnit = 'SKU123';
        singleOutput.locationIdentifier = 'TEST-001';

        error.details = singleOutput;

        responseMock.errors = new List<ConnectApi.OCIReleaseReservationErrorOutputRepresentation>{error};

        B2BOCIReservationHelper.releaseReservationResponseForTest = responseMock;

        Test.startTest();
        
        B2BOCIReservationHelper.locationExternalReferenceForTest = new Map<String,String>{
            account.Id => 'TEST-001'
        };
        B2BOCIReservationHelper.releaseCartItemsReservation(accountIdByCartId, cartItems);

        Test.stopTest();
    }
}