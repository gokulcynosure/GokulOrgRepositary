@IsTest
public class VisitBatchChildTest {

    @IsTest
    static void check(){
       List<Account> accList = new List<Account>();
        Account acc = new Account ();
        acc.Name = 'Test100';
        accList.add(acc);
        
        Account acc2 = new Account();
        acc2.Name = 'Test101';
        accList.add(acc2);
        
        Insert accList;
        
        
        List<Visit__c> vstList = new List<Visit__c>();
     
    // -------------- This is for first Account -----------------------//   
        Visit__c visit1 = new Visit__c();
        visit1.Name = 'Test1';
        visit1.Account__c = accList.get(0).id;
        visit1.Visit_Date__c = Date.today();
        vstList.add(visit1);
        
        Visit__c visit2 = new Visit__c();
        visit2.Name = 'Test2';
        visit2.Account__c = accList.get(0).id;
        visit2.Visit_Date__c = Date.today();
        vstList.add(visit2);
        
        Visit__c visit3 = new Visit__c();
        visit3.Name = 'Test3';
        visit3.Account__c = accList.get(0).id;
        visit3.Visit_Date__c = Date.today()+5;
        vstList.add(visit3);
        
        Visit__c visit4 = new Visit__c();
        visit4.Name = 'Test4';
        visit4.Account__c = accList.get(0).id;
        visit4.Visit_Date__c = Date.today()+10;
        vstList.add(visit4);
        
        // -------------- This is for second Account -----------------------//
        Visit__c visit5 = new Visit__c();
        visit5.Name = 'Test5';
        visit5.Account__c = accList.get(1).id;
        visit5.Visit_Date__c = Date.today();
        vstList.add(visit5);
        
        Visit__c visit6 = new Visit__c();
        visit6.Name = 'Test6';
        visit6.Account__c = accList.get(1).id;
        visit6.Visit_Date__c = Date.today();
        vstList.add(visit6);
        
        Insert vstList;
        
        test.startTest();
           VisitBatchChild v =  new VisitBatchChild();
        	database.executeBatch(v);
        test.stopTest();
        
        
        List<Visit__c> visits = [Select id,Name,Account__c From Visit__c];
        system.assertEquals(4, visits.size(), 'There is only 4 records');
    }
}