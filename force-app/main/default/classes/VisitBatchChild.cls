public class VisitBatchChild implements Database.Batchable<sObject>,DataBase.Stateful {
    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('In start method');
        return Database.getQueryLocator([Select id,Name,Visit_Date__c,Account__c from Visit__c  ORDER BY Visit_Date__c DESC, id DESC]);
    }
    
    Public void execute(Database.BatchableContext bc,List<Visit__c>vstlist){
        system.debug('Visit'+ vstList);
        Set<Id> accId = new Set<Id>();
        List<Visit__c> toBeDeleted = new List<Visit__c>();
        for(Visit__c vst : vstList){
            accId.add(vst.Account__c);
        }
        system.debug('AccountIds'+ accId);
        List<Visit__c> vst = [select id,Name,Visit_Date__c,Account__c From Visit__c where Account__c IN :accId ORDER BY Visit_Date__c DESC, id DESC];
       system.debug('VisitList'+ vst);
        Map <Map<id,date> , Visit__c> maps = new Map <Map< id,date> , Visit__c> ();
        
        for(Visit__c visitor : vst){
            Map<id,Date> visitsIdAndDate = new Map<id,Date>();
            visitsIdAndDate.put(visitor.Account__c, visitor.Visit_Date__c);
          system.debug('visitsIdAndDate'+visitsIdAndDate );
          
            if(maps.containsKey(visitsIdAndDate)){
                toBeDeleted.add(visitor);
            	}
          ELSE{
                maps.put(visitsIdAndDate,visitor);
            }
        }
        system.debug('toBedeleted'+toBeDeleted );
        delete toBeDeleted;
    }
    public void finish(database.BatchableContext bc){
        system.debug('In finish Method');
    }
}