@isTest
private class B2BCartReservationServiceTest {

    @isTest
    static void itShouldQueueFutureReleaseWhenDataIsValidTest() {
        Id accountId = IdGenerator.generateByObjectType(Account.SObjectType);
        Id cartId = IdGenerator.generateByObjectType(WebCart.SObjectType);

        Map<String, String> accountIdByCartId = new Map<String, String>{
            String.valueOf(cartId) => String.valueOf(accountId)
        };

        List<CartItem> cartItems = new List<CartItem>{
            buildCartItem(cartId, 'SKU-TEST-001', 2)
        };

        B2BCartReservationService service = new B2BCartReservationService();
        B2BInventoryProviderMockForCartReservation providerMock =
            new B2BInventoryProviderMockForCartReservation(
                new Map<String, String>{ String.valueOf(accountId) => 'LOCATION-001' }
            );

        service.setInventoryProvider(providerMock);

        Test.startTest();
        Integer futureCallsBefore = Limits.getFutureCalls();
        service.releaseCartItemsReservation(accountIdByCartId, cartItems);
        Integer futureCallsAfter = Limits.getFutureCalls();
        Test.stopTest();

        Assert.isTrue(providerMock.getLocationCalled, 'Location lookup should be executed.');
        Assert.areEqual(futureCallsBefore + 1, futureCallsAfter, 'A future release call should be queued.');
    }

    @isTest
    static void itShouldNotQueueFutureWhenLocationExternalReferenceIsEmptyTest() {
        Id accountId = IdGenerator.generateByObjectType(Account.SObjectType);
        Id cartId = IdGenerator.generateByObjectType(WebCart.SObjectType);

        Map<String, String> accountIdByCartId = new Map<String, String>{
            String.valueOf(cartId) => String.valueOf(accountId)
        };

        List<CartItem> cartItems = new List<CartItem>{
            buildCartItem(cartId, 'SKU-TEST-001', 2)
        };

        B2BCartReservationService service = new B2BCartReservationService();
        B2BInventoryProviderMockForCartReservation providerMock =
            new B2BInventoryProviderMockForCartReservation(new Map<String, String>());

        service.setInventoryProvider(providerMock);

        Test.startTest();
        Integer futureCallsBefore = Limits.getFutureCalls();
        service.releaseCartItemsReservation(accountIdByCartId, cartItems);
        Integer futureCallsAfter = Limits.getFutureCalls();
        Test.stopTest();

        Assert.isTrue(providerMock.getLocationCalled, 'Location lookup should be executed.');
        Assert.areEqual(futureCallsBefore, futureCallsAfter, 'Future release call should not be queued.');
    }

    @isTest
    static void itShouldExecuteFutureReleaseMethodWithoutErrorsTest() {
        Map<String, Map<String, Decimal>> quantityMapByLocation =
            new Map<String, Map<String, Decimal>>{
                'LOCATION-001' => new Map<String, Decimal>{
                    'SKU-TEST-001' => 3
                }
            };

        String payload = JSON.serialize(quantityMapByLocation);

        Test.startTest();
        B2BCartReservationService.releaseReservationFuture(payload);
        Test.stopTest();

        Assert.isTrue(true, 'Future release should execute without exceptions.');
    }

    @isTest
    static void itShouldReturnWhenInputIsNullOrEmptyTest() {
        B2BCartReservationService service = new B2BCartReservationService();
        B2BInventoryProviderMockForCartReservation providerMock =
            new B2BInventoryProviderMockForCartReservation(
                new Map<String, String>{ '001000000000001AAA' => 'LOCATION-001' }
            );

        service.setInventoryProvider(providerMock);

        service.releaseCartItemsReservation(null, null);
        service.releaseCartItemsReservation(new Map<String, String>(), new List<CartItem>());

        Assert.isFalse(providerMock.getLocationCalled, 'Location lookup should not run for null/empty input.');
    }

    @isTest
    static void itShouldNotQueueFutureWhenAllCartItemsAreInvalidTest() {
        Id accountId = IdGenerator.generateByObjectType(Account.SObjectType);
        Id cartId = IdGenerator.generateByObjectType(WebCart.SObjectType);

        Map<String, String> accountIdByCartId = new Map<String, String>{
            String.valueOf(cartId) => String.valueOf(accountId)
        };

        List<CartItem> cartItems = new List<CartItem>{
            buildCartItem(cartId, null, 2),
            buildCartItem(cartId, 'SKU-TEST-001', 0)
        };

        B2BCartReservationService service = new B2BCartReservationService();
        B2BInventoryProviderMockForCartReservation providerMock =
            new B2BInventoryProviderMockForCartReservation(
                new Map<String, String>{ String.valueOf(accountId) => 'LOCATION-001' }
            );

        service.setInventoryProvider(providerMock);

        Test.startTest();
        Integer futureCallsBefore = Limits.getFutureCalls();
        service.releaseCartItemsReservation(accountIdByCartId, cartItems);
        Integer futureCallsAfter = Limits.getFutureCalls();
        Test.stopTest();

        Assert.isTrue(providerMock.getLocationCalled, 'Location lookup should run when input is valid.');
        Assert.areEqual(futureCallsBefore, futureCallsAfter, 'No future call should be queued when all items are invalid.');
    }

    @isTest
    static void itShouldReturnFromFutureWhenPayloadIsBlankTest() {
        Test.startTest();
        B2BCartReservationService.releaseReservationFuture('');
        Test.stopTest();

        Assert.isTrue(true, 'Blank payload should be ignored without exceptions.');
    }

    private static CartItem buildCartItem(Id cartId, String sku, Decimal reservedQuantity) {
        CartItem item = new CartItem();
        item.CartId = cartId;
        item.Sku = sku;
        item.put('ReservedQuantity__c', reservedQuantity);
        return item;
    }

    private class B2BInventoryProviderMockForCartReservation extends B2BInventoryProvider {
        private Map<String, String> locationByAccountId;
        public Boolean getLocationCalled = false;

        B2BInventoryProviderMockForCartReservation(Map<String, String> locationByAccountId) {
            this.locationByAccountId = locationByAccountId;
        }

        public override Map<String, String> getLocationExternalReference(List<String> accountIds) {
            this.getLocationCalled = true;
            return this.locationByAccountId;
        }
    }
}