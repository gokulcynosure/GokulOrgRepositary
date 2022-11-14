@IsTest
public class MyMapExampleTest {
    
    
 @IsTest
    Static void testCreateNumericToRomanNumericMap(){
        Map<String, String> numeralsMap = New Map<String, String>();
		numeralsMap.put('three', '3');	
           numeralsMap.put('one', '1');
			numeralsMap.put('two', '2');
			
			numeralsMap.put('four', '4');
			numeralsMap.put('five', '5');

		Map<String, String> romanNumeralsMap = New Map<String, String>();
			romanNumeralsMap.put('one', 'I');
			romanNumeralsMap.put('two', 'II');
			romanNumeralsMap.put('three', 'III');
			romanNumeralsMap.put('four', 'IV');
			romanNumeralsMap.put('five', 'V');

	Map<String, String> output = MyMapExample.createNumericToRomanNumericMap(numeralsMap, romanNumeralsMap);
	System.debug('output :' + output);
   system.assert(true,output.containsKey('5'));
    }
    
 @IsTest
    Static void testReverseMap(){
        Map<String, Integer> numeralsMap = new Map<String, Integer>();
		numeralsMap.put('four', 4);
		numeralsMap.put('three', 3);
		numeralsMap.put('one', 1);
		numeralsMap.put('five', 5);
		numeralsMap.put('two', 2);

	Map<Integer, String> output = MyMapExample.reverseAMap(numeralsMap);
	system.debug('Output'+ output);
	system.assert(true,output.containsKey(1));
    }

}