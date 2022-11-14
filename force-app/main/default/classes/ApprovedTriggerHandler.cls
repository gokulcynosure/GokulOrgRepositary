public class ApprovedTriggerHandler {

    public static void paymentSchedule(List <Approved_Loans__c> app){
        List <Payment_Schedule__c> pay = new List<Payment_Schedule__c>();
         Integer month =1;
        
      for(Approved_Loans__c a : app){
            IF(a.Monthly_EMI__c != NULL){
            Decimal emi = a.Monthly_EMI__c;
            Decimal Loan = a.Total_Loan_Amount__c;
          for(Integer i =0; i < a.Period_Months__c ; i++){
              Payment_Schedule__c payment = new  Payment_Schedule__c();
                payment.Approved_Loans__c = a.Id;
                payment.Month__c = month;
              payment.Starting_Balance__c = Loan ;
              
              payment.Month_Interest__c = ((Loan* (a.Interest__c/12))/100);
               if( payment.Starting_Balance__c < emi){
                  emi= payment.Starting_Balance__c + payment.Month_Interest__c ;
              }
              payment.Month_Principle__c = (emi - payment.Month_Interest__c);
                payment.Month_Ending_Balance__c = (Loan - (payment.Month_Principle__c) );
               
                Loan = payment.Month_Ending_Balance__c;
               month ++;   
                
              
                
                pay.add(payment);
                
              
             
            }
           insert pay;
                
        }
        }
        
    }
}