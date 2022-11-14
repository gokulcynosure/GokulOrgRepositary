@RestResource(urlMapping='/Accounts/*')
global class AccountManager {
	@HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        system.debug('req'+ request.requestURI);
        // grab the AccountId from the end of the URL
        String accId = request.requestURI;
        
      accId=  accId.substringAfter('Accounts/');
        system.debug(accId);
        if(accId.length() != 18){
            accId = accId.remove('/contacts');
        }
    
        system.debug('id'+accId);
        Account a = [Select id,Name,(select id,Name from Contacts) from Account where Id = :accId];
        system.debug(a);
        
        return a;
    }
}