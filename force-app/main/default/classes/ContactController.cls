public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT Id, Name, Email, Birthdate,Account.Industry 
            FROM Contact
            
        ];
    }
}