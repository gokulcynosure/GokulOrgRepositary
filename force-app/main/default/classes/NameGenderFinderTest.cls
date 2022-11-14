@IsTest
public class NameGenderFinderTest {

   /* @IsTest
    static void findAndSaveGenderForSingleContact_SuccessfulResponse() {
        // Given
        List<Id> conIds = new List<Id>();
		Contact con = new Contact();
        con.FirstName = 'Virat';
        con.LastName = 'Kohli';
        insert con;
        conIds.add(con.id);
        
        String expectedGender = 'Male';
        NameGenderFinderMock mock = new NameGenderFinderMock();
        mock.isError = false;
        
        Test.setMock(HttpCalloutMock.class, mock);
        
        // When
        Test.startTest();
		NameGenderFinder.findAndSaveGenderForMultipleContacts(conIds);
        Test.stopTest();
        
        // Then
        Contact conAgain = [SELECT Id, Gender__c FROM Contact WHERE Id = :con.Id ];
        System.assertEquals(expectedGender, conAgain.Gender__c, 'Gender response must be equal to the one from API');
        
    }
    
    @isTest
    static void findAndSaveGenderForSingleContact_FailureResponse() {
        // Given
        List<Id> conIds = new List<Id>();
		Contact con = new Contact();
        con.FirstName = 'Virat';
        con.LastName = 'Kohli';
        insert con;
        conIds.add(con.id);
        
        NameGenderFinderMock mock = new NameGenderFinderMock();
        mock.isError = true;
        
        Test.setMock(HttpCalloutMock.class, mock);
        
        // When
        Test.startTest();
		NameGenderFinder.findAndSaveGenderForMultipleContacts(conIds);
        Test.stopTest();
        
        // Then
 		Contact conAgain = [SELECT Id, Gender__c FROM Contact WHERE Id = :con.Id];
        System.assertEquals(null, conAgain.Gender__c, 'Gender must be null as API failed');
    }*/
    @IsTest
    static void findAndSaveGenderForListOfContacts_SuccessfulResponse(){
        // Given
        List<Id> conIds = new List<Id>();
        List<Contact> contactsList = new List<Contact>();
		Contact con = new Contact();
        con.FirstName = 'Virat';
        con.LastName = 'Kohli';
        conIds.add(con.id);
        contactsList.add(con);
        
        Contact con1 = new Contact();
        con1.FirstName = 'Rohit';
        con1.LastName = 'Sharma';
        conIds.add(con1.id);
        contactsList.add(con1);
        
        Contact con2 = new Contact();
        con2.FirstName = 'Smrity';
        con2.LastName = 'Mandhana';
        conIds.add(con2.id);
        contactsList.add(con2);
        
        Insert contactsList;
        String ExpectedGender = 'Male';
        
        NameGenderFinderMock mock = new NameGenderFinderMock();
        mock.isError = false;
        
        Test.setMock(HttpCalloutMock.class, mock);
        
          // When
        Test.startTest();
		NameGenderFinder.findAndSaveGenderForMultipleContacts(conIds);
        Test.stopTest();
       
        
        // Then
       Contact  conn = [SELECT Id, Gender__c FROM Contact WHERE Id = :con.Id ];
      System.assertEquals(ExpectedGender, conn.Gender__c, 'Gender response must be equal to the one from API');
    }
    
     @IsTest
    static void findAndSaveGenderForListOfContacts_FailureResponse(){
        // Given
        List<Id> conIds = new List<Id>();
        List<Contact> contactsList = new List<Contact>();
		Contact con = new Contact();
        con.FirstName = 'Virat';
        con.LastName = 'Kohli';
        conIds.add(con.id);
        contactsList.add(con);
        
        Contact con1 = new Contact();
        con1.FirstName = 'Rohit';
        con1.LastName = 'Sharma';
        conIds.add(con1.id);
        contactsList.add(con1);
        
        Contact con2 = new Contact();
        con2.FirstName = 'Smrity';
        con2.LastName = 'Mandhana';
        conIds.add(con2.id);
        contactsList.add(con2);
        
        Insert contactsList;
        String ExpectedGender = 'Male';
        
        NameGenderFinderMock mock = new NameGenderFinderMock();
        mock.isError = true;
        
        Test.setMock(HttpCalloutMock.class, mock);
        
          // When
        Test.startTest();
		NameGenderFinder.findAndSaveGenderForMultipleContacts(conIds);
        Test.stopTest();
       
        
        // Then
       Contact  conn = [SELECT Id, Gender__c FROM Contact WHERE Id = :con.Id ];
      System.assertEquals(null, conn.Gender__c, 'Gender response must be equal to the one from API');
    }
    
    @IsTest
    static void findApiCallOutCountByGivingDuplicateName(){
         // Given
        List<Id> conIds = new List<Id>();
        List<Contact> contactsList = new List<Contact>();
		Contact con = new Contact();
        con.FirstName = 'Virat';
        con.LastName = 'Kohli';
        conIds.add(con.id);
        contactsList.add(con);
        
        Contact con1 = new Contact();
        con1.FirstName = 'Dhoni';
        con1.LastName = 'Kholi';
        conIds.add(con1.id);
        contactsList.add(con1);
        
        Contact con2 = new Contact();
        con2.FirstName = 'Smrity';
        con2.LastName = 'Mandhana';
        conIds.add(con2.id);
        contactsList.add(con2);
        
        Insert contactsList;
        String ExpectedGender = 'Male';
        
        NameGenderFinderMock mock = new NameGenderFinderMock();
        mock.isError = false;
        
        Test.setMock(HttpCalloutMock.class, mock);
        
          // When
        Test.startTest();
		NameGenderFinder.findAndSaveGenderForMultipleContacts(conIds);
        Test.stopTest();
       
        
        // Then
       System.assertEquals(3,NameGenderFinder.apiCallOut,'if Duplicate name find avoid callOut');
    }
}