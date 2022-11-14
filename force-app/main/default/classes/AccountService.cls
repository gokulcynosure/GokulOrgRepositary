@RestResource(urlMapping='/AccountService/*')
global class AccountService{
@HttpGet
    global static List <Account> getAccount() {
        List <Account> acc;
       

        acc = [SELECT Id,Name from Account];

        return acc;
        
     
}
   
}