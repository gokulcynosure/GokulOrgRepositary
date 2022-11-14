public class Palindrome {
    
    public static void emailStr (String email){
        String name = email.substringBefore('@');
        
        system.debug('name'+ name);
        String [] names = name.split ('\\.');
    }        
     /*   
            String firstName = names.get(0);
            String lastName = names.get(1);
         
        firstName = firstName.substring(0,1).toUpperCase() +  firstName.substring(1).toLowerCase() ;
        lastName = lastName.substring(0,1).toUpperCase() + lastName.substring(1).toLowerCase();
        
        system.debug('First Name ---->' + firstName);
        system.debug('Last Name ---->' + lastName);
    }*/

    public static boolean palindrome (String str){
         String st = str.toLowerCase();
        Integer length = str.length();
        String special ='';
        
        for(integer i=0;i<length;i++){
            String stringIteration = st.substring(i,i+1);
            Boolean alphaNumeric = stringIteration.isAlphanumeric();
            if(alphaNumeric)
            {
                special = special + stringIteration;
                
            }
        }
            if(special == special.reverse()){
                system.debug('the string is palindrom');
                return true;
            }
            else
            {
                system.debug('the string is not palindrom');
                return false;
            }
            
        
    }
    
    public static Boolean matchParenthesis(String input) {
    boolean isValid ;
   // create a map to put key and values 
   Map<String, String> opening = new Map<String, String>();
    opening.put('(', ')');
    opening.put('[', ']');
    opening.put('{', '}');
    opening.put('<', '>');
	
    // create a list for all input characters
    List<String> c = new List<String>();
        //Iterate input string in for loop
        for(String a : input.split('')){
          if(opening.containsKey(a)){
                String b = opening.get(a);
              IF(b != NULL){
                 c.add(a);
                c.add(b);  
              }
          }
            Else{
                break;
             }
        }
        
        If(math.mod(c.size(),2)== 0 && c != NULL){
            isValid = true;
        }Else{
            isValid = false;
        }
       
       system.debug('Boolean:'+ isValid);
       return isValid;
}
}