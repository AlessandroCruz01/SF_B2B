/**
 * @author Alessandro Souza
 * Provides buyer segment evaluation data for buyer accounts.
 *
 * This provider retrieves the buyer segment associated with a specified
 * account so that it can be used during buyer segment evaluation.
*/
public virtual inherited sharing class BuyerSegmentEvaluationProvider {
    /**
     * Retrieves the buyer account for the specified account ID.
     *
     * @param accountId the ID of the account to retrieve
     * @return the buyer account and its buyer segment
     */
    public virtual Account getBuyerAccount(String accountId){
        return [
            SELECT Id, BuyerSegment__c
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ][0];
    }

    /**
     * BuyerGroup e WebStoreBuyerGroup nao sao acessiveis via SOQL quando o codigo
     * executa no contexto de um usuario de portal/comunidade (o caso real do buyer
     * navegando a storefront) - so para usuarios internos. Por isso o mapeamento
     * segmento -> Buyer Group e resolvido via Custom Metadata Type, que e legivel
     * por qualquer tipo de usuario.
     */
    public virtual Buyer_Segment_Group_Mapping__mdt getBuyerGroupMapping(String segmentCode) {
        return Buyer_Segment_Group_Mapping__mdt.getInstance(segmentCode);
    }
}