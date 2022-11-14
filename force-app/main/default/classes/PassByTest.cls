@IsTest
public class PassByTest {
 @IsTest
  static void  testMultiplyByPi(){
        Double a = 25;
        Double val=passBy.multiplyByPi(a);
        system.debug(val);
      system.assertEquals(78.5, val);
    }

    @IsTest
    static void testSubString(){
        String a = 'cynosreQuest';
        String val = passBy.subString(a);
        system.assert(true,val.contains('y'));
   }
    
    @IsTest
    static void testAddStringToSet(){
    set<String> str =  new Set<String>();
    str.add('coimabatore');
    str.add('CynosureQuest');
    Set<String> Val = passBy.addStringToSet(str);
    system.assert(true,val.contains('Gokul'));
    }
}