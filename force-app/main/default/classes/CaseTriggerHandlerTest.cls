@IsTest
public class CaseTriggerHandlerTest {
@IsTest
    static void testInitialValue() {
        
        Case css = new Case();
        css.Status= 'New';
        css.Origin ='Email';
        
        
        
        insert css;
        System.debug('css Id:' + css.Id);
        
        
        Case cs = [SELECT Id, Description FROM Case WHERE Id = :css.Id];
        System.assertEquals('', cs.Description);
        system.debug('Description' + cs.Description);
    }
    
    @IsTest
    static void testStatusNameChangeOnce() {
       
         Case css = new Case();
        css.Status= 'New';
        css.Origin ='Email';
        css.Description = 'Gokul';
        
        Insert css;
        
        // When
        css.Status = 'Working';
        update css;
        
        // Then
        Case cs = [SELECT Id,Description FROM Case WHERE Id = :css.Id];
        system.debug(cs.Description);
        System.assertEquals('GokulHello',cs.Description);
    }
    
    @IsTest
    static void testStageNameChangeTwice() {
        Case css = new Case();
        css.Status= 'New';
        css.Origin ='Email';
        css.Description = 'Gokul';
        
        Insert css;
        
        // When
        css.Status = 'Working';
        update css;
        
        // Then
        Case cs = [SELECT Id,Description FROM Case WHERE Id = :css.Id];
        system.debug(cs.Description);
        System.assertEquals('GokulHello',cs.Description);
        
        // When
        css.Status = 'Escalated';
        update css;
        
       Case cs1 = [SELECT Id,Description FROM Case WHERE Id = :css.Id];
        system.debug(cs1.Description);
        
        System.assertEquals('GokulHelloHello',cs1.Description);
        
     
    }
    
    @IsTest
    static void testSomethingElseChanged() {
       
        Case css = new Case();
        css.Status= 'New';
        css.Origin ='Email';
        css.Description = 'Gokul12';
        
        Insert css;
        
        // When
        css.Subject = 'study';
        update css;
        
        // Then
          Case cs1 = [SELECT Id,Description FROM Case WHERE Id = :css.Id];
        
        
        System.assertEquals('Gokul12',cs1.Description);
    }
}