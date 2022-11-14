@RESTResource(urlmapping='/CreateLead12/')
global class lead {
    @HTTPPost
    global static  string method()
    {
        string fname,lname,comp;
        string fieldname,fieldvalue;
        List <String> leadlist=new String [3];
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        System.debug('Param is:'+req.params);
        System.debug('Param is:'+req.params);
     String jsonbody = req.requestBody.tostring();
        JSONparser parser = JSON.createParser(jsonbody);
        
        while(parser.nextToken()!=NULL)
        {
            if(parser.nextToken()!= JSONToken.END_OBJECT)
            {
                parser.nextValue();
               fieldname = parser.getCurrentName();
               fieldvalue =parser.getText();
                if(fieldname == 'FirstName'){
                    fname =parser.getText();
                }
               else if(fieldname == 'LastName'){
                    lname =parser.getText();
                }
                if(fieldname == 'CompanyName'){
                    comp =parser.getText();
                }
            }
        }
        Account Le = new Account(Name = fname,AccountNumber = lname,Website = comp);
        insert Le;
        return Le.ID;
    }
}