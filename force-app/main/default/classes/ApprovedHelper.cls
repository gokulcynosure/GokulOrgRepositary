public with sharing class ApprovedHelper {
    @AuraEnabled(cacheable=True)
    public static List<Approved_Loans__c> getAllLoan(){
        return [SELECT Id,Name,Period_Months__c ,Total_Loan_Amount__c
                FROM Approved_Loans__c
                LIMIT 1000];
    }

    @AuraEnabled(cacheable=True)
    public static List<Approved_Loans__c> searchLoan(String searchString){
        List<List<SObject>> contacts = [FIND :searchString IN ALL FIELDS RETURNING Approved_Loans__c(Id,Name,Period_Months__c,Total_Loan_Amount__c )];

        return (List<Approved_Loans__c>) contacts[0];
    }

    @AuraEnabled
    public static void deleteLoan(List<Id> contactIds){
        if(contactIds.size() > 0 ){
            delete [SELECT Id FROM Approved_Loans__c WHERE Id in: contactIds];
        }
    }
}