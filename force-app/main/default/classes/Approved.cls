public with sharing class Approved {

    @AuraEnabled
    public static boolean approve(String recordId){
       
        Approved_Loans__c app = new Approved_Loans__c();
        system.System.debug(app);
        try {
           system.debug('Gokul');
           system.debug(recordId);
            List <Loan_Applications__c> loan = [SELECT Name,Loan_Amount__c,Period_Months__c FROM Loan_Applications__c where Id =: recordId];
            system.debug(loan);
            for(Loan_Applications__c lo : loan){
                app.Period_Months__c = lo.Period_Months__c;
                app.Total_Loan_Amount__c = lo.Loan_Amount__c;
                app.Name = lo.Name;
                app.Interest__c = 2;
                Integer i = app.Interest__c.intValue();
            Decimal firstInterest =(app.Total_Loan_Amount__c * (app.Interest__c/12))/100;
           app.Monthly_EMI__c =  (app.Total_Loan_Amount__c /  app.Period_Months__c) + firstInterest;

           /*(principal*rate*Math.pow(1+rate,time))/(Math.pow(1+rate,time)-1);
          // rate=rate/(12*100); 
           Integer Interest = i / (12*100);
           Integer timePeriod = app.Period_Months__c.intValue();
           system.debug('fail');     
           Decimal a= (app.Total_Loan_Amount__c * Interest * math.pow(1+Interest,timePeriod)) / (math.pow(1+Interest,timePeriod)-1);
          
          system.debug('Success');*/
          
          Insert app;

                Loan_Applications__c loan1 = new Loan_Applications__c();
                loan1.id = recordId;
                loan1.Loan_Status__c = 'Approved';
                update loan1;
             
                
            }
            
        } catch (Exception e) {
            return false;
        }
        return true;
       
    }

    @AuraEnabled
    public static boolean decline(String recordId){
        Loan_Applications__c loan = new Loan_Applications__c();
        try {
            loan.id = recordId;
            loan.Loan_Status__c = 'Declined';
            update loan;
           
            
            
        } catch (Exception e) {
            return false;
        }
        return True;
    }
}