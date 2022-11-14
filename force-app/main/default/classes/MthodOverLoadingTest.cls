@IsTest
public class MthodOverLoadingTest {
    
@IsTest
static void testMethod1(){
    MthodOverLoading handler = new MthodOverLoading();
    handler.method();
    handler.method(5);
    handler.method('Gokul');
    handler.method(89,90);
    handler.method(12,'Ishu');
    handler.method(12,89,90);

}
    }