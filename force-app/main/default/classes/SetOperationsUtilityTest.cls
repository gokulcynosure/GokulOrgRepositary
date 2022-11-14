@IsTest
private class SetOperationsUtilityTest {
   @IsTest
    static void testUnion() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        
        Set<Integer> result = SetOperationsUtility.getUnion(firstSet, secondSet);
        system.assertEquals(true,result.contains(12));
        system.assertEquals(false,result.contains(9000));
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testAddAll(){
        Set<string> a = new Set<string>();
        Set<string> b = new Set <string> ();
        a.add('Gokul');
        a.add('Coimbatore');

        b.add('Cynosure Quest');
        b.add('Employee Number : CQ002');
        
        Set<string> result = SetOperationsUtility.addAll(a,b);
        System.assertEquals(true,result.contains('Cynosure Quest'));
        system.debug('@@@@007@@@'+result);

        
    }
    @IsTest
    static void testClear(){
        Set<string> a = new Set<string>();
        
        a.add('Gokul');
        a.add('Coimbatore');

        Set<string> result = SetOperationsUtility.clear(a);
        System.assertEquals(false,result.contains('Gokul'));
        system.debug('@@@@007@@@'+result);

        
    }
    @IsTest
    static void testIntersection() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getIntersection(firstSet, secondSet);
         system.assertEquals(true,result.contains(1));
        system.assertEquals(false,result.contains(10));
        System.debug('@@@@@ Result @@@@ '+result);
        
    }
    @IsTest
    static void testgetValuesInFirstButNotInSecond() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getValuesInFirstButNotInSecond(firstSet, secondSet);
         system.assertEquals(true,result.contains(12));
        system.assertEquals(false,result.contains(1));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetValuesInSecondButNotInFirst() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getValuesInSecondButNotInFirst(firstSet, secondSet);
         system.assertEquals(true,result.contains(105));
        system.assertEquals(false,result.contains(1));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetAllOddValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getAllOddValues(firstSet, secondSet);
         system.assertEquals(true,result.contains(1));
        system.assertEquals(false,result.contains(12));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testGetAllEvenValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getAllEvenValues(firstSet, secondSet);
         system.assertEquals(true,result.contains(12));
        system.assertEquals(false,result.contains(147));
        System.debug('@@@@@ Result @@@@ '+result);
    }
     @IsTest
    static void testgetSumOfAllOddValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getSumOfAllOddValues(firstSet, secondSet);
         system.assertEquals(true,result.contains(400));
        system.assertEquals(false,result.contains(350));
        System.debug('@@@@@ Result @@@@ '+result);
        
    }
     @IsTest    
    static void testgetSumOfAllEvenValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getSumOfAllEvenValues(firstSet, secondSet);
         system.assertEquals(true,result.contains(214));
        system.assertEquals(false,result.contains(190));
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testGetSumOfAllMultiplesOfThreeValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
         firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getSumOfAllMultiplesOfThreeValues(firstSet, secondSet);
         system.assertEquals(true,result.contains(393));
        system.assertEquals(false,result.contains(500));
        System.debug('@@@@@ Result @@@@ '+result);
        
    }
    @IsTest
    static void testEqualls() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(10);
        secondSet.add(14);
        secondSet.add(12);
        secondSet.add(17);

        
        boolean result = SetOperationsUtility.getEqualls(firstSet, secondSet);
        system.assertEquals(true,result);
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testHashcode() {
        Set<Integer> firstSet = new Set<Integer>();
        
        /*firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);*/

        
        
        Set<Integer> result = SetOperationsUtility.hashcode(firstSet);
        //system.assertEquals(true,result);
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testIsEmpty() {
        Set<Integer> firstSet = new Set<Integer>();
        
        /*firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);*/
        //firstSet.add(17);

        
        
        boolean result = SetOperationsUtility.isEmpty(firstSet);
        system.assertEquals(true,result);
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testIsRemove() {
        Set<Integer> firstSet = new Set<Integer>();
        
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        
        
        Set<Integer> result = SetOperationsUtility.isRemove(firstSet);
        system.assertEquals(true,result.contains(10));
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testRemoveAll(){
        Set<string> a = new Set<string>();
        Set<string> b = new Set <string> ();
        a.add('Gokul');
        a.add('Coimbatore');

        b.add('Cynosure Quest');
        b.add('Employee Number : CQ002');
        
        Set<string> result = SetOperationsUtility.removeAll(a,b);
        System.assertEquals(false,result.contains('Cynosure Quest'));
        system.debug('@@@@007@@@'+result);

        
    }

    @IsTest
    static void testRetainAll(){
        Set<string> a = new Set<string>();
        Set<string> b = new Set <string> ();
        a.add('Gokul');
        a.add('Coimbatore');

        b.add('Cynosure Quest');
        b.add('Employee Number : CQ002');
        b.add('Gokul');
        
        Set<string> result = SetOperationsUtility.retainAll(a,b);
        System.assertEquals(false,result.contains('Coimbatore'));
        system.debug('@@@@007@@@'+result);

        
    }
    @IsTest
    static void testIssize() {
        Set<Integer> firstSet = new Set<Integer>();
        
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        
        
        Set<Integer> result = SetOperationsUtility.size(firstSet);
        Integer result2=result.size();
        System.assertEquals(5,result2);
       
        
        System.debug('@@@@@ Result @@@@ '+result2);
    }

    @IsTest
    static void testtoString() {
        Set<String> firstSet = new Set<String>();
        
        firstSet.add('Gokul');
        firstSet.add('Coimbatore');
        firstSet.add('BSC IT');
        
        Set<String> result = SetOperationsUtility.toString123(firstSet);
        
        System.assertEquals(true,result.contains('Gokul'));
       
        
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testClone(){
       Set<string> a = new Set<string>();
        
        a.add('Gokul');
        a.add('Coimbatore');

       Set<string> result =SetOperationsUtility.clone(a);
        System.assertEquals(true,result.contains('Gokul'));
        system.debug('Clone Set'+result);

        
    }
}