public with sharing class ListOperationsUtility {
    public static List<Integer>Union(List<Integer> firstList, List<Integer> secondList) {
        List<Integer> result = new List<Integer>();
        for(Integer val : firstList) {
            result.add(val);
        }
        for(Integer val : secondList) {
            result.add(val);
        }
        return result;
    }

     public static List<Integer> getIntersection(List<Integer> firstList, List<Integer> secondList) {
        List<Integer> result = new List<Integer>();
        
       for(Integer val1 : firstList) {
            if(secondList.contains(val1)){
               result.add(val1);
            }
       }
        
       
        return result;
    }
     public static List<Integer> getValuesInFirstButNotInSecond(List<Integer> firstList, List<Integer> secondList) {
        List<Integer> result = new List<Integer>();
        for(Integer val : firstList) {
            if(!secondList.contains(val)){
            result.add(val);
        }
        }
        return result;
    }

    public static List<Integer> getValuesInSecondButNotInFirst(List<Integer> firstList, List<Integer> secondList) {
        List<Integer> result = new List<Integer>();
        for(Integer val : secondList) {
            if(!firstList.contains(val)){
            result.add(val);
        }
        }
        return result;
    }
    /*public static List<Integer> getRepeatedValues(List<Integer> firstList, List<Integer> secondList) {
        List<Integer> result = new List<Integer>();
        for(Integer val : firstList){
            if(secondList.contains(val)){
                result.add(val);
            }
            }  
        
        for(integer val1 : result){
            if(firstList.contains(val1)){
                result.add(val1);
            }
        }

        return result;
    }*/
        
        
    
    public static List<Integer> getNonRepeatedValues(List<Integer> firstList, List<Integer> secondList) {
        List<Integer> result = new List<Integer>();
        
        return result;
    }
     public static List<Integer> getAllOddValues(List<Integer> firstList, List<Integer> secondList) {
        List<Integer> result = new List<Integer>();
        for(Integer val : firstList) {
            if(math.mod(val,2)!=0){
            result.add(val);
        }
           
        }
        for(Integer val : secondList) {
            if(math.mod(val,2)!=0){
            result.add(val);
        }
            
        }
        return result;
    }
         
            
             
               
               

    
    public static List<Integer> getAllEvenValues(List<Integer> firstList, List<Integer> secondList) {
        List<Integer> result = new List<Integer>();
        for(Integer val : firstList) {
            if(math.mod(val,2)==0){
            result.add(val);
        }
           
        }
        for(Integer val : secondList) {
            if(math.mod(val,2)==0){
            result.add(val);
        }
            
        }
        return result;
    }
    public static Integer getSumOfAllEvenValues(List<Integer> firstList, List<Integer> secondList) {
        integer Val=0;
        for(Integer first : firstList) {
           if(math.mod(first,2)==0){
            Val = Val + first;
           }
        }
       for(Integer second : secondList) {
            if(math.mod(second,2)==0){
                Val = Val + second;
        }
        }
        return Val;
    }
    
    public static Integer getSumOfAllOddValues(List<Integer> firstList, List<Integer> secondList) {
        integer Val=0;
        for(Integer first : firstList) {
           if(math.mod(first,2)!=0){
            Val = Val + first;
           }
        }
       for(Integer second : secondList) {
            if(math.mod(second,2)!=0){
                Val = Val + second;
        }
        }
        return Val;
    }
   public static Integer getSumOfAllMultiplesOfThreeValues(List<Integer> firstList, List<Integer> secondList) {
        integer Val=0;
        for(Integer first : firstList) {
           if(math.mod(first,3)==0){
            Val = Val + first;
           }
        }
       for(Integer second : secondList) {
            if(math.mod(second,3)==0){
                Val = Val + second;
        }
        }
        return Val;
    }    

    public static List<Integer> add(List<Integer> firstList) {
        List<Integer> result = new List<Integer>();
        for(Integer val : firstList) {
            result.add(val);
        }
       return result;
    }
    public static List<Integer> addWithIndex(List<Integer> firstList) {
        List<Integer> result = new List<Integer>();
        for(Integer val : firstList) {
            result.add(val);
        }
        result.add(0,55);
       return result;
    }
    public static List<string> addAllInList (List<string> a,List<string> b){
        List <string> List1 = new List<string>();
        List<string> List2= new List<string>();
        for(string val : a){
            List1.add(val);
        }
        for(string val2 : b){
            List2.add(val2);
            
        }
        List1.addAll(List2);
        return List1;
        
        }
        public static List <string> clear(List <string> a){
           List <string>List1 = new List<string>();
            for(string val : a){
               List1.add(val);
                system.debug('Adding Values'+List1);
                }
               List1.clear();
                system.debug('clear value'+List1);
            return List1;
        }

        public static List <string> clone(List <string> a){
            List <string>List1 = new List<string>();
            for(string val : a){
                List1.add(val);
                system.debug('Original:'+List1);
            }
        List <string> List2 = new List<string>(List1);
        return List2;    
        }

        public static boolean  getEqualls(List<Integer> firstList,List<Integer> secondList){
            List<Integer> val1 = new List<Integer>();
            List<Integer> val2 = new List<Integer>();
            
            for(Integer val : firstList) {
                 val1.add(val);
            }
            for(Integer val : SecondList) {
                val2.add(val);
           }
           if( val1.equals(val2)){
            return true;
           }
           return false;
        }

        public static Integer getIndex(List <Integer> a){
            List <Integer>List1 = new List<Integer>();
           for(Integer val : a){
                List1.add(val);
                system.debug(List1);
            }
            Integer element = List1.get(2);
            return element;
            

}
public static List<integer> size(List<Integer> firstList){
    List<Integer> val1 = new List<Integer>();
    for(Integer val : firstList) {
        val1.add(val);
   }
   
   return val1;
   }

   public static List<String> toString123(List<String> a){
    List <string> List1 = new List<String>();
    
    for(String val : a){
        List1.add(val);
    }
    List1.toString();
    return List1;
        
    }

    public static List<String> toSort(List<String> a){
        List <string> List1 = new List<String>();
        
        for(String val : a){
            List1.add(val);
            system.debug('before'+List1);
        }
        List1.sort();
        return List1;
            
        }

        public static List <Integer> remove(List<Integer> firstList){
            List<Integer> val1 = new List<Integer>();
            for(Integer val : firstList) {
                 val1.add(val);
            }
            val1.remove(0);
            return val1;

}
public static List <Integer> set(List<Integer> firstList){
    List<Integer> val1 = new List<Integer>();
    for(Integer val : firstList) {
         val1.add(val);
    }
    val1.set(0,29);
    return val1;

}
}