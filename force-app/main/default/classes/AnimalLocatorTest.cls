@IsTest
public class AnimalLocatorTest {
    
   
    @IsTest
    static void gg(){
    Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
        
		//when
        Test.startTest();
      String a =  AnimalLocator.getAnimalNameById(1);
        Test.stopTest();
        
        system.assertEquals('chicken', a);
    }

}