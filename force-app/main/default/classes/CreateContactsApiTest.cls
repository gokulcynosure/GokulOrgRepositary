@IsTest
public class CreateContactsApiTest {

    @IsTest
    static void testContactsCreatedOrNot(){
        //Given
        Integer contactsNeedToBeInserted = 100;
        List<Contact> oldContactList = [Select id from Contact];
        Integer count = oldContactList.size();
        system.debug('oldCount'+ count);
        
        
        Test.setMock(HttpCalloutMock.class,new CreateContactMock());
        
		//when
        Test.startTest();
        CreateContactsAPI.createContactsFromApi(contactsNeedToBeInserted);
        Test.stopTest();
        
        // Finish
        List<Contact> newContactList = [Select id from Contact];
        system.assertEquals(count + contactsNeedToBeInserted, newContactList.size() , 'New Contacts are Inserted');
        system.debug('newCount'+ newContactList.size());
    }
}