public class PlayerTriggerHandler Extends TriggerHandler {
	
    protected override void afterInsert(){
         List<Player_Monthly_Fee__c> fee = new List<Player_Monthly_Fee__c>();
       List< Date > startDate = new List<Date>();
        Decimal payment;
        Set<Id> levelId = new Set<Id>();
        for(Player__c pl : (List<Player__c>) Trigger.new){
           startDate.add(pl.Enrollment_Date__c);
            levelId.add(pl.Sport_Level__c);
        }
        
        List<Date> lstDates = new List<Date>();
        for(Date sd : startDate){
              lstDates.add(sd);
           }
        
        List<Decimal> monthNumber = new List <Decimal>();
        for(Date num : lstDates){
            monthNumber.add(num.month());
        }
        Id basic;
        Id junior;
        Id senior;
        List<Sport_Level__c> sp = [Select id,Name From Sport_Level__c];
        for(Sport_Level__c sportlvl : sp){
            if(sportlvl.Name == 'Basic') {
                basic = sportlvl.id;
            } Else if(sportlvl.Name == 'Junior') {
                junior = sportlvl.id;
            }Else if(sportlvl.Name == 'Senior') {
                senior = sportlvl.id;
            }
        }
        List<Months__c> monthList = [Select id,Name,Month_Number__c, (Select id,Month__c,Sport_Level__c,Fees_Amount__c from Fees__r) FROM Months__c where Month_Number__c IN : monthNumber ];
        List<Fees__c> feeList = new List<Fees__c>();
        for(Months__c mon : monthList){
            feeList = mon.Fees__r;
        }
        for(Fees__c f : feeList){
            for(Id level : levelId){
		if(f.Sport_Level__c == level){
				payment = f.Fees_Amount__c;
        }
            }
        }
        system.debug('payment'+ payment);

        Integer loopCount = 0;
        
        for(Player__c player : (List<Player__c>) Trigger.new){
            for(Integer i = 0; i <3 ;i++) {
                Player_Monthly_Fee__c monthFee = new Player_Monthly_Fee__c();
                monthFee.Player__c = player.id;
                monthFee.Total_Fees__c = payment;
                monthFee.Fees_Paid__c = 0;
                monthFee.Payment_Last_Date__c = startDate.get(loopCount).addMonths(1);
                monthFee.Fees_Balance__c = payment - monthFee.Fees_Paid__c;
                monthFee.Fees_Paid__c = monthFee.Total_Fees__c - monthFee.Fees_Balance__c;
                monthFee.Fees_to_be_Paid__c = monthFee.Fees_Balance__c;
                monthFee.Month__c = startDate.get(loopCount).month();
                fee.add(monthFee);
                startDate.add(startDate.get(loopCount).addMonths(1));
               	loopCount ++;
                
                
            }
            system.debug(fee);
       insert fee; 
          }
        
    }
    }