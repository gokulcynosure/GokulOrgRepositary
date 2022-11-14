@isTest
public class calculateTest {
    @isTest
   public  static void testevenNumber(){
        calculate helper=new calculate();
       boolean result1=helper.evenNumber(10);
       boolean result2=helper.evenNumber(9);
       system.assertEquals(true,result1);
       system.assertEquals(false,result2);
              

}
}