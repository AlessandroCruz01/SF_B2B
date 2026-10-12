public with sharing class ApexWire_vs_ImperativeApex {

    //* Mutation: imperative invocation required
    @AuraEnabled
    public static void updateAccountName(
        Id accountId,
        String newName
    ) {
        update new Account(
            Id = accountId,
            Name = newName
        );
    }

    //* Read-only operation
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Id, Name
            FROM Account
            LIMIT 10
        ];
    }
}