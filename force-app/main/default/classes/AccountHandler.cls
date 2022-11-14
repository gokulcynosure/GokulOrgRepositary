public class AccountHandler {

    public static Account insertNewAccount(String acc){
        try{
        Account ac = new Account();
        ac.Name = acc;
        
        Insert ac;
        return ac;
        }
        Catch(Exception ex){
            return null;
        }
        
        
    }
}