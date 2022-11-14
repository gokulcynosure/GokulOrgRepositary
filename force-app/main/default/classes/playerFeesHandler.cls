public class playerFeesHandler extends TriggerHandler {

    protected override void afterUpdate(){
    List<Player_Monthly_Fee__c> playersWhoseAmountChanged = new List<Player_Monthly_Fee__c>();
        for(Player_Monthly_Fee__c newPlayer : (List<Player_Monthly_Fee__c>) Trigger.new) {
            Player_Monthly_Fee__c oldPlayer = (Player_Monthly_Fee__c) Trigger.oldMap.get(newPlayer.Id);
            if(newPlayer.Fees_Paid__c != oldPlayer.Fees_Paid__c) {
                // amount has changed
                playersWhoseAmountChanged.add(newPlayer);
            }
        }
        List<Player_Monthly_Fee__c> playerFee = [Select id,Name,Fees_Paid__c,Total_Fees__c,Fees_Balance__c from Player_Monthly_Fee__c where id IN :playersWhoseAmountChanged];
        
        FOR(Player_Monthly_Fee__c play : playerFee){
            String feeId = play.Id;
            Player_Monthly_Fee__c newFee = (Player_Monthly_Fee__c) Trigger.newMap.get(feeId);
            
            play.Fees_Paid__c =+ newFee.Fees_Paid__c;
            play.Fees_Balance__c = play.Total_Fees__c - play.Fees_Paid__c;
        }
        update playerFee;
    }
    
}