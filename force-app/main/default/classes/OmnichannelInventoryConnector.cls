/**
 * @author: Carlos Farias - Everymind
 */

public virtual class OmnichannelInventoryConnector {

    @TestVisible
    private static final Integer MAX_AVAILABILITY_CHECKS = 100;

    virtual public List<ConnectApi.OCICreateReservationOutputRepresentation> createReservations(
        List<ConnectApi.OCICreateReservationInputRepresentation> reservations
    ) {
        List<ConnectApi.OCICreateReservationOutputRepresentation> responses = new List<ConnectApi.OCICreateReservationOutputRepresentation>();

        for (ConnectApi.OCICreateReservationInputRepresentation reservation : reservations) {
            if (!System.Test.isRunningTest()) responses.add(ConnectApi.OmnichannelInventoryService.createReservation(reservation));
        }

        return responses;
    }

    virtual public List<ConnectApi.OCIFulfillReservationOutputRepresentation> fulfillReservations(
        List<ConnectApi.OCIFulfillReservationInputRepresentation> inputs
    ) {
        List<ConnectApi.OCIFulfillReservationOutputRepresentation> responses = new List<ConnectApi.OCIFulfillReservationOutputRepresentation>();

        for (ConnectApi.OCIFulfillReservationInputRepresentation input : inputs) {
            if (!System.Test.isRunningTest()) responses.add(ConnectApi.OmnichannelInventoryService.fulfillReservation(input));
        }

        return responses;
    }

    virtual public List<ConnectApi.OCIReleaseReservationOutputRepresentation> releaseReservations(
        List<ConnectApi.OCIReleaseReservationInputRepresentation> inputs
    ) {
        List<ConnectApi.OCIReleaseReservationOutputRepresentation> responses = new List<ConnectApi.OCIReleaseReservationOutputRepresentation>();

        for (ConnectApi.OCIReleaseReservationInputRepresentation input : inputs) {
            if (!System.Test.isRunningTest()) responses.add(ConnectApi.OmnichannelInventoryService.releaseReservation(input));
        }

        return responses;
    }

    virtual public List<ConnectApi.OCITransferReservationOutputRepresentation> transferReservations(
        List<ConnectApi.OCITransferReservationInputRepresentation> inputs
    ) {
        List<ConnectApi.OCITransferReservationOutputRepresentation> responses = new List<ConnectApi.OCITransferReservationOutputRepresentation>();

        for (ConnectApi.OCITransferReservationInputRepresentation input : inputs) {
            if (!System.Test.isRunningTest()) responses.add(ConnectApi.OmnichannelInventoryService.transferReservation(input));
        }

        return responses;
    }

    virtual public List<ConnectApi.OCIUpdateReservationOutputRepresentation> updateReservations(
        List<ConnectApi.OCIUpdateReservationInputRepresentation> inputs
    ) {
        List<ConnectApi.OCIUpdateReservationOutputRepresentation> responses = new List<ConnectApi.OCIUpdateReservationOutputRepresentation>();

        for (ConnectApi.OCIUpdateReservationInputRepresentation input : inputs) {
            if (!System.Test.isRunningTest()) responses.add(ConnectApi.OmnichannelInventoryService.updateReservation(input));
        }

        return responses;
    }

    virtual public List<ConnectApi.OCIGetInventoryAvailabilityOutputRepresentation> getInventoryAvailability(
        List<ConnectApi.OCIGetInventoryAvailabilityInputRepresentation> requests
    ) {
        List<ConnectApi.OCIGetInventoryAvailabilityOutputRepresentation> outputs = new List<ConnectApi.OCIGetInventoryAvailabilityOutputRepresentation>();

        for (ConnectApi.OCIGetInventoryAvailabilityInputRepresentation request : requests) {
            for (ConnectApi.OCIGetInventoryAvailabilityInputRepresentation availabilityRequest : splitByAvailabilityCheckLimit(request)) {
                if (!System.Test.isRunningTest()) outputs.add(ConnectAPI.OmnichannelInventoryService.getInventoryAvailability(availabilityRequest));
            }
        }

        return outputs;
    }
    
    @TestVisible
    private static List<ConnectApi.OCIGetInventoryAvailabilityInputRepresentation> splitByAvailabilityCheckLimit(
        ConnectApi.OCIGetInventoryAvailabilityInputRepresentation request
    ) {
        List<ConnectApi.OCIGetInventoryAvailabilityInputRepresentation> batches = new List<ConnectApi.OCIGetInventoryAvailabilityInputRepresentation>();

        List<String> locationIdentifiers = request.locationIdentifiers != null
            ? request.locationIdentifiers : new List<String>();
        List<String> stockKeepingUnits = request.stockKeepingUnits != null
            ? request.stockKeepingUnits : new List<String>();

        if (locationIdentifiers.size() + stockKeepingUnits.size() <= MAX_AVAILABILITY_CHECKS) {
            batches.add(request);
            return batches;
        }

        Integer skuBatchSize = Math.max(1, MAX_AVAILABILITY_CHECKS - locationIdentifiers.size());
        Integer totalSkus = stockKeepingUnits.size();

        for (Integer i = 0; i < totalSkus; i += skuBatchSize) {
            Integer endIndex = Math.min(i + skuBatchSize, totalSkus);
            List<String> skuBatch = new List<String>();
            for (Integer j = i; j < endIndex; j++) {
                skuBatch.add(stockKeepingUnits.get(j));
            }

            ConnectApi.OCIGetInventoryAvailabilityInputRepresentation batchedRequest = new ConnectApi.OCIGetInventoryAvailabilityInputRepresentation();
            batchedRequest.locationIdentifiers = locationIdentifiers;
            batchedRequest.stockKeepingUnits = skuBatch;
            batchedRequest.useCache = request.useCache;
            batches.add(batchedRequest);
        }

        return batches;
    }
}