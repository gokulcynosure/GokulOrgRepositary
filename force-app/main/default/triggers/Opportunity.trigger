trigger Opportunity on Opportunity (before insert,before update,after insert,after update) {
    
    if(trigger.isInsert){
        If(trigger.isBefore){
             OpportunityTriggerhandler.insertOpportunity(trigger.new);
        }
    }
    if(trigger.isBefore){
        if(trigger.isUpdate){
           OpportunityTriggerhandler.updateAmount(trigger.Old,trigger.NewMap);
        }
    }
   
   
}