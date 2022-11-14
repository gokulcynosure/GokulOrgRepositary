public class VisitTriggerHandler extends TriggerHandler {
	
protected override void beforeInsert(){
    Set<Id> parentId = new Set<Id>();
    for(Visit__c visa : (List<Visit__c>)trigger.new){
           parentId.add(visa.Account__c);
    }
    List<Visit__c> visitor = [Select id,Name,Account__c From Visit__c where CreatedDate = TODAY AND Account__c IN :parentId];
   		
    Set<Id> parent = new Set<Id>();
   
    for(Visit__c v1 : visitor){
        parent.add(v1.Account__c);
    }
    for(Visit__c v2 :  (List<Visit__c>)trigger.new){
        if(parent.Contains(v2.Account__c)){
            v2.addError('You cant create record');
        }
   }
    }
    }