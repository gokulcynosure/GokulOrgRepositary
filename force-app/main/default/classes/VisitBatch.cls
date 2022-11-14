public class VisitBatch implements Database.Batchable<sObject>,DataBase.Stateful {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('In start method');
        return Database.getQueryLocator([Select id,Name,(Select id,Name,Visit_Date__c from Visit__r  ORDER BY Visit_Date__c DESC, id DESC) From Account]);
    }
    
    Public void execute(Database.BatchableContext bc,List<Account>acclist){
        for(Account acc : accList){
            Set<Date> datesOfVisits = new Set<Date>();
            Set<Id> toBeDeleted= new set<Id>();
          for(Visit__c visitRecord : acc.Visit__r){
                if(datesOfVisits.contains(visitRecord.Visit_Date__c)){
                    delete visitRecord;
                }Else{
                    datesOfVisits.add(visitRecord.Visit_Date__c);
                }
            }
        }
    }
    public void finish(database.BatchableContext bc){
        system.debug('In finish Method');
    }
}