@IsTest
public class OpportunityTriggerhandlerTest {

   
 /*@IsTest
    static void testInitialValue() {
        // Given
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        
        // When
        insert opp;
        System.debug('opp Id:' + opp.Id);
        
        // Then
        Opportunity opty = [SELECT Id, Amount FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals(0, opty.Amount, 'Initially amount should be 0');
    }
    
    @IsTest
    static void testStageNameChangeOnce() {
        // Given that there is an opportunity in the database already
        // and we are changing the stagename of that opportunity
        // then the amount should be incremented by 1000.
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Amount = 3000;
        insert opp;
        
        // When
        opp.StageName = 'Needs Analysis';
        update opp;
        
        // Then
        Opportunity opty = [SELECT Id, Amount FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals(4000, opty.Amount, '1000 should be added to existing amount value, which is 3000');
    }
    
    @IsTest
    static void testStageNameChangeTwice() {
        // Given that there is an opportunity already in the database
        // and we are changing the stagename of that opportunity
        // two times. Then the amount should be incremented by 2000.
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Amount = 3000;
        insert opp;
        
        // When
        opp.StageName = 'Needs Analysis';
        update opp;
        
        Opportunity opty = [SELECT Id, Amount FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals(4000, opty.Amount, '2000 should be added to existing amount value, which is 3000');
        system.debug(opty.Amount);
        
       opty.StageName = 'Value Proposition';
        update opty;
        
        
        Opportunity opt = [SELECT Id, Amount FROM Opportunity WHERE Id = :opty.Id];
        System.assertEquals(5000, opt.Amount, '2000 should be added to existing amount value, which is 3000');
    }
    
    @IsTest
    static void testSomethingElseChanged() {
        // Given that there is an opportunity already in the databbase
        // and we are changing the close date
        // and not changing the stagename
        // then amount should not change
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Amount = 3000;
        insert opp;
        
        // When
        opp.CloseDate = Date.today() + 2;
        update opp;
        
        // Then
        Opportunity opty = [SELECT Id, Amount FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals(3000, opty.Amount, 'nothing should be added to existing amount value, which is 3000');
    }
*/    
     @IsTest
    static void testShouldNotChangeWhenOptyChildIsInserted(){
        // Given
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'something';
        opp1.StageName = 'Prospecting';
        opp1.CloseDate = System.today();
        insert opp1;
        
        // When
		OpportunityChildren__c child = new OpportunityChildren__c();
		child.Opportunity__c = opp1.Id;
        insert child;
        
        // Then
        OpportunityChildren__c childAgain = [SELECT Id, Amount__c FROM OpportunityChildren__c WHERE Id = :child.Id];
		System.assertEquals(NULL, childAgain.Amount__c, 'Child amount is not 0');
    }
    
    @isTest
    static void testupdatesSomethingChangeChildAmountNotChange(){
         Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity50';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        insert opp;
        
        OpportunityChildren__c child = new OpportunityChildren__c();
        child.Opportunity__c =opp.id;
        child.Name ='Gokul';
        child.Amount__c = 0;
        Insert child;
        
        opp.CloseDate = Date.today() + 2;
        update opp;
        
        OpportunityChildren__c children =[Select id,Name,Opportunity__c, Amount__c from OpportunityChildren__c where Opportunity__c =:opp.id];
        system.assertEquals(0, children.Amount__c);
    }
    
    @isTest
    static void updateAmountChildShuldChange(){
         Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity5000';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        insert opp;
        
        OpportunityChildren__c child = new OpportunityChildren__c();
        child.Opportunity__c =opp.id;
        child.Name ='Arun';
        
        Insert child;
        
         
        
        opp.Amount = 500;
        update opp;
        
        OpportunityChildren__c children =[Select id,Name,Opportunity__c, Amount__c from OpportunityChildren__c where Opportunity__c =:opp.id];
        system.assertEquals(200, children.Amount__c);
    }
    
    @IsTest
    static void updateMultipleChildrenAmount(){
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity1000';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        insert opp;
        
        OpportunityChildren__c child1 = new OpportunityChildren__c();
        child1.Opportunity__c =opp.id;
        child1.Name ='Arun';
        child1.Amount__c = 0;
        Insert child1;
        
        OpportunityChildren__c child2 = new OpportunityChildren__c();
        child2.Opportunity__c =opp.id;
        child2.Name ='Arun';
        child2.Amount__c = 0;
        Insert child2;
        
         
        
        opp.Amount = 1500;
        update opp;
        
        List<OpportunityChildren__c> children =[Select id,Name,Opportunity__c, Amount__c from OpportunityChildren__c where Opportunity__c =:opp.id];
        OpportunityChildren__c chil = children.get(1);
        system.assertEquals(200, chil.Amount__c);
        
    }
    
     @IsTest
    static void updateMultipleOpportunityChildrenAmount(){
        Opportunity opp = new Opportunity();
        opp.Name = 'Test1';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        insert opp;
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'Test2';
        opp1.StageName = 'Prospecting';
        opp1.CloseDate = Date.today();
        insert opp1;
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test3';
        opp2.StageName = 'Prospecting';
        opp2.CloseDate = Date.today();
        insert opp2;
        
        OpportunityChildren__c child1 = new OpportunityChildren__c();
        child1.Opportunity__c =opp.id;
        child1.Name ='Arun';
        child1.Amount__c = 0;
        Insert child1;
        
        OpportunityChildren__c child2 = new OpportunityChildren__c();
        child2.Opportunity__c =opp1.id;
        child2.Name ='Kumar';
        child2.Amount__c = 0;
        Insert child2;
        
        OpportunityChildren__c child3 = new OpportunityChildren__c();
        child3.Opportunity__c =opp2.id;
        child3.Name ='Kumar';
        child3.Amount__c = 0;
        Insert child3;
        
         
        
        opp2.Amount = 1500;
        update opp2;
        
        List<OpportunityChildren__c> children =[Select id,Name,Opportunity__c, Amount__c from OpportunityChildren__c where Opportunity__c =:opp2.id];
        OpportunityChildren__c chil = children.get(0);
        system.assertEquals(200, chil.Amount__c);
        
    }
}