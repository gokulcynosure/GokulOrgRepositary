public class NameGenderFinder {
    public static Integer apiCallOut = 0;
    @future(callout=true)
    public static void findAndSaveGenderForMultipleContacts(List<Id> contactIds){
        
        system.debug('msg from apex class');
        
        List<Contact> contacts = [SELECT Id, FirstName, Gender__c FROM Contact WHERE Id IN :contactIds];
        Set<String> NonDuplicate = new Set<String>();
        List<Contact> toBeUpdatedContacts = new List<Contact>();
        Map<String,String> nameWithGender = new Map<String,String>();
        
        for(Contact loopContactVariable : contacts) {
            
            if(NonDuplicate.contains(loopContactVariable.FirstName)){
                loopContactVariable.Gender__c = nameWithGender.get(loopContactVariable.FirstName);
            }Else{
                NonDuplicate.add(loopContactVariable.FirstName);
                
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndpoint('https://api.genderize.io/?name=' + loopContactVariable.FirstName);
                
                
                HttpResponse resp = h.send(req);
                system.debug('responce'+resp);
                Integer statusCode = resp.getStatusCode();
                System.debug('statusCode :' + statusCode);
                String body = resp.getBody();
                System.debug('body :' + body);
                
                Gender gen = (Gender) JSON.deserialize(resp.getBody(), Gender.class);
                
                
                loopContactVariable.Gender__c = gen.gender;
                nameWithGender.put(loopContactVariable.FirstName,loopContactVariable.Gender__c);
                apiCallOut ++;
                
            }
        }
        
        update contacts;
    }
    
    @future(callout=true)
    public static void findAndSaveCountryCodeContacts(List<Id> contactIds){
        
        List<Contact> contacts = [SELECT Id, FirstName, Gender__c FROM Contact WHERE Id IN :contactIds];
        Set<String> NonDuplicate = new Set<String>();
        Map<String,String> nameWithCode = new Map<String,string>();
        
        
        for(Contact loopContactVariable : contacts) {
            
            if(NonDuplicate.contains(loopContactVariable.FirstName)){
                loopContactVariable.Country_Code__c = nameWithCode.get(loopContactVariable.FirstName);
            }
            ELSE{
                NonDuplicate.add(loopContactVariable.FirstName);
                
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndpoint('https://api.nationalize.io/?name=' + loopContactVariable.FirstName);
                
                
                HttpResponse resp = h.send(req);
                system.debug('responce'+resp);
                Integer statusCode = resp.getStatusCode();
                System.debug('statusCode :' + statusCode);
                String body = resp.getBody();
                System.debug('body :' + body);
                
                
                countries idWithProbability = (countries) JSON.deserialize(resp.getBody(), countries.class);
                Decimal highestValue;
                String countryId;
                
               for(countryCode cc :  idWithProbability.country){
                    if(highestValue == NULL){
                        highestValue = cc.probability;
                        countryId = cc.country_id;
                    }ELSE{
                        if(highestValue < cc.probability){
                            highestValue = cc.probability;
                            countryId = cc.country_id;
                        }
                    }
                }
                system.debug('highValue'+highestValue);
                system.debug('id'+ countryId);
                
                
                loopContactVariable.Country_Code__c = countryId;
                nameWithCode.put(loopContactVariable.FirstName,loopContactVariable.Country_Code__c);
            }
        }
        update contacts;   
    }
    
    public class countries{
        public List<countryCode> country;
    }
    
    
    
    Public class countryCode{
        public string country_id;
        public DECIMAL probability;
        
    }
    
    public class Gender {
        public String gender;
    }
}