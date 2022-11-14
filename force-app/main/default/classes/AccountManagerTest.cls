@IsTest
private class AccountManagerTest {

    @isTest
    static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account a = AccountManager.getAccount();
        // Verify results
        System.assert(a != null);
        system.debug('a'+a);
        System.assertEquals('Test Record', a.Name);
    }
    static Id createTestRecord() {
        // Create test record
        Account AccountTest = new Account(
            Name='Test Record');
        insert AccountTest;
        return AccountTest.Id;
    }     
}