public class ContactTriggerHandler EXTENDS TriggerHandler {
    public static Set<Contact> listOfContacts = new Set<Contact>();  
    public static Map<Id,String> persons = new Map<Id,String>();
    public static Integer loopCount ;
    public static List<Id> ids = new List<Id>();
    public static  List<String> genderLst = new List<String>();
    public static List<String> firstNames = new List<String>();
    public static Set<Contact> cv = new Set<Contact> ();
    
    
    
    @Future  (callout = true)
    public static void afterInsert(Set<Id>conId){
        
        /* Query the contact using id
* Get The first Name Of that contact and store into 1 String Variable
* In Http Request set end point url using firstName string variable
* Get the responce
* Find & Store the Gender value into one string variable
* Update Gender__C  string variable In That Contact.
* */
        
        
        
    List<Contact> contacts = [Select id,firstName from Contact where id IN :conId];
    Integer contactsSize = contacts.size();
        
        for(Contact fName : contacts){
            firstNames.add(fName.firstName);
            ids.add(fName.id);
            loopCount = 0;
            
        }
        	system.debug('ids'+ids);
        
        for(String name : firstNames){
           
           
            
            Http h = new Http();
            
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setEndpoint('https://api.genderize.io/?name='+name);
            
            
            HttpResponse res = h.send(req);
            System.debug('res :' + res);
            Integer statusCode = res.getStatusCode();
            System.debug('statusCode :' + statusCode);
            String body = res.getBody();
            System.debug('body :' + body);
            
            PersonGender pg = (PersonGender) JSON.deserialize(body, PersonGender.class);
            
            genderLst.add(pg.gender);
            system.debug('pgList'+ genderLst);
            persons.put(ids.get(loopCount),genderLst.get(loopCount));
            
            updateGender(conId,persons,loopCount,contactsSize);
            loopCount ++;
        
        }
        system.debug('map'+ persons);
        loopCount = contactsSize;
        system.debug(loopCount);
        updateGender(conId,persons,loopCount,contactsSize);
        
        
        
        
    }
    public static void updateGender(Set<Id>conId,Map<Id,string>persons,Integer loopCount,Integer cotactsSize){
        List<Contact> contactToUpdate = [Select id,Gender__c From Contact where id in : conId];
        
        system.debug('map'+persons);
        Set<Id> Ids = persons.keySet();
        
        if(loopCount != cotactsSize){
          for(Contact cc : contactToUpdate){
                for(Id i: Ids){
                    if(i == cc.id){
                        cc.Gender__c = persons.get(i);
                        
                    }
              }
                system.debug('Loop'+ loopCount);
                system.debug('size'+ cotactsSize);
                
                loopCount = loopCount +1;
                cv.add(cc);    
                
            }
            	listOfContacts.addAll(cv) ;
            
        }Else{
           	system.debug(listOfContacts);
            	for(Contact coo : listOfContacts ){
                	update coo;
            }
        }
   }
    
    
    public Class PersonGender{
        Public String gender;
    }
}