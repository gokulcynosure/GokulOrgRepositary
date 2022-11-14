public class CreateContactsAPI {
    
    public static void createContactsFromApi(Integer a){
        List<Contact> contactsList = new List<Contact>();
        
        for(Integer i = 0 ; i<a ; i++){
            
            String callOutResponce = invokeApiAndReturnResponce();
            contactDetails convertedResponce = convertResponceIntoObject(callOutResponce);
            Contact newContact = fetchTheResponceAndCreateContactUsingResponce(convertedResponce);
            contactsList.add(newContact);
        }
        Insert contactsList;
        
    }
    
    private static string invokeApiAndReturnResponce(){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(' https://randomuser.me/api/');
        
        HttpResponse res = h.send(req);
        System.debug('res :' + res);
        Integer statusCode = res.getStatusCode();
        System.debug('statusCode :' + statusCode);
        String body = res.getBody();
        System.debug('body :' + body);
        
        return body;
    }
    private static contactDetails convertResponceIntoObject(String callOutResponce){
        contactDetails cc = (contactDetails) Json.deserialize(callOutResponce,contactDetails.class);
        
        return cc;
    }
    private static contact fetchTheResponceAndCreateContactUsingResponce(contactDetails convertResponce){
        Contact con = new contact();
        
        for(personalDetails pc : convertResponce.results){
            con.Gender__c = pc.gender;
            con.Phone = pc.phone;
            con.firstName = pc.name.first;
            con.lastName = pc.name.last;
            con.title = pc.name.title;
            con.MailingCity = pc.location.city;
            con.MailingState = pc.location.state;
            con.MailingCountry = pc.location.country;
            con.MailingStreet = pc.location.street.name;
            con.MailingPostalCode = pc.location.postcode;
        } 
        return con;
        
    }
    
    public class contactDetails{
        public List < personalDetails > results;
        
    }
    public class personalDetails{
        public  string gender;
        public nameDetails name;
        public string phone;
        public addressInformation location;
        
    }
    public class addressInformation{
        public streetDetails street;
        public string city;
        public string state;
        public string country;
        public string postcode;
    }
    public class nameDetails{
        public string first;
        public string last;
        public string title;
    }
    
    public class streetDetails{
        public string name;
    }
    
}