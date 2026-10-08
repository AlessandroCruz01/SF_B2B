/**
 * @author: Carlos Farias - Everymind
 */

@IsTest 
public class OmnichannelInventoryConnectorTest {

    @isTest
    public static void itShouldRunCreateReservationsMethod() {
        
        OmnichannelInventoryConnector connector = new OmnichannelInventoryConnector();

        List<ConnectApi.OCICreateReservationInputRepresentation> inputs = new List<ConnectApi.OCICreateReservationInputRepresentation>{
            new ConnectApi.OCICreateReservationInputRepresentation()
        };

        List<ConnectApi.OCICreateReservationOutputRepresentation> response;

        Test.startTest();

        try {
            response = connector.createReservations(inputs);
        }
        catch(Exception e) {
            Assert.fail();
        }

        Test.stopTest();

        Assert.isNotNull(response);
        Assert.isTrue(response.isEmpty());

    }

    @isTest
    public static void itShouldRunFulfillReservationsMethod() {
        
        OmnichannelInventoryConnector connector = new OmnichannelInventoryConnector();

        List<ConnectApi.OCIFulfillReservationInputRepresentation> inputs = new List<ConnectApi.OCIFulfillReservationInputRepresentation>{
            new ConnectApi.OCIFulfillReservationInputRepresentation()
        };

        List<ConnectApi.OCIFulfillReservationOutputRepresentation> response;

        Test.startTest();

        try {
            response = connector.fulfillReservations(inputs);
        }
        catch(Exception e) {
            Assert.fail();
        }

        Test.stopTest();

        Assert.isNotNull(response);
        Assert.isTrue(response.isEmpty());

    }

    @isTest
    public static void itShouldRunReleaseReservationsMethod() {
        
        OmnichannelInventoryConnector connector = new OmnichannelInventoryConnector();

        List<ConnectApi.OCIReleaseReservationInputRepresentation> inputs = new List<ConnectApi.OCIReleaseReservationInputRepresentation>{
            new ConnectApi.OCIReleaseReservationInputRepresentation()
        };

        List<ConnectApi.OCIReleaseReservationOutputRepresentation> response;

        Test.startTest();

        try {
            response = connector.releaseReservations(inputs);
        }
        catch(Exception e) {
            Assert.fail();
        }

        Test.stopTest();

        Assert.isNotNull(response);
        Assert.isTrue(response.isEmpty());

    }

    @isTest
    public static void itShouldRunTransferReservationsMethod() {
        
        OmnichannelInventoryConnector connector = new OmnichannelInventoryConnector();

        List<ConnectApi.OCITransferReservationInputRepresentation> inputs = new List<ConnectApi.OCITransferReservationInputRepresentation>{
            new ConnectApi.OCITransferReservationInputRepresentation()
        };

        List<ConnectApi.OCITransferReservationOutputRepresentation> response;

        Test.startTest();

        try {
            response = connector.transferReservations(inputs);
        }
        catch(Exception e) {
            Assert.fail();
        }

        Test.stopTest();

        Assert.isNotNull(response);
        Assert.isTrue(response.isEmpty());

    }

    @isTest
    public static void itShouldRunUpdateReservationsMethod() {
        
        OmnichannelInventoryConnector connector = new OmnichannelInventoryConnector();

        List<ConnectApi.OCIUpdateReservationInputRepresentation> inputs = new List<ConnectApi.OCIUpdateReservationInputRepresentation>{
            new ConnectApi.OCIUpdateReservationInputRepresentation()
        };

        List<ConnectApi.OCIUpdateReservationOutputRepresentation> response;

        Test.startTest();

        try {
            response = connector.updateReservations(inputs);
        }
        catch(Exception e) {
            Assert.fail();
        }

        Test.stopTest();

        Assert.isNotNull(response);
        Assert.isTrue(response.isEmpty());

    }

    @isTest
    public static void itShouldRunGetInventoryAvailabilityMethod() {
        
        OmnichannelInventoryConnector connector = new OmnichannelInventoryConnector();

        List<ConnectApi.OCIGetInventoryAvailabilityInputRepresentation> inputs = new List<ConnectApi.OCIGetInventoryAvailabilityInputRepresentation>{
            new ConnectApi.OCIGetInventoryAvailabilityInputRepresentation()
        };

        List<ConnectApi.OCIGetInventoryAvailabilityOutputRepresentation> response;

        Test.startTest();

        try {
            response = connector.getInventoryAvailability(inputs);
        }
        catch(Exception e) {
            Assert.fail();
        }

        Test.stopTest();

        Assert.isNotNull(response);
        Assert.isTrue(response.isEmpty());

    }

    @isTest
    public static void itShouldNotSplitRequestWhenWithinAvailabilityCheckLimit() {

        ConnectApi.OCIGetInventoryAvailabilityInputRepresentation request = new ConnectApi.OCIGetInventoryAvailabilityInputRepresentation();
        request.locationIdentifiers = new List<String>{ 'Location_1' };
        request.stockKeepingUnits = buildSkus(50);
        request.useCache = false;

        Test.startTest();
        List<ConnectApi.OCIGetInventoryAvailabilityInputRepresentation> batches = OmnichannelInventoryConnector.splitByAvailabilityCheckLimit(
            request
        );
        Test.stopTest();

        Assert.areEqual(1, batches.size(), 'should not split when locations + SKUs <= 100');
        Assert.areEqual(request, batches[0], 'should return the original request unchanged');

    }

    @isTest
    public static void itShouldSplitRequestWhenExceedingAvailabilityCheckLimit() {

        ConnectApi.OCIGetInventoryAvailabilityInputRepresentation request = new ConnectApi.OCIGetInventoryAvailabilityInputRepresentation();
        request.locationIdentifiers = new List<String>{ 'Location_1', 'Location_2' };
        request.stockKeepingUnits = buildSkus(150);
        request.useCache = false;

        Test.startTest();
        List<ConnectApi.OCIGetInventoryAvailabilityInputRepresentation> batches = OmnichannelInventoryConnector.splitByAvailabilityCheckLimit(
            request
        );
        Test.stopTest();

        Assert.areEqual(2, batches.size(), 'should split 150 SKUs into two batches of up to 98 SKUs each (100 - 2 locations)');

        Integer totalSkusAcrossBatches = 0;
        for (ConnectApi.OCIGetInventoryAvailabilityInputRepresentation batch : batches) {
            Assert.isTrue(
                batch.locationIdentifiers.size() + batch.stockKeepingUnits.size() <= 100,
                'each batch must respect the 100 availability checks limit'
            );
            Assert.areEqual(request.locationIdentifiers, batch.locationIdentifiers, 'locations must be preserved in every batch');
            totalSkusAcrossBatches += batch.stockKeepingUnits.size();
        }

        Assert.areEqual(150, totalSkusAcrossBatches, 'no SKU should be lost or duplicated across batches');

    }

    @isTest
    public static void itShouldRunGetInventoryAvailabilityMethodWhenRequestExceedsLimit() {

        OmnichannelInventoryConnector connector = new OmnichannelInventoryConnector();

        ConnectApi.OCIGetInventoryAvailabilityInputRepresentation request = new ConnectApi.OCIGetInventoryAvailabilityInputRepresentation();
        request.locationIdentifiers = new List<String>{ 'Location_1' };
        request.stockKeepingUnits = buildSkus(150);
        request.useCache = false;

        List<ConnectApi.OCIGetInventoryAvailabilityOutputRepresentation> response;

        Test.startTest();

        try {
            response = connector.getInventoryAvailability(
                new List<ConnectApi.OCIGetInventoryAvailabilityInputRepresentation>{ request }
            );
        }
        catch(Exception e) {
            Assert.fail('should not throw even when the original request exceeds the API limit: ' + e.getMessage());
        }

        Test.stopTest();

        Assert.isNotNull(response);

    }

    private static List<String> buildSkus(Integer count) {
        List<String> skus = new List<String>();
        for (Integer i = 0; i < count; i++) {
            skus.add('SKU-' + i);
        }
        return skus;
    }

}