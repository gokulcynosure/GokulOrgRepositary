public class StudentManagement {
    @AuraEnabled
    public static void addYear(YearWrapper year){
        Year__c acadamic = new Year__c();
        acadamic.Name = year.yearName;
        acadamic.Start_Date__c = year.startDate;
        acadamic.End_Date__c = year.endDate;
        
        
        insert acadamic;
        
    }
    
    public static void addClass(ClassWrapper cls){
        Class__c clas = new Class__c();
        clas.Name = cls.className;
        clas.Year_Of_Class__c = cls.yearName;
        clas.Year_Fees_to_be_Collected__c = cls.yearFees;
        clas.Donation_For_new_Student__c = cls.donationFees;
        
        insert clas;
    }
    
     public Class YearWrapper {
        @AuraEnabled
        public String yearName {get;set;}
        @AuraEnabled
        public date startDate {get;set;}
         
         @AuraEnabled
        public date endDate {get;set;}
    
    
        public  YearWrapper(String year,Date sd ,Date ed) {
           this.yearName = year;
            this.startDate = sd;
            this.endDate = ed;
            
        }        
    }
 public Class ClassWrapper {
        @AuraEnabled
        public String className {get;set;}
        @AuraEnabled
        public Id yearName {get;set;}
         
         @AuraEnabled
        public Integer yearFees {get;set;}
     
     @AuraEnabled
        public Integer donationFees {get;set;}
     
     public ClassWrapper(String cls,Id year,Integer fee,Integer don){
         this.className = cls;
         this.yearName = year;
         this.yearFees = fee;
         this.donationFees = don;
     
     }
 }
}