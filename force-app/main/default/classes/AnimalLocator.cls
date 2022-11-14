public class AnimalLocator {

    public static string getAnimalNameById(Integer i){
        Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+i);
        
        HttpResponse res = h.send(req);
        System.debug('res :' + res);
        Integer statusCode = res.getStatusCode();
        System.debug('statusCode :' + statusCode);
		String body = res.getBody();
        System.debug('body :' + body);
        
        names n = (names) Json.deserialize(body, names.class);
        String a =  n.animal.name;
        return a;
        
    }
    
    public class names{
        Public animals animal;
    }
    public class animals{
        public string name;
    }
}