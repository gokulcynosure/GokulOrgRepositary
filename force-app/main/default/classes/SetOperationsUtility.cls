public with sharing class SetOperationsUtility {
   
   public Set<Integer> result {get;set;}
   public Set<Integer> result1 {get;set;}
    
   public SetOperationsUtility(){
    
    this.result = new Set<Integer> ();
    this.result1 = new Set<Integer> ();
   }
   
    public  Set<Integer> getUnion(Set<Integer> firstSet, Set<Integer> secondSet) {
        for(Integer val : firstSet) {
            this.result.add(val);
        }
        for(Integer val : secondSet) {
            this.result.add(val);
        }
        return result;
        
    }

    public  Set<Integer> addAll(Set<Integer> a,Set<Integer> b){
        
        for(Integer val : a){
            this.result.add(val);
        }
        for(Integer val2 : b){
            this.result1.add(val2);
        }
        this.result.addAll(result1);
        return result;
        
        }

    public  Set <Integer> clear(Set <Integer> a){
        for(Integer val : a){
            this.result.add(val);
            system.debug('Adding Values'+result);
            }
            this.result.clear();
            system.debug('clear value'+result);
        return result;
    }
   /* public static Set<Integer> getIntersection(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        
       for(Integer val1 : firstSet) {
            if(secondSet.contains(val1)){
               result.add(val1);
            }
       }
        
       
        return result;
    }
     public static Set<Integer> getValuesInFirstButNotInSecond(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val : firstSet) {
            if(!secondSet.contains(val)){
            result.add(val);
        }
        }
        return result;
    }

    public static Set<Integer> getValuesInSecondButNotInFirst(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val : secondSet) {
            if(!firstSet.contains(val)){
            result.add(val);
        }
        }
        return result;
    }
    public static Set<Integer> getRepeatedValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
         

        return result;
    }
        
        
    
    public static Set<Integer> getNonRepeatedValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        
        return result;
    }
     public static Set<Integer> getAllOddValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val : firstSet) {
            if(math.mod(val,2)!=0){
            result.add(val);
        }
           
        }
        for(Integer val : secondSet) {
            if(math.mod(val,2)!=0){
            result.add(val);
        }
            
        }
        return result;
    }
         
            
             
               
               

    
    public static Set<Integer> getAllEvenValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val : firstSet) {
            if(math.mod(val,2)==0){
            result.add(val);
        }
           
        }
        for(Integer val : secondSet) {
            if(math.mod(val,2)==0){
            result.add(val);
        }
            
        }
        return result;
    }
    public static Set<Integer> getSumOfAllEvenValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        integer sumVal3=0;
        integer sumVal4=0;
        for(Integer first : firstSet) {
           if(math.mod(first,2)==0){
               sumVal3 += first;
           }
        }
       
        for(Integer second : secondSet) {
            if(math.mod(second,2)==0){
            sumVal4 += second;
        }
        }
        result.add(sumVal3+sumVal4);
        return result;
    }
    
    public static Set<Integer> getSumOfAllOddValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        integer sumVal1=0;
        integer sumVal2=0;
        for(Integer first : firstSet) {
           if(math.mod(first,2)!=0){
               sumVal1 += first;
           }
        }
       
        for(Integer second : secondSet) {
            if(math.mod(second,2)!=0){
            sumVal2 += second;
        }
        }
        result.add(sumVal1+sumVal2);
        return result;
    }
    public static Set<Integer> getSumOfAllMultiplesOfThreeValues(Set<Integer> firstSet, Set<Integer> secondSet) {
          Set<Integer> result = new Set<Integer>();
        integer sumVal5=0;
        integer sumVal6=0;
        for(Integer first : firstSet) {
           if(math.mod(first,3)==0){
               sumVal5 += first;
           }
        }
       
        for(Integer second : secondSet) {
            if(math.mod(second,3)==0){
            sumVal6+= second;
        }
        }
        result.add(sumVal5+sumVal6);
        return result;
    }*/
    public static boolean  getEqualls(Set<Integer> firstSet,Set<Integer> secondSet){
        Set<Integer> val1 = new Set<Integer>();
        Set<Integer> val2 = new Set<Integer>();
        
        for(Integer val : firstSet) {
             val1.add(val);
        }
        for(Integer val : SecondSet) {
            val2.add(val);
       }
       if( val1.equals(val2)){
        return true;
       }
       return false;
    }

       public Set<integer>  hashcode(Set<Integer> firstSet){
        
        for(Integer val : firstSet) {
            this.result.add(val);
       }
       this.result.hashcode();
       return result;
       }
       

    
    public static boolean  isEmpty(Set<Integer> firstSet){
        Set<Integer> val1 = new Set<Integer>();
        for(Integer val : firstSet) {
            val1.add(val);
       }
       if(val1.isEmpty()){
       return true;
       }
       return false;
    }

    public  Set<Integer>  isRemove(Set<Integer> firstSet){
        for(Integer val : firstSet) {
            if(math.mod(val,2)==0){
            this.result.add(val);
       }else {
        this.result.remove(val);
       }
      }
      return result;
}
public  Set<Integer> removeAll(Set<Integer> a,Set<Integer> b){
    for(Integer val : a){
        this.result.add(val);
    }
    for(Integer val2 : b){
        this.result1.add(val2);
     }
     this.result.addAll(result1);
    System.debug('before remove'+result);
        
    this.result.removeAll(result1);
    

    return result;
    
    }

    public  Set<Integer> retainAll(Set<Integer> a,Set<Integer> b){
        
        for(Integer val : a){
            this.result.add(val);
        }
        for(Integer val2 : b){
            this.result1.add(val2);
            }
        
        this.result.retainAll(result1);
        
    
        return result;
        
        }
        public  integer size(Set<Integer> firstSet){
            
            for(Integer val : firstSet) {
                this.result.add(val);
           }
           Integer val =this.result.size();
           
           return val;
           }
           
    /*public  Set<Integer> toInteger123(Set<Integer> a){
            
            
            for(Integer val : a){
                this.result.add(val);
            }
            result.toInteger();
            return result;
                
            }
    public  Set<Integer> clone(Set<Integer> a){
                
                for(Integer val : a){
                    this.result.add(val);
                    system.debug('Original:'+result);
                }
            this.result1.clone(result);
            return result1;    
            }
            */
}