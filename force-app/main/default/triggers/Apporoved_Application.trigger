trigger Apporoved_Application on Approved_Loans__c (after insert) {

     if(trigger.isAfter){
        If(trigger.isInsert){
            system.debug('Gokul');
           ApprovedTriggerHandler.paymentSchedule(trigger.new);
        }

}
}