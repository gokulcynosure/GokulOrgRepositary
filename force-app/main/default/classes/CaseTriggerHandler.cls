public class CaseTriggerHandler extends TriggerHandler {
    
 protected override void afterUpdate(){
   Set<Id> idSet = new Set<Id>();
     // Find case amount changed or not
     for(Case cs : (List<Case>)trigger.new){
         Case oldCs = (Case) Trigger.oldMap.get(cs.Id);
         if(cs.Account_Amount__c != oldCs.Account_Amount__c) {
             // capture amount changed case parent id   
             idSet.add(cs.AccountId);
            }
     }
     // Get changed Case parent values
     List<Account> acParent = [Select id,Name,All_Cases_Updated__c FROM Account where id IN :idSet];
     // update parent 
     for(Account acc : acParent){
         acc.All_Cases_Updated__c = true;
     }
     update acParent;
 }

}