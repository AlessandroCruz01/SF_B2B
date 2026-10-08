public virtual inherited sharing class B2BCartReservationService {

    private B2BInventoryProvider inventoryProvider;
    private OmnichannelInventoryEngine omnichannelInventoryEngine;

    public B2BCartReservationService() {
        this.inventoryProvider = new B2BInventoryProvider();
        this.omnichannelInventoryEngine = new OmnichannelInventoryEngine();
    }

    @TestVisible
    private void setInventoryProvider(B2BInventoryProvider inventoryProviderMock) {
        this.inventoryProvider = inventoryProviderMock;
    }

    @TestVisible
    private void setOmnichannelInventoryEngine(OmnichannelInventoryEngine omnichannelInventoryEngineMock) {
        this.omnichannelInventoryEngine = omnichannelInventoryEngineMock;
    }

    public virtual void releaseCartItemsReservation(Map<String, String> accountIdByCartId, List<CartItem> cartItems) {
        if (accountIdByCartId == null || accountIdByCartId.isEmpty() || cartItems == null || cartItems.isEmpty()) {
            return;
        }

        Map<String, String> locationExternalReference = inventoryProvider.getLocationExternalReference(accountIdByCartId.values());

        if (locationExternalReference == null || locationExternalReference.isEmpty()) {
            return;
        }

        Map<String, Map<String, Decimal>> quantityMapByLocation = buildQuantityMapByLocation(
            accountIdByCartId,
            cartItems,
            locationExternalReference
        );

        if (quantityMapByLocation.isEmpty()) {
            return;
        }

        if (System.isBatch() || System.isFuture()) {
            releaseReservation(quantityMapByLocation);
            return;
        }

        releaseReservationFuture(JSON.serialize(quantityMapByLocation));
    }

    @future(callout=true)
    public static void releaseReservationFuture(String quantityMapJson) {
        if (String.isBlank(quantityMapJson)) {
            return;
        }

        Map<String, Map<String, Decimal>> quantityMapByLocation =
            (Map<String, Map<String, Decimal>>) JSON.deserialize(
                quantityMapJson,
                Map<String, Map<String, Decimal>>.class
            );

        if (quantityMapByLocation == null || quantityMapByLocation.isEmpty()) {
            return;
        }

        new B2BCartReservationService().releaseReservation(quantityMapByLocation);
    }

    private virtual void releaseReservation(Map<String, Map<String, Decimal>> quantityMapByLocation) {
        List<ConnectApi.OCIReleaseReservationSingleInputRepresentation> releaseRecords =
            new List<ConnectApi.OCIReleaseReservationSingleInputRepresentation>();

        for (String locationIdentifier : quantityMapByLocation.keySet()) {
            Map<String, Decimal> quantityBySku = quantityMapByLocation.get(locationIdentifier);

            if (quantityBySku == null || quantityBySku.isEmpty()) {
                continue;
            }

            for (String productSku : quantityBySku.keySet()) {
                Decimal quantityToRelease = quantityBySku.get(productSku);

                if (String.isBlank(productSku) || quantityToRelease == null || quantityToRelease <= 0) {
                    continue;
                }

                ConnectApi.OCIReleaseReservationSingleInputRepresentation releaseRecord =
                    new ConnectApi.OCIReleaseReservationSingleInputRepresentation();

                releaseRecord.actionRequestId = System.UUID.randomUUID().toString();
                releaseRecord.locationIdentifier = locationIdentifier;
                releaseRecord.stockKeepingUnit = productSku;
                releaseRecord.quantity = quantityToRelease;

                releaseRecords.add(releaseRecord);
            }
        }

        if (releaseRecords.isEmpty()) {
            return;
        }

        ConnectApi.OCIReleaseReservationInputRepresentation releaseRequest =
            new ConnectApi.OCIReleaseReservationInputRepresentation();
        releaseRequest.releaseRecords = releaseRecords;

        omnichannelInventoryEngine.releaseReservations(
            new List<ConnectApi.OCIReleaseReservationInputRepresentation>{ releaseRequest }
        );
    }

    private virtual Map<String, Map<String, Decimal>> buildQuantityMapByLocation(
        Map<String, String> accountIdByCartId,
        List<CartItem> cartItems,
        Map<String, String> locationExternalReference
    ) {
        Map<String, Map<String, Decimal>> quantityMapByLocation = new Map<String, Map<String, Decimal>>();

        for (CartItem cartItem : cartItems) {
            Decimal reservedQuantity = (Decimal) cartItem.get('ReservedQuantity__c');

            if (String.isBlank(cartItem.Sku) || reservedQuantity == null || reservedQuantity <= 0) {
                continue;
            }

            String accountId = accountIdByCartId.get(cartItem.CartId);
            String locationIdentifier = locationExternalReference.get(accountId);

            if (String.isBlank(locationIdentifier)) {
                continue;
            }

            if (!quantityMapByLocation.containsKey(locationIdentifier)) {
                quantityMapByLocation.put(locationIdentifier, new Map<String, Decimal>());
            }

            Map<String, Decimal> quantityBySku = quantityMapByLocation.get(locationIdentifier);

            if (quantityBySku.containsKey(cartItem.Sku)) {
                quantityBySku.put(cartItem.Sku, quantityBySku.get(cartItem.Sku) + reservedQuantity);
            } else {
                quantityBySku.put(cartItem.Sku, reservedQuantity);
            }
        }

        return quantityMapByLocation;
    }
}