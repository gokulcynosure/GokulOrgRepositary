public class LoanTriggerHandler {
    /*public static void insertStatus(List<Loan_Applications__c> loan){
        Decimal percent;
        
        for(Loan_Applications__c app : loan){
           
         if(app.Loan_Amount__c > 500000 &&  app.Own_House__c == 'Yes' && app.Own_Vehicle__c =='yes' ){
                app.Loan_Status__c  = 'Approved';
           }ELSE IF (app.Loan_Amount__c > 500000 && app.Own_House__c == 'No' || app.Own_Vehicle__c == 'no'){
                app.Loan_Status__c  = 'Pending';
            }ELSE IF(APP.Loan_Amount__c > 300000  && app.Own_Vehicle__c == 'Yes' && app.Month_Salary__c > 30000 || app.Own_House__c == 'yes'){
                app.Loan_Status__c = 'Approved';
            }ELSE IF(APP.Loan_Amount__c > 300000 && app.Own_House__c == 'no' && app.Own_Vehicle__c == 'no' && app.Month_Salary__c < 30000){
                app.Loan_Status__c = 'Pending';
            }ELSE IF(app.Loan_Amount__c > 100000  && app.Month_Salary__c > 10000){
                app.Loan_Status__c = 'Approved';
            }
            ELSE IF(app.Loan_Amount__c > 100000 &&  app.Month_Salary__c < 10000){
                app.Loan_Status__c = 'Pending';
            }
            
            
        }
    }
    
    public static void approved(List<Loan_Applications__c> approved){
        List<Approved_Loans__c> app = new List<Approved_Loans__c>();
        system.debug(app);
        for(Loan_Applications__c loan : approved){
            if(loan.Loan_Status__c == 'Approved'){
            Approved_Loans__c approve = new Approved_Loans__c();
            approve.Interest__c = 2;
            
            approve.Name = loan.Name;
            approve.Total_Loan_Amount__c = loan.Loan_Amount__c;
            approve.Period_Months__c = loan.Period_Months__c;
             
              
            
                Decimal firstInterest =(approve.Total_Loan_Amount__c * (approve.Interest__c/12))/100;
            approve.Monthly_EMI__c =  (approve.Total_Loan_Amount__c /  approve.Period_Months__c) + firstInterest;
           approve.FirstPrinciple__c = approve.Monthly_EMI__c -  approve.firstIntrest__c;
            approve.First_Month_Balance__c = approve.Total_Loan_Amount__c - approve.FirstPrinciple__c;
                
            
             approve.secondEmi__c =  ((approve.First_Month_Balance__c - approve.Monthly_EMI__c) *  (approve.Interest__c/12))/100 ;
             approve.SecondBalance__c = approve.Monthly_EMI__c - approve.secondEmi__c;
             approve.Second_Month_Balance__c =  approve.First_Month_Balance__c - approve.SecondBalance__c;
                
               approve.thirdEmi__c =  ((approve.Second_Month_Balance__c - approve.Monthly_EMI__c) *  (approve.Interest__c/12))/100 ;
             approve.thirdBalance__c = approve.Monthly_EMI__c - approve.thirdEmi__c;
                approve.Third_Month_Balance__c = approve.Second_Month_Balance__c- approve.thirdBalance__c;
               
                 approve.forthEmi__c =  ((approve.Third_Month_Balance__c - approve.Monthly_EMI__c ) *  (approve.Interest__c/12))/100 ;
             approve.forthBalance__c = approve.Monthly_EMI__c - approve.forthEmi__c; 
           approve.Fourth_Month_Balance__c= approve.Third_Month_Balance__c - approve.forthBalance__c;
                
                 approve.fifthEmi__c =  ((approve.Fourth_Month_Balance__c - approve.Monthly_EMI__c ) *  (approve.Interest__c/12))/100 ;
             approve.fifthBalance__c = approve.Monthly_EMI__c - approve.fifthEmi__c; 
                  approve.Fifth_Month_Balance__c= approve.Fourth_Month_Balance__c - approve.fifthBalance__c;
                
                
                approve.SixthEmi__c =  ((approve.Fifth_Month_Balance__c - approve.Monthly_EMI__c ) *  (approve.Interest__c/12))/100 ;
             approve.SixthBalance__c = approve.Monthly_EMI__c - approve.SixthEmi__c; 
              approve.Sixth_Moth_Balance__c= approve.Fifth_Month_Balance__c - approve.SixthBalance__c;
                
                
          approve.seventhEmi__c =  ((approve.Sixth_Moth_Balance__c - approve.Monthly_EMI__c) *  (approve.Interest__c/12))/100 ;
             approve.seventhBalance__c = approve.Monthly_EMI__c - approve.seventhEmi__c; 
                approve.Seventh_Month_Balance__c= approve.Sixth_Moth_Balance__c - approve.seventhBalance__c;
                
                
          approve.eighthEmi__c =  ((approve.Seventh_Month_Balance__c- approve.Monthly_EMI__c ) *  (approve.Interest__c/12))/100 ;
             approve.eighthBalance__c = approve.Monthly_EMI__c - approve.eighthEmi__c;       
         approve.Eighth_Month_Balance__c= approve.Seventh_Month_Balance__c - approve.eighthBalance__c;
                
                
            approve.ninthEmi__c =  (( approve.Eighth_Month_Balance__c - approve.Monthly_EMI__c ) *  (approve.Interest__c/12))/100 ;
             approve.ninthBalance__c = approve.Monthly_EMI__c - approve.ninthEmi__c;   
             approve.Ninth_Month_Balance__c= approve.Eighth_Month_Balance__c - approve.ninthBalance__c;
            
              
                approve.tenthEmi__c =  ((approve.Ninth_Month_Balance__c - approve.Monthly_EMI__c) *  (approve.Interest__c/12))/100 ;
             approve.tenthBalance__c = approve.Monthly_EMI__c - approve.tenthEmi__c;   
           approve.Tenth_Month_Balance__c= approve.Ninth_Month_Balance__c - approve.tenthBalance__c;
                 
         
                
                approve.elevenEmi__c =  ((approve.Tenth_Month_Balance__c - approve.Monthly_EMI__c ) *  (approve.Interest__c/12))/100 ;
             approve.elevenBalance__c = approve.Monthly_EMI__c - approve.elevenEmi__c;
             approve.Eleventh_Month_Balanace__c= approve.Tenth_Month_Balance__c - approve.elevenBalance__c;
              
                
               approve.TweleEmi__c =  ((approve.Eleventh_Month_Balanace__c - approve.Monthly_EMI__c ) *  (approve.Interest__c/12))/100 ;
             approve.tweleBalance__c = approve.Monthly_EMI__c - approve.TweleEmi__c;
             approve.Twelth_Month_Balance__c= approve.Eleventh_Month_Balanace__c - approve.tweleBalance__c;
              
                
                
                approve.Total_Interst__c = (approve.firstIntrest__c + approve.secondEmi__c + approve.thirdEmi__c + approve.forthEmi__c + approve.fifthEmi__c +
                                           approve.SixthEmi__c + approve.seventhEmi__c + approve.eighthEmi__c + approve.ninthEmi__c + approve.tenthEmi__c
                                           + approve.elevenEmi__c + approve.TweleEmi__c);
                
                approve.Total_Payment__c = approve.Total_Loan_Amount__c + approve.Total_Interst__c;
         
                app.add(approve);
            }
            }
        system.debug(app);
        if(app.size()>0){
            insert app;
        }
    }*/

}