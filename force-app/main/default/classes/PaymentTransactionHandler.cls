public class PaymentTransactionHandler extends TriggerHandler{

    
    protected override void afterInsert(){
        /*	Get the payment details and add player id and month id into List
         * Query the player monthly fees object and find which player and which month payment is doing
         * update the fees amount for that particular player
       	*/
        List<Player_Monthly_Fee__c> fee = new List<Player_Monthly_Fee__c>();
        List<Id> monthId = new List<Id>();
        List<Id> playerId = new List<Id>();
        for(Payment_Transaction__c payment : (List<Payment_Transaction__c>) Trigger.new){
            monthId.add(payment.Month__c);
            playerId.add(payment.Player__c);
        }
        system.debug('monthId'+ monthId);
        List<Decimal> monthDecimal = new List<Decimal>();
        for(Months__c monthNumber : [Select id,Name,Month_Number__c From Months__c where Id IN :monthId]){
            monthDecimal.add(monthNumber.Month_Number__c);
        }

        List<Player_Monthly_Fee__c> playerFees = [Select id,Name,Month__c,Player__c,Fees_Paid__c From Player_Monthly_Fee__c where  Player__c IN : playerId and Month__c IN :monthDecimal ];
        system.debug('player'+playerFees);
        for(Payment_Transaction__c payment : (List<Payment_Transaction__c>) Trigger.new){
            for(Player_Monthly_Fee__c monthFees : playerFees ){
                monthFees.Fees_Paid__c =+ payment.Transaction_Amount__c;
                fee.add(monthFees);
            }
         }
        update fee;
    }
    
}