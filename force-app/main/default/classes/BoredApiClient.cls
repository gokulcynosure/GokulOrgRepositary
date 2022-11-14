public class BoredApiClient {

    public  void getActivity() {
		Http h = new Http();
        String a = 'activity';
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://www.boredapi.com/api/'+a);
        
        HttpResponse res = h.send(req);
        System.debug('res :' + res);
        Integer statusCode = res.getStatusCode();
        System.debug('statusCode :' + statusCode);
		String body = res.getBody();
        System.debug('body :' + body);
    
        
		Activity acc = (Activity) JSON.deserialize(body, Activity.class);
        System.debug('Activity : ' + acc);
        storeActivity(acc.activity, acc.type,acc.participants,acc.price,acc.link,acc.key,acc.accessibility);
    }
    
    public  void storeActivity(String activity, string type,Integer participants,Decimal price,String link,Integer key,Decimal accessibility) {
        
        Activity__c acc = new Activity__c();
        acc.Name = activity;
        acc.Type__c = type;
        acc.Participants__c = participants;
        acc.Price__c = price;
        acc.Link__c = link;
        acc.Key__c = key;
        acc.accessibility__c = accessibility;
        
        insert acc;
    }
    
    
    public class Activity {
        public String activity;
        public String type;
        public Integer participants;
      	public  Decimal price;
      	public  String link;
     	public   Integer key;
      	public  Decimal accessibility;
        
    }
    
   
}