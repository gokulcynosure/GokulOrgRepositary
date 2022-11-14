public class AnimalLocatorMock implements HttpCalloutMock{

    public HttpResponse respond(HttpRequest req){
       HttpResponse res = new HttpResponse();
       res.setStatus('OK');
       res.setStatusCode(200);
        res.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        
        return res;

}
}