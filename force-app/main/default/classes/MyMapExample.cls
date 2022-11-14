public class MyMapExample {
    
 public static Map<String,String> createNumericToRomanNumericMap(Map<String, String> numeralsMap, Map<String, String> romanNumeralsMap) {
        Map<String,String> romanNumericMap = new Map<String,String>();
        Integer i = 0;
        List<String> key = numeralsMap.Values();
        List<String> values = romanNumeralsMap.values();
        
        for(String numbers : key){
            romanNumericMap.put(numbers,values.get(i));
             i ++;
             
        }
            
        return romanNumericMap;

    }
    
    
  public static Map<Integer, string> reverseAMap(Map<String, Integer> numeralMap) {
     Map<Integer,String> reverse = new Map<Integer,String>();
     Integer i =0;
     List<Integer> numbers = numeralMap.values();
     Set<string> word = numeralMap.keySet();
     
     For(String words : word){
       reverse.put(numbers.get(i),words);
         i ++;
     }
     
     
     return reverse;
 }
     
     
     
     
        
}