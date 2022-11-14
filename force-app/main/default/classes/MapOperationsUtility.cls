public with sharing class MapOperationsUtility {
   
   public static  Map <Integer,string> mapClONE(String a){
      Map<Integer, String> mapName = new Map<Integer, String>();
      mapName.put(1,a);
      System.debug('Orginal'+mapName);
      Map<Integer, String> mapName1 = new Map<Integer, String>(mapName);
      return mapName1;

}
public static boolean mapEqualls(String a,String b){
   Map<Integer, String> mapName = new Map<Integer, String>();
   Map<Integer, String> mapName1 = new Map<Integer, String>();
   mapName.put(1,a);
   mapName1.put(1,a);
   if(mapName.Equals(mapName1)){
      return true;
   }
   return false;

}
public static  boolean mapContains(String a){
   Map<Integer, String> mapName = new Map<Integer, String>();
   mapName.put(1,a);
   System.debug('Orginal'+mapName);
  if(mapName.containsKey(1)){
   return true;
  }
   return false;

}
public static  boolean mapIsEmpty(String a){
   Map<Integer, String> mapName = new Map<Integer, String>();
  
  if(mapName.isEmpty()){
   return true;
  }
   return false;

}
public static  set <String> mapKeyset(String a,string b){
   Map<String, String> mapName = new Map<String, String>();
   mapName.put('Name',a);
   mapName.put('Company',b);
   System.debug('@@@56@@@'+mapName);
 
   Set <String> setName = new Set <String>();
   setName = mapName.keySet();

   return setName;

}
public static  map <string,String> mapGet(String a,string b){
   Map<String, String> mapName = new Map<String, String>();
   mapName.put('Name',a);
   mapName.put('Company',b);
   System.debug('@@@56@@@'+mapName);
 
   mapName.get('Name');

   return mapName;

}
public static map<Integer,string> mapputAll(String a,String b){
   Map<Integer, String> mapName = new Map<Integer, String>();
   Map<Integer, String> mapName1 = new Map<Integer, String>();
   mapName.put(1,a);
   mapName1.put(2,b);
  
   mapName.putAll(mapName1);
   return mapName;

}
public static map<Integer,string> mapRemove(String a,String b){
   Map<Integer, String> mapName = new Map<Integer, String>();
   mapName.put(1,a);
   mapName.put(2,b);
  
  mapName.remove(2);
   return mapName;

}
public static Integer mapSize(String a,String b){
   Map<Integer, String> mapName = new Map<Integer, String>();
   mapName.put(1,a);
   mapName.put(2,b);
  
  Integer sizee= mapName.size();
   return sizee;

}

public static map<Integer,string> mapToString(String a,String b){
   Map<Integer, String> mapName = new Map<Integer, String>();
   mapName.put(1,a);
   mapName.put(2,b);
  
  mapName.ToString();
   return mapName;

}
public static  Map <Integer,string> mapClear(String a){
   Map<Integer, String> mapName = new Map<Integer, String>();
   mapName.put(1,a);
   System.debug('Before Clear'+mapName);
   mapName.Clear();
   return mapName;
}
public static List<String> mapToValues(String a,String b){
   Map<Integer, String> mapName = new Map<Integer, String>();
   mapName.put(1,a);
   mapName.put(2,b);
  
   List<String> myVal = mapName.values();
   return myVal;

}

}