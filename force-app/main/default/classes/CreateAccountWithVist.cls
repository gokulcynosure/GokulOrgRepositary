@RESTResource(urlmapping='/CreateAccountWithVisit/')
global class CreateAccountWithVist {
    
    @HTTPPost
    global static OutputReturn createAccountsWithVisit(List<AccountDetails> result){
        List<Account> accountList = new List<Account>();
        List<Visit__c> visitList = new List<Visit__c>();
        List<Id> listOfaccountIds = new List<Id>();
        List<Id> listOfVisitIds = new List<Id>();
        Try{
            for(AccountDetails ad : result){
                Account a = new Account();
                a.Name = ad.accountName;
                a.Phone = ad.phone;
                accountList.add(a);
            }
            
            Insert accountList;
            
            for(Account ac : accountList){
                listOfaccountIds.add(ac.id);
            }
            Integer accountSize = accountList.size();
            Integer visitCount = 0;
            
            
            for(AccountDetails ad : result){
               String accId = accountList.get(visitCount).id; 
                if(ad.visits != NULL){
                    for(VisitDetails vs : ad.visits){
                        //if(visitCount <= accountSize){
                            Visit__c visit = new Visit__c();
                            visit.Name = vs.visitName;
                            visit.Visit_Date__c = vs.visitDate;
                            visit.Account__c = accId;
                            visitList.add(visit);
                            
                        
                    }
                   
                }
                 visitCount ++;
            }
            Insert visitList;
            
            for(Visit__c v1 : visitList){
                listOfVisitIds.add(v1.id);
            }
            OutputReturn o1 = new OutputReturn();
            o1.accountIds = new List<String>();
            o1.visitIds = new List<String>();
            o1.accountIds.addAll(listOfaccountIds);
            o1.visitIds.addAll(listOfVisitIds);
            return o1;
        }
        Catch(Exception ex){
            OutputReturn o = new OutputReturn();
            o.error = new List<String>();
            o.error.add(ex.getMessage());
            return o;
        }
        
    }
    
    global Class OutputReturn {
        global List<String> accountIds;
        global List<String> visitIds;
        global List<String> error;
    }
    global Class AccountDetails{
        global string accountName;
        global string phone;
        global List<VisitDetails> visits;
    }
    global class VisitDetails{
        global Date visitDate;
        global string visitName;
    }
}