public class B2BOCIReservationHelper {

    @TestVisible
    private static ConnectApi.OCICreateReservationOutputRepresentation createReservationResponseForTest;

    @TestVisible
    private static Map<String,String> locationExternalReferenceForTest;

    @TestVisible
    private static ConnectApi.OCIReleaseReservationOutputRepresentation releaseReservationResponseForTest;

    public static Map<String,String> createReservation(Map<String,Map<String,Decimal>> quantityMapByLocation) {
   
        ConnectApi.OCICreateReservationInputRepresentation  reservation = new ConnectApi.OCICreateReservationInputRepresentation();
        reservation.actionRequestId = System.UUID.randomUUID().toString();
        reservation.externalRefId = reservation.actionRequestId.replace('-', '');

        System.debug('Reservation Action Request ID: ' + reservation.actionRequestId);
        System.debug('Reservation External ID: ' + reservation.externalRefId);

        List<ConnectApi.OCICreateReservationSingleInputRepresentation> createRecords = new List<ConnectApi.OCICreateReservationSingleInputRepresentation>();
        for(String locationIdentifier : quantityMapByLocation.keySet()){
            Map<String,Decimal> quantityToReserveByProductSKU = quantityMapByLocation.get(locationIdentifier);
            for(String productSKU : quantityToReserveByProductSKU.keySet()){
                ConnectApi.OCICreateReservationSingleInputRepresentation itemRecord = new ConnectApi.OCICreateReservationSingleInputRepresentation();
                itemRecord.stockKeepingUnit = productSKU;
                itemRecord.locationIdentifier = locationIdentifier;
                itemRecord.quantity = quantityToReserveByProductSKU?.get(productSKU);
                createRecords.add(itemRecord);
            }
        }
        reservation.createRecords = createRecords;

        Map<String,String> result = new Map<String,String>();

        try {
            ConnectApi.OCICreateReservationOutputRepresentation response = createReservationOCI(reservation);

            System.debug('Reservation Response: ' + response);
            System.debug('Success: ' + response?.success);

            if(response?.success){
                result.put('externalRefId', reservation.externalRefId);
                result.put('success', 'true');
            }else{
                result.put('hasError', 'true');
                result.put('success', 'false');
                for(Integer i = 0; i < response.errors.size(); i++){
                    ConnectApi.OCICreateReservationErrorOutputRepresentation error = response.errors[i];
                    result.put('Error ' + i, error.message);
                    System.debug('Error Message: ' + error.message);
                }
            }

        } catch (Exception e) {
            System.debug('OCI Reservation Exception: ' + e.getMessage());
        }

        return result;
    }

    private static ConnectApi.OCICreateReservationOutputRepresentation createReservationOCI(ConnectApi.OCICreateReservationInputRepresentation reservation) {
        if (Test.isRunningTest()) {
            return createReservationResponseForTest;
        } else {
            return ConnectApi.OmnichannelInventoryService.createReservation(reservation);
        }
    }

    public static Map<String,String> releaseReservation(Map<String,Map<String, Decimal>> quantityMapByLocation) {
        ConnectApi.OCIReleaseReservationInputRepresentation releaseReservation = new ConnectApi.OCIReleaseReservationInputRepresentation();
  
        List<ConnectApi.OCIReleaseReservationSingleInputRepresentation> releaseRecords = new List<ConnectApi.OCIReleaseReservationSingleInputRepresentation>();

        for(String location : quantityMapByLocation.keySet()){
            Map<String, Decimal> quantityToReleaseByProductSKU = quantityMapByLocation.get(location);
            System.debug('Release reservation for:' + quantityToReleaseByProductSKU);
            for(String productSKU : quantityToReleaseByProductSKU.keySet()){
                ConnectApi.OCIReleaseReservationSingleInputRepresentation itemRecord = new ConnectApi.OCIReleaseReservationSingleInputRepresentation();
                itemRecord.stockKeepingUnit = productSKU;
                itemRecord.locationIdentifier = location;
                itemRecord.quantity = quantityToReleaseByProductSKU?.get(productSKU);
                itemRecord.actionRequestId = System.UUID.randomUUID().toString();
                System.debug('SKU: ' + itemRecord.stockKeepingUnit + ' Quantidade a ser liberada: ' + itemRecord.quantity);
                releaseRecords.add(itemRecord);
            }
        }
        releaseReservation.releaseRecords = releaseRecords;

        Map<String,String> result = new Map<String,String>();
        
        try {
            ConnectApi.OCIReleaseReservationOutputRepresentation response = releaseReservationOCI(releaseReservation);

            System.debug('releaseReservation Response Success: ' + response?.success);

            result.put('success', response?.success ? 'true' : 'false');
            
            if(response?.errors.size() > 0){
                result.put('hasError', 'true');
    			System.debug('has errors');
                for(Integer i = 0; i < response.errors.size(); i++){
                    ConnectApi.OCIReleaseReservationErrorOutputRepresentation error = response.errors[i];
                    result.put('Error ' + i, error.message + '. In location: '+ error.details.locationIdentifier + '. For product sku: ' + error.details.stockKeepingUnit);
                    System.debug('Error Code: ' + error.errorCode);
                    System.debug('Error Message: ' + error.message);
                }
            }
        } catch (Exception e) {
            System.debug('OCI Reservation Exception: ' + e.getMessage());
        }

        return result;
    }

    private static ConnectApi.OCIReleaseReservationOutputRepresentation releaseReservationOCI(ConnectApi.OCIReleaseReservationInputRepresentation reservation) {
        if (Test.isRunningTest()) {
            return releaseReservationResponseForTest;
        } else {
            return ConnectApi.OmnichannelInventoryService.releaseReservation(reservation);
        }
    }

    public static void releaseCartItemsReservation(Map<String, String> accountIdByCartId, List<CartItem> cartItems){
        B2BInventoryProvider inventoryProvider = new B2BInventoryProvider();
        Map<String,String> locationExternalReference = new Map<String,String>();
        
        if(!Test.isRunningTest()){
            locationExternalReference = inventoryProvider.getLocationExternalReference(accountIdByCartId.values());
        }else{
            locationExternalReference = locationExternalReferenceForTest;
        }

        if(locationExternalReference.isEmpty()){
            return;
        }

        Map<String,Map<String, Decimal>> quantityMapByLocation = new Map<String,Map<String, Decimal>>();
        
        for (CartItem item : cartItems) {
            Decimal reservedQuantity = (Decimal) item.get('ReservedQuantity__c');
            if (String.isBlank(item.Sku)) {
                continue;
            }

            String externalRef = locationExternalReference.get(accountIdByCartId.get(item.CartId));
            if (String.isBlank(externalRef)) {
                continue;
            }

            if (!quantityMapByLocation.containsKey(externalRef)) {
                quantityMapByLocation.put(externalRef, new Map<String, Decimal>());
            }

            Map<String, Decimal> currentQuantityMap = quantityMapByLocation.get(externalRef);

            if (currentQuantityMap.containsKey(item.Sku)) {
                currentQuantityMap.put(item.Sku, currentQuantityMap.get(item.Sku) + reservedQuantity);
            } else {
                currentQuantityMap.put(item.Sku, reservedQuantity);
            }

            quantityMapByLocation.put(externalRef, currentQuantityMap);

            System.debug('SKU: ' + item.Sku + ' | Quantidade reservada: ' + reservedQuantity);
        }


        String quantityMapJson = JSON.serialize(quantityMapByLocation);
        System.debug('Quantity Map JSON: ' + quantityMapJson);

        B2BOCIReservationHelper.releaseReservationFuture(quantityMapJson); 
    }

    @future 
    public static void releaseReservationFuture(String quantityMapJson){

        System.debug('<=== releaseReservationFuture - Start ===>');

        Map<String, Map<String, Decimal>> quantityMapByLocation = (Map<String, Map<String, Decimal>>) JSON.deserialize(
            quantityMapJson, 
            Map<String, Map<String, Decimal>>.class
        );
        Map<String,String> releaseReservation = releaseReservation(quantityMapByLocation);

        if (!releaseReservation.isEmpty()) {
            
            if(releaseReservation.get('success') != 'true'){
                LogBuilder logBuilder = new LogBuilder(); 
                LogEngine logEngine = new LogEngine();
        
                LogWrapper.LogRequest logReq = logBuilder.of(
                    'PROCESS_INVENTORY',
                    'IntegrationLog',
                    new Map<String, Object>{
                        'ApexClass__c'   => 'B2BOCIReservationHelper',
                        'RelatedUser__c' => UserInfo.getUserId()
                    }
                );
        
                LogWrapper logWrapper = logEngine.start(
                    logReq,
                    JSON.serialize(quantityMapJson)
                );
                        
                logEngine.finalizeError(
                    logWrapper,
                    JSON.serialize(releaseReservation)
                );
            }
        }

        System.debug('<=== releaseReservationFuture - End ===>');
    }

    @InvocableMethod(label='Release reservations for Fulfillment Orders')
    public static void releaseReservation(List<B2BOCIReservationWrapper> requests) {
        Map<String, Map<String, Decimal>> quantityMapByLocation = new Map<String, Map<String, Decimal>>();
        
        for (B2BOCIReservationWrapper req : requests) {
            System.debug('LocationExternalReference: ' + req.locationExternalReference);
            
            if (!quantityMapByLocation.containsKey(req.locationExternalReference)) {
                quantityMapByLocation.put(req.locationExternalReference, new Map<String, Decimal>());
            }

            Map<String, Decimal> currentQuantityMap = quantityMapByLocation.get(req.locationExternalReference);

            for (B2BOCIReservationItemWrapper item : req.items) {
                currentQuantityMap.put(item.productCode, item.originalQuantity);
                System.debug(
                    'Item → ProductCode: ' + item.productCode +
                    ', Original Qty: ' + item.originalQuantity
                );
            }
        }

        String quantityMapJson = JSON.serialize(quantityMapByLocation);
        releaseReservationFuture(quantityMapJson);
    }

}