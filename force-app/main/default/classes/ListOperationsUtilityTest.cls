@IsTest
public class ListOperationsUtilityTest {
   /*@IsTest
   static void testUnion() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
        firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        
        List<Integer> result = ListOperationsUtility.Union(firstList, secondList);
        system.assertEquals(true,result.contains(12));
        system.assertEquals(false,result.contains(9000));
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testIntersection() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getIntersection(firstList, secondList);
         system.assertEquals(true,result.contains(1));
        system.assertEquals(false,result.contains(10));
        System.debug('@@@@@ Result @@@@ '+result);
        
    }
    @IsTest
    static void testgetValuesInFirstButNotInSecond() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getValuesInFirstButNotInSecond(firstList, secondList);
         system.assertEquals(true,result.contains(12));
        system.assertEquals(false,result.contains(1));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testgetRepeatedValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(10);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getRepeatedValues(firstList, secondList);
         //system.assertEquals(true,result.contains(12));
        //system.assertEquals(false,result.contains(1));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetValuesInSecondButNotInFirst() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getValuesInSecondButNotInFirst(firstList, secondList);
         system.assertEquals(true,result.contains(105));
        system.assertEquals(false,result.contains(1));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetAllOddValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getAllOddValues(firstList, secondList);
         system.assertEquals(true,result.contains(1));
        system.assertEquals(false,result.contains(12));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetAllEvenValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        List<Integer> result = ListOperationsUtility.getAllEvenValues(firstList, secondList);
         system.assertEquals(true,result.contains(12));
        system.assertEquals(false,result.contains(147));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest    
    static void testgetSumOfAllEvenValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        Integer Val = ListOperationsUtility.getSumOfAllEvenValues(firstList, secondList);
        System.assertEquals(214,Val);
        System.debug('@@@@@ Result @@@@ '+Val);
    }
     @IsTest    
    static void testgetSumOfAllOddValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        Integer Val = ListOperationsUtility.getSumOfAllOddValues(firstList, secondList);
         system.assertEquals(393,Val);
        
        System.debug('@@@@@ Result @@@@ '+Val);
        
    }
   @IsTest    
    static void testgetSumOfAllMultiplesOfThreeValues() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
         firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(105);
        secondList.add(147);
        secondList.add(129);
        secondList.add(178);

        Integer Val = ListOperationsUtility.getSumOfAllMultiplesOfThreeValues(firstList, secondList);
        system.assertEquals(Val,400);
        System.debug('@@@@@ Result @@@@ '+Val);
    }*/

    @IsTest
    static void testAddinList() {
        List<Integer> firstList = new List<Integer>();
        
        firstList.add(0);
        firstList.add(15);
        firstList.add(30);
        
        List<Integer> result = ListOperationsUtility.add(firstList);
        
        System.assertEquals(true,result.contains(30));
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testAddinListWithIndex() {
        List<Integer> firstList = new List<Integer>();
        
        firstList.add(0);
        firstList.add(15);
        firstList.add(30);
        
        List<Integer> result = ListOperationsUtility.addWithIndex(firstList);
        
        System.assertEquals(true,result.contains(30));
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testAddAll(){
       List<string> first = new List<string>();
       List<string> second = new List<string>();
       first.add('Gokul');
        first.add('Coimbatore');

        second.add('Cynosure Quest');
        second.add('Employee Number : CQ002');
        
       List <string> result = ListOperationsUtility.addAllInList(first,second);
      //  System.assertEquals(true,result.contains('Cynosure Quest'));
        system.debug('@@@@007@@@'+result);

        
    }
    @IsTest
    static void testClear(){
       List<string> a = new List<string>();
        
        a.add('Gokul');
        a.add('Coimbatore');

       List<string> result =ListOperationsUtility.clear(a);
        System.assertEquals(false,result.contains('Gokul'));
        system.debug('@@@@007@@@'+result);

        
    }
    @IsTest
    static void testClone(){
       List<string> a = new List<string>();
        
        a.add('Gokul');
        a.add('Coimbatore');

       List<string> result =ListOperationsUtility.clone(a);
        System.assertEquals(true,result.contains('Gokul'));
        system.debug('Clone List'+result);

        
    }
    @IsTest
    static void testEqualls() {
        List<Integer> firstList = new List<Integer>();
        List<Integer> secondList = new List<Integer>();
        firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        secondList.add(1);
        secondList.add(10);
        secondList.add(14);
        secondList.add(12);
        secondList.add(17);

        
        boolean result = ListOperationsUtility.getEqualls(firstList, secondList);
        system.assertEquals(true,result);
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }

    @IsTest
    static void testget() {
        List<Integer> firstList = new List<Integer>();
        
        firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

       

        
       Integer result = ListOperationsUtility.getIndex(firstList);
       system.assertEquals(14,result);
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testIssize() {
        List<Integer> firstList = new List<Integer>();
        
        firstList.add(1);
        firstList.add(10);
        firstList.add(14);
        firstList.add(12);
        firstList.add(17);

        
        
        List<Integer> result = ListOperationsUtility.size(firstList);
        Integer result2=result.size();
        System.assertEquals(5,result2);
       
        
        System.debug('@@@@@ Result @@@@ '+result2);
    }

    @IsTest
    static void testtoString() {
        List<String> firstList = new List<String>();
        
        firstList.add('Gokul');
        firstList.add('Coimbatore');
        firstList.add('BSC IT');
        
        List<String> result = ListOperationsUtility.toString123(firstList);
        
        System.assertEquals(true,result.contains('Gokul'));
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testtoSorting() {
        List<String> firstList = new List<String>();
        
        firstList.add('a');
        firstList.add('d');
        firstList.add('b');
        firstList.add('e');
        firstList.add('f');
        firstList.add('c');

        
        List<String> result = ListOperationsUtility.toSort(firstList);
        
        System.assertEquals(true,result.contains('a'));
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testtoremove() {
        List<Integer> firstList = new List<Integer>();
        
        firstList.add(1);
        firstList.add(2);
        firstList.add(3);
        firstList.add(4);
        firstList.add(5);
        firstList.add(6);

        
        List<Integer> result = ListOperationsUtility.remove(firstList);
        
        system.assertEquals(true,result.contains(5));
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testtoSet() {
        List<Integer> firstList = new List<Integer>();
        
        firstList.add(1);
        firstList.add(2);
        firstList.add(3);
        firstList.add(4);
        firstList.add(5);
        firstList.add(6);

        
        List<Integer> result = ListOperationsUtility.set(firstList);
        
        system.assertEquals(true,result.contains(29));
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
}