public with sharing class contactListViewHelper {
    
    @AuraEnabled(cacheable=True)
    public static List<Loan_Applications__c> getAllLoan(){
        return [SELECT Id,Name ,Loan_Status__c
                FROM Loan_Applications__c
                LIMIT 1000];
    }

    @AuraEnabled(cacheable=True)
    public static List<Loan_Applications__c> searchLoan(String searchString){
        List<List<SObject>> contacts = [FIND :searchString IN ALL FIELDS RETURNING Loan_Applications__c(Id,Name ,Loan_Status__c)];

        return (List<Loan_Applications__c>) contacts[0];
    }

    @AuraEnabled
    public static void deleteLoan(List<Id> contactIds){
        if(contactIds.size() > 0 ){
            delete [SELECT Id FROM Loan_Applications__c WHERE Id in: contactIds];
        }
    }
}