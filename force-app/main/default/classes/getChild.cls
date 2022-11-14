public  class getChild {

    @AuraEnabled
    public static  List<Approved_Loans__c> childRec(String recordId){
        try {
            List<Approved_Loans__c> child = [Select id,(Select id,Month__C,Month_Interest__c,Starting_Balance__c,Month_Principle__c,Month_Ending_Balance__c FROM Payment_Schedules__r) From Approved_Loans__C where id =:recordId];

            if(!child.isEmpty()){
                return child;
            }
            return null;
        
            
        } catch (Exception e) {
          return null;  
        }
    }

    @AuraEnabled
    public static  List<Player__c> childRecords(String recordId){
        try {
            List<Player__c> child = [Select id,(Select id,Month__C,Fees_Balance__c,Fees_Paid__c,Payment_Last_Date__c,Total_Fees__c FROM Player_Monthly_Fees__r) From Player__c where id =:recordId];

            if(!child.isEmpty()){
                return child;
            }
            return null;
        
            
        } catch (Exception e) {
          return null;  
        }
    }
}