@isTest
public class VisitTriggerHandlerTest {

    @isTest
    static void addOneVisitperDay(){
        Account a = new Account();
        a.Name = 'Gokul';
        insert a;
        
        Visit__c visit = new Visit__c();
        visit.Name = 'Ishu';
        visit.Account__c = a.id;
        insert visit;
        
        List<Visit__c> visitor = [Select id,Name,Is_Latest__c from Visit__c where Account__c =: a.id ];
        system.assertEquals(1,visitor.size());
    }
    
    @isTest
    static void addMultipleVisitandCheck(){
        Account a = new Account();
        a.Name = 'Gokul123';
        insert a;
        
         Account a1 = new Account();
        a1.Name = 'Gokul123';
        insert a1;
       
        Visit__c visit = new Visit__c();
        visit.Name = 'Ishu';
        visit.Account__c = a.id;
        Insert visit;
        
        List<Visit__c> visits = new List<Visit__c>();
        Visit__c visit1 = new Visit__c();
        visit1.Name = 'Madhu';
        visit1.Account__c = a.id;
        visits.add(visit1);
        
         Visit__c visit2 = new Visit__c();
        visit2.Name = 'Ishu';
        visit2.Account__c = a1.id;
        visits.add(visit2);
        
       Insert visits;
 
        system.debug('1 st Visit' +[Select id,Name,Is_Latest__c from Visit__c where Account__c =: a.id ] );
         system.debug('2 nd Visit' +[Select id,Name,Is_Latest__c from Visit__c where Account__c =: a1.id ] );
   
        
    }
}