public class ContactHelper Extends TriggerHandler {

    protected override void afterInsert() {
        List<Id> contactIds = new List<Id>();
        for(Contact con : (List<Contact>) Trigger.new) {
            
            contactIds.add(con.Id);
        }
        
       // NameGenderFinder.findAndSaveCountryCodeContacts(contactIds);
        
        NameGenderFinder.findAndSaveGenderForMultipleContacts(contactIds);
    }
}