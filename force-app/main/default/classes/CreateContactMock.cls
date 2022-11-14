public class CreateContactMock implements HttpCalloutMock{

    public HttpResponse respond(HttpRequest req){
       HttpResponse res = new HttpResponse();
       res.setStatus('OK');
       res.setStatusCode(200);
       res.setBody('{"results":[{"gender":"male","name":{"title":"Mr","first":"Snizhan","last":"Makoterskiy"},"location":{"street":{"number":1881,"name":"Krivorizka"},"city":"Romni","state":"Mikolayivska","country":"Ukraine","postcode":30159,"coordinates":{"latitude":"76.0797","longitude":"-154.0879"},"timezone":{"offset":"-12:00","description":"Eniwetok, Kwajalein"}},"email":"snizhan.makoterskiy@example.com","login":{"uuid":"d8037b93-e3fc-4f16-b7fb-d3905a0b5492","username":"yellowpanda844","password":"iceberg","salt":"3p7U0hzT","md5":"b6e1416256331dda2a405ae171c045fa","sha1":"edeb64af7c6948349ed54684a19f9fc0dc972f5b","sha256":"fcc694ba7dfff49ae04cec42c12be6b56d6f589693ee974ba5bd01bc29159564"},"dob":{"date":"1955-12-01T20:45:58.348Z","age":66},"registered":{"date":"2013-09-04T04:59:27.770Z","age":9},"phone":"(068) Q07-3251","cell":"(096) G09-6265","id":{"name":"","value":null},"picture":{"large":"https://randomuser.me/api/portraits/men/4.jpg","medium":"https://randomuser.me/api/portraits/med/men/4.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/4.jpg"},"nat":"UA"}],"info":{"seed":"67b402ea56012cc6","results":1,"page":1,"version":"1.4"}}');
        
       return res;
    }
}