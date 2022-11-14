public with sharing class StudentOperationsController {
    @AuraEnabled
    public static void addStudent(StudentWrapper student) {
        Student__c stud = new Student__c() ;
        stud.Name = student.name;
        if(student.marksList != NULL) {
            for(Marks marks : student.marksList) {
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('English')) {
                    stud.English__c = marks.mark;
                }
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Maths')) {
                    stud.Maths__c = marks.mark;
                }
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Science')) {
                    stud.Science__c = marks.mark;
                }
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Social')) {
                    stud.Social__c = marks.mark;
                }
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Tamil')) {
                    stud.Tamil__c = marks.mark;
                }
            }
            
        }
        insert stud;
    
}
    
   
    @AuraEnabled
    public static Student__c getStudentFromWrapper(StudentWrapper wrapper){
        Student__c stud = new Student__c() ;
        stud.Name = wrapper.name;
        system.debug(stud.Name);
        system.debug(wrapper.marksList);
        if(wrapper.marksList != NULL) {
            for(Marks marks : wrapper.marksList) {
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('English')) {
                    stud.English__c = marks.mark;
                }
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Maths')) {
                    stud.Maths__c = marks.mark;
                }
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Science')) {
                    stud.Science__c = marks.mark;
                }
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Social')) {
                    stud.Social__c = marks.mark;
                }
                if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Tamil')) {
                    stud.Tamil__c = marks.mark;
                }
            }
            
          }
    
    return stud;
}
        


    @AuraEnabled
    public static void  addStudents(List<StudentWrapper> studentWrappers) {
       List<Student__c> studentList = new List<Student__c>();
        for(StudentWrapper  wrapper : studentWrappers){
            studentList.add(getStudentFromWrapper(wrapper));
        }

        insert studentList;
    }

   
    
    @AuraEnabled
    public static void updateStudent(String name,List<Marks> upMark){
        Student__c stu = new Student__c() ;
        stu.Name =name;
        
        system.debug(stu.name);
        system.debug(upMark);
        
      List<Student__c> studentRecords = [Select id,name,English__c,Maths__c,Science__c,Social__c,Tamil__c FROM Student__c];
        for(Student__c stude : studentRecords){
            if(stude.name.equalsIgnoreCase(Name)){
                for(Marks marks : upMark) {
                   if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('English')) {
                    stude.English__c = marks.mark;
                }
                   if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Maths')) {
                    stude.Maths__c = marks.mark;
                }
                   if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Science')) {
                    stude.Science__c = marks.mark;
                }
                   if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Social')) {
                    stude.Social__c = marks.mark;
                }
                   if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Tamil')) {
                    stude.Tamil__c = marks.mark;
                }
            }
            
            
            
    }
        update stude;
        }
    
}
                
  @AuraEnabled
    public static void updateMarksOnMap(Map<String,List<Marks>> marksMap){
        Student__c stu = new Student__c() ;
        for ( string key : marksMap.keySet()){
            stu.name = key;
        
        
        system.debug(stu.name);
        
        
      List<Student__c> studentRecords = [Select name,English__c,Maths__c,Science__c,Social__c,Tamil__c FROM Student__c];
        for(Student__c stude : studentRecords){
            if(stude.name.equalsIgnoreCase(stu.name)){
		for(List<Marks> upMark : marksMap.values()){
              for(Marks marks : upMark) {
                   if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('English')) {
                    stude.English__c = marks.mark;
                }
                   if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Maths')) {
                    stude.Maths__c = marks.mark;
                }
                   if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Science')) {
                    stude.Science__c = marks.mark;
                }
                   if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Social')) {
                    stude.Social__c = marks.mark;
                }
                   if(marks.subject != NULL &&
                        marks.subject.equalsIgnoreCase('Tamil')) {
                    stude.Tamil__c = marks.mark;
                }
            }
            
        }
            }
            
    
        
        update stude;
        }
        }        
    
}

  @AuraEnabled
    public static void deleteStudent(List<String> deleteStudentList){
        Student__c stud = new Student__c();
        
        for (string delStu : deleteStudentList){
            stud.Name = delStu;
            system.debug(stud.Name);
            
              List<Student__c> studentRecords = [Select id,name FROM Student__c];
        for(Student__c stude : studentRecords){
            if(stud.Name.equalsIgnoreCase(stude.Name)){
              stud = stude;
                
                
        }
    }
        delete stud;    
        }
        
        
    }
        
  @AuraEnabled
    public static void updateTotalForStudents(List<Student__c> StudentList){
        Student__c stud = new Student__c();
        Decimal sum;
        for(Student__c stu : StudentList){
            stud.Name = stu.name;
            List<Student__c> studentRecords = [Select id,name,English__c,Maths__c,Science__c,Social__c,Tamil__c FROM Student__c];
        for(Student__c stude : studentRecords){
            if(stude.name == stud.Name){
                stud = stude;
                
                system.debug(stud);
                stud.English__c = stude.English__c;
                stud.Maths__c= stude.Maths__c;
                stud.Science__c = stude.Science__c;
                stud.Social__c = stude.Social__c;
                stud.Tamil__c = stude.Tamil__c;
                sum = (stud.English__c + stud.Maths__c + stud.Science__c + stud.Social__c + stud.Tamil__c);
                stud.Total__c = sum;
                system.debug(stud.Total__c);
                
            }
        
    }
            update stud;
        }
        
    }
    
   
    public static void updateGrade(List<Student__c> stu){
        Student__c stud = new Student__c();
        Decimal percentage;
        String Grade;
        for(Student__c student : stu){
            stud.Name = student.name;
            system.debug(stud.Name);
            
        List<Student__c> studentRecords = [Select id,name,Total__c FROM Student__c];
        for(Student__c stude : studentRecords){
              if(stude.Name == stud.Name){
                stud = stude;
                  system.debug(stud);
            stud.percentage__c = stud.Total__c / 5;
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
    }
    
    
    public Class StudentWrapper {
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public List<Marks> marksList {get;set;}
        @AuraEnabled
        public Map<String,List<Marks>> marksMap {get;set;}
    
        public  StudentWrapper(String nameParam, List<Marks> marksListParam) {
            this.name = nameParam;
            this.marksList = marksListParam;
            if(marksList == NULL) {
                marksList = new List<Marks>();
            }
            else {
               this.marksList = marksListParam;
                
            
            }
            
        }

        public StudentWrapper(Map<String,List<Marks>> marksMap){
            this.marksMap = marksMap;
        }
         
    }
 public  class Marks {
    
       public String subject {get;set;}
       public Integer mark {get;set;}
        
     public Marks(String sub,Integer mar){
            this.subject = sub;
            this.mark = mar;
        }
        }
        
}