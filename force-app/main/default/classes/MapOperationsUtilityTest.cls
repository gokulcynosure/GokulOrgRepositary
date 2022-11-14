@IsTest
public class MapOperationsUtilityTest {
    


   @IsTest
static void testClone(){
   String val='Gokul';
   Map<Integer,string> result = MapOperationsUtility.mapClONE(val);
   System.debug('clone'+result);
   System.Assert(TRUE,result.containsKey(1));
}
@IsTest
static void testEqualls(){
   String val='Gokul';
   String val1 = 'Gokul';
   boolean result = MapOperationsUtility.mapEqualls(val,val1);
   System.debug(result);
   System.AssertEquals(true,result);
}
@IsTest
static void testContains(){
   String val='Gokul';
   boolean result = MapOperationsUtility.mapContains(val);
   System.debug(result);
   System.AssertEquals(true,result);
}

@IsTest
static void testIsEmpty(){
   String val='Gokul';
   boolean result = MapOperationsUtility.mapIsEmpty(val);
   System.debug(result);
   System.AssertEquals(true,result);
}
@IsTest
static void testKeyset(){
   String val='Gokul';
   String val1 = 'CYNOSURE QUEST';
   set<String> result = MapOperationsUtility.mapKeyset(val,val1);
   System.debug(result);
   System.AssertEquals(true,result.contains('Name'));
}
@IsTest
static void testGet(){
   String val='Gokul';
   String val1 = 'CYNOSURE QUEST';
   Map<string,String> result = MapOperationsUtility.mapGet(val,val1);
   System.debug(result);
   System.Assert(true,result.containsKey('Name'));
}
@IsTest
static void testPutAll(){
   String val='Gokul';
   String val1 = 'CYNOSURE QUEST';
   Map<Integer,String> result = MapOperationsUtility.mapputAll(val,val1);
   System.debug(result);
   System.Assert(true,result.containsKey(2));
}
@IsTest
static void testRemove(){
   String val='Gokul';
   String val1 = 'CYNOSURE QUEST';
   Map<Integer,String> result = MapOperationsUtility.mapRemove(val,val1);
   System.debug(result);
   System.Assert(true,result.containsKey(1));
}
@IsTest
static void testClear(){
   String val='Gokul';
   Map<Integer,string> result = MapOperationsUtility.mapClear(val);
   System.debug('afterClear'+result);
   System.Assert(true,result.containsKey(1));
   }
@IsTest
static void testSize(){
   String val='Gokul';
   String val1 = 'CYNOSURE QUEST';
   Integer result = MapOperationsUtility.mapSize(val,val1);
   System.debug(result);
   System.AssertEquals(2,result);
}
@IsTest
static void testToString(){
   String val='Gokul';
   String val1 = 'CYNOSURE QUEST';
   Map<Integer,String> result = MapOperationsUtility.mapToString(val,val1);
   System.debug(result);
   System.Assert(true,result.containsKey(1));
}
@IsTest
static void testToValues(){
   String val='Gokul';
   String val1 = 'CYNOSURE QUEST';
   List<string> result = MapOperationsUtility.mapToValues(val,val1);
   System.debug(result);
   System.Assert(true,result.contains('Gokul'));
}
}