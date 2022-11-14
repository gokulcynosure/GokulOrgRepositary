public class Accounttriggerhandler1 {
    public static void insertContact(List<Account>accList){
        List<Contact>conList=new List<Contact>();
        for(Account acc:accList){
            Contact con=new Contact();
            con.lastname=acc.name;
            con.phone=acc.phone;
            con.accountid=acc.id;
            conList.add(con);
        }
        if(conList.size()>0){
            insert conList;
        }
    }

}