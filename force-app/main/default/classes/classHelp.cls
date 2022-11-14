public class classHelp {
     public string evenNumber(){
        Integer x = 10;
        String p='even number true';
if(math.mod(x, 2) == 0){
    system.debug(p);
}
else
{
    system.debug('even number false: ' + x);
}
        return p;
        
    }
    public void oddNumber(){
        Integer y = 9; 
if(math.mod(y, 2) != 0){
    system.debug('odd number true: ' + y);
}
else
{
    system.debug('odd number false: ' + y);
}
       
    

}
    
     public static void primeNumber() {

    integer num = 29;
    boolean prime = false;
    for (integer i = 2; i <= num / 2; ++i) {
      
      if (math.mod(num, i) == 0) {
        prime = true;
        break;
      }
    }

    if (!prime)
      System.debug('prime number true'+num);
    else
      System.debug('prime number false'+num);
  }
     public static void palindrome(){  
  integer r,sum=0,temp;    
  integer n=454;
  
  temp=n;    
  while(n>0){    
   r=(math.mod(r,10)); 
   sum=(sum*10)+r;    
   n=n/10;    
  }    
  if(temp==sum)    
   System.debug('palindrome true'+n);   
  else    
   System.debug('palindrome false'+n);  
}  
    public void lcm(){
    
    
    integer n1 = 72, n2 = 120, lcm;

    
    lcm = (n1 > n2) ? n1 : n2;

    
    while(true) {
      if( (math.mod(lcm, n1)==0) && (math.mod(lcm, n2)==0) ) {
        System.debug('lcm of two numbers'+lcm);
        break;
      }
      ++lcm;
    }
  }

    public void hcf(){
        integer i, hcf = 0;
       integer  a=300;
        integer b=150;
        
         for(i = 1; i <= a || i <= b; i++) {
         if( (math.mod(a, i)) == 0 &&(math.mod(b, i)) == 0 )
         hcf = i;
      }
      System.debug('hcf of 2 numbers is'+hcf);
   }
}