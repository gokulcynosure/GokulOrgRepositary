public with sharing class MthodOverLoading {
    public void method() {
        system.debug('no Parameter');

    }
    public void method(Integer a){
        system.debug('This is '+a);
    }
   
    
    public static void method(String a){
        system.debug('This is '+a);
    }
    public void method(Integer a,Integer B){
        Integer c = a+b;
        system.debug('addition of'+c);
    }
    public void method(Integer a,Integer b,Integer c){
        Integer d= a+b+c;
        system.debug('addition of 3 numbers'+d);
    }
    public void method(Integer a,String c){
        system.debug('The number is'+a);
        system.debug('The String is'+c);
    }
   
}