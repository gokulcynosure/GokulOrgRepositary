public class PassBy {
    
    public static Double multiplyByPi(Double a){
        a =  a * 3.14;
        system.debug('multiplyByPi'+ a);
        return a;
    }

    public static String subString(String a){
        a = a.subString(0,2);
        system.debug('subString of a:' + a);
        return a;
    }
    
    public static Set<String> addStringToSet(Set <String> a){
        a.add('Gokul');
        system.debug('addStringToSet'+ a);
        return a;
    }
}