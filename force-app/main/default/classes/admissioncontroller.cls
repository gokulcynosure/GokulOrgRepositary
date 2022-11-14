public class admissioncontroller {

     public Child__c abc {get;set;}
    public Parent__c motherRecord{get;set;}
     public Parent__c fatherRecord{get;set;}
    
     
    
    
    public admissioncontroller(){
        abc=new Child__c();
        
    }
    private void initVariables(){
        motherRecord=new Parent__c();
        fatherRecord=new Parent__c();
     
      
      
    }
    
    private Boolean isDiscount(){
        Decimal studentAadhar=abc.Aadhar__c;
        Decimal fatherAadharNumber=abc.father_aadhar_number__c;
         Decimal motherAadharNumber=abc.mother_aadhar_number__c;
        List<Parent__c>parentRecords=[SELECT  Name,
                                      Job__c,
                                      Aadhar_Number__c,
                                      Annual_income__c,
                                      Parental__c FROM Parent__C where  Aadhar_Number__c=11111 or  Aadhar_Number__c=22222];
        return true;
       
        
    }
    
    }