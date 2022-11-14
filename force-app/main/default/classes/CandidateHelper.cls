public with sharing class CandidateHelper {
    @AuraEnabled(cacheable=True)
    public static List<Candidate_Application__c> getAllApplications(){
        return [SELECT Id,Name ,Application_Status__c
                FROM Candidate_Application__c
                LIMIT 1000];
    }

    @AuraEnabled(cacheable=True)
    public static List<Candidate_Application__c> searchApplications(String searchString){
        List<List<SObject>> contacts = [FIND :searchString IN ALL FIELDS RETURNING Candidate_Application__c(Id,Name ,Application_Status__c)];

        return (List<Candidate_Application__c>) contacts[0];
    }

    @AuraEnabled
    public static void deleteApplication(List<Id> contactIds){
        if(contactIds.size() > 0 ){
            delete [SELECT Id FROM Candidate_Application__c WHERE Id in: contactIds];
        }
    }
    @AuraEnabled(cacheable=True)
    public static List<Person__c> getAllPerson(){
        system.System.debug('Gokul');
        return [SELECT Id,Name,City__c FROM Person__c
                LIMIT 1000];
    }

    @AuraEnabled(cacheable=True)
    public static List<Person__c> searchPerson(String searchString){
        List<List<SObject>> contacts = [FIND :searchString IN ALL FIELDS RETURNING Person__c(Id,Name,Last_Name__c,City__c )];

        return (List<Person__c>) contacts[0];
    }

    @AuraEnabled
    public static void deletePerson(List<Id> contactIds){
        if(contactIds.size() > 0 ){
            delete [SELECT Id FROM Person__c WHERE Id in: contactIds];
        }
    }

    @AuraEnabled(cacheable=True)
    public static List<Player__c> getAllPlayers(){
        return [SELECT Id,Name,Enrollment_Date__c FROM Player__c
                LIMIT 1000];
    }

    @AuraEnabled(cacheable=True)
    public static List<Player__c> searchPlayers(String searchString){
        List<List<SObject>> contacts = [FIND :searchString IN ALL FIELDS RETURNING Player__c(Id,Name )];

        return (List<Player__c>) contacts[0];
    }

    @AuraEnabled
    public static void deletePlayers(List<Id> contactIds){
        if(contactIds.size() > 0 ){
            delete [SELECT Id FROM Player__c WHERE Id in: contactIds];
        }
    }
}