@isTest
public class classHelperTest {
    static testmethod void evenNumber(){
        classHelper helper=new classHelper();
        boolean result=helper.evenNumber(5,true,false);
        system.assert(result);
    }

}