public with sharing class studentServiceHandler {
    @AuraEnabled
    public static Boolean saveStudent(String name, Decimal tamilMark,Decimal englishMark,Decimal mathsMark,Decimal scienceMark,Decimal socialMark,Decimal age,Date date1) {
        Student__c stud = new Student__c() ;
        try {
            stud.Name = name;
            stud.Tamil__c = tamilMark;
            stud.English__c = englishMark;
            stud.Maths__c = mathsMark;
            stud.Science__c = scienceMark;
            stud.Social__C = socialMark; 
            stud.Age__c = age;
            stud.Date_of_Birth__c = date1;
            
            insert stud;
            System.debug('@@@@@@ Student record created @@@@ '+stud);
        }catch(Exception e) {
            return false;
        }
        return true;
    }
    
    @AuraEnabled
    public static Boolean delStudent(String name){
        Student__c stud = new Student__c() ;
        try {
            stud.name = name;
              List<Student__c> studentRecords = [Select name FROM Student__c];
              for(Student__c stude : studentRecords){
                  if(stud.name.equalsIgnoreCase (stude.name)){ 
                    stud = stude;
                  }
                }
                delete stud;
                
        } catch (Exception e) {
           return false; 
        }
        return true;
    }

    @AuraEnabled
    public static Boolean updateStudent(String name, Decimal tamilMark,Decimal englishMark,Decimal mathsMark,Decimal scienceMark,Decimal socialMark){
        Student__c stud = new Student__c() ;
        Decimal sum;
        Decimal percentage;
        String Grade;
        try {
          stud.name = name;
          List<Student__c> studentRecords = [Select id,name,English__c,Maths__c,Science__c,Social__c,Tamil__c FROM Student__c];
          for(Student__c stude : studentRecords){
              if(stude.name.equalsIgnoreCase(stud.name)){  
            stud = stude;
            stud.Tamil__c = tamilMark;
            stud.English__c = englishMark;
            stud.Maths__c = mathsMark;
            stud.Science__c = scienceMark;
            stud.Social__C = socialMark; 

            if(stud.Tamil__c != NULL || stud.English__c !=NULL || stud.Maths__c != NULL || stud.Science__c != NULL || stud.Social__C != Null){
                sum = (stud.English__c + stud.Maths__c + stud.Science__c + stud.Social__c + stud.Tamil__c);
                stud.Total__c = sum;
            }ELSE{
                stud.Total__c = NULL;
            }
            if(stud.Total__c != NULL){
                percentage = stud.Total__c /5 ;
                stud.percentage__c = percentage;
            }ELSE{
                Stud.percentage__c = NULL;
            }
            IF(stud.percentage__c > 80){
                stud.Grade__c ='A';
            }ELSE IF(stud.percentage__c > 60){
                stud.Grade__c ='B';
            } ELSE IF(stud.percentage__c > 40){
                stud.Grade__c ='C';
            }
            ELSE IF(stud.percentage__c < 40){
                stud.Grade__c ='F';
            }
              }
            }

            update stud;
        }
         catch (Exception e) {
            //throw new AuraHandledException(e.getMessage());
            return false;
        }

        return true;
    }


@AuraEnabled
public static   Boolean addBulkStudents(String name1, Integer marks1){
    Student__c stud = new Student__c() ;
    system.debug(marks1);
    system.debug(name1);
    try {
      /*  stud.name = name;
        stud.Tamil__c = marks.get(0);
        stud.English__c = marks.get(1);
        stud.Maths__c = marks.get(2);
        stud.Science__c = marks.get(3);
        stud.Social__C = marks.get(4);

        insert stud;
        system.debug(stud);*/
    } catch (Exception e) {
        return false;
    }
    return true;
}

}