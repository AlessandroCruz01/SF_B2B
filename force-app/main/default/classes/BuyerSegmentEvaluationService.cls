/**
 * BuyerSegmentEvaluationService.cls
 *
 * This class extends the CommerceBuyGrp.BuyerGroupEvaluationService to customize the evaluation of buyer groups.
 * It overrides the getBuyerGroupIds method to allow for additional logic while still preserving the default behavior.
 *
 * @author Alessandro Souza
 * @date 2026-09-17
 */
public without sharing class BuyerSegmentEvaluationService extends CommerceBuyGrp.BuyerGroupEvaluationService {

    @TestVisible
    private BuyerSegmentEvaluationProvider provider;

    /**
     * Initializes constructor class.
     */
    public BuyerSegmentEvaluationService() {
        this.provider = new BuyerSegmentEvaluationProvider();
    }

    /**
     * Returns the buyer group IDs for the specified buyer group evaluation request.
     *
     * @param request the buyer group evaluation request
     * @return the buyer group evaluation response containing the buyer group IDs
     */
    public override CommerceBuyGrp.BuyerGroupResponse getBuyerGroupIds(
        CommerceBuyGrp.BuyerGroupRequest request
    ) {

        //? https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/extensions.html
        //* Boa prática da Salesforce Commerce Cloud é sempre chamar o método da superclasse para garantir que a lógica padrão seja executada antes de aplicar qualquer personalização. Isso garante que a funcionalidade básica do sistema seja mantida, enquanto permite que você adicione ou modifique comportamentos específicos conforme necessário.
        CommerceBuyGrp.BuyerGroupResponse defaultResponse = super.getBuyerGroupIds(request);

        String goldSegment = 'GOLD';
        String accountId = request.getAccountId();
        String storeId = request.getStoreId();

        if (String.isBlank(accountId)) {
            return defaultResponse;
        }

        Account buyerAccount = provider.getBuyerAccount(accountId);

        System.debug('ACCOUNT ID: ' + accountId);
        System.debug('STORE ID: ' + storeId);
        System.debug('BUYER SEGMENT: ' + buyerAccount.BuyerSegment__c);

        String segmentCode = (buyerAccount.BuyerSegment__c == goldSegment) ? 'GOLD' : 'STANDARD';

        Buyer_Segment_Group_Mapping__mdt mapping = provider.getBuyerGroupMapping(segmentCode);

        if (mapping == null || String.isBlank(mapping.Buyer_Group_Id__c)) {
            System.debug('No buyer group mapping found for segment: ' + segmentCode);
            return defaultResponse;
        }

        Id targetBuyerGroupId = (Id) mapping.Buyer_Group_Id__c;
        System.debug('TARGET BUYER GROUP: ' + targetBuyerGroupId);


        Set<String> buyerGroupIds = new Set<String>(defaultResponse.getBuyerGroupIds());
        buyerGroupIds.add(String.valueOf(targetBuyerGroupId));
        return new CommerceBuyGrp.BuyerGroupResponse(buyerGroupIds);
    }
}