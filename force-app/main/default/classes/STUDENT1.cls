public with sharing class STUDENT1 {
    public student001__c newStudentObject {get;set;}
    public Parent01__c motherRecord {get;set;}
    public Parent01__c fatherRecord {get;set;}
    public Decimal motherAdhaarNumber {get;set;}
    public Decimal fatherAdhaarNumber {get;set;}
    public String motherOccupation {get;set;}
    public String fatherOccupation {get;set;}
    public Boolean bothParentsAdharNumbersWrong {get;set;}
    public Boolean motherInformationMissing {get;set;}
    public Boolean fatherInformationMissing {get;set;}
    public Boolean discountNotValid {get;set;}
    public Boolean mandatoryField{get;set;}
   
    
    
    public STUDENT1(ApexPages.StandardController cosntroller) {
        initVariables();  // when we click the new botton constructor is called and default values are set to all fields.
        newStudentObject.Name = '';
        newStudentObject.Aadhar_Number__c = 0;
        newStudentObject.mother_aadhar_number__c  = 0;
        newStudentObject.Father_s_Aadhar_number__c= 0;
        newStudentObject.discount_requested__c= 0;
    }

    private void initVariables() {
        bothParentsAdharNumbersWrong = false;
        motherInformationMissing = false;
		fatherInformationMissing = false;
        discountNotValid = false;
        mandatoryField=false;
        newStudentObject = new Student001__c();
      
    }

    
    

    public PageReference save() {
       try {
            Boolean isDataValid = isDataValidForDiscount();
            System.debug('Parent Adhaar Error value'+bothParentsAdharNumbersWrong);
            if(isDataValid) {
                insert newStudentObject;
            }
            else {
                if(bothParentsAdharNumbersWrong) {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,  'Adhaar Info of Parents not matching @'+newStudentObject.Name));  
           
                }if(motherInformationMissing) {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'MotherAadhar Information missing '+newStudentObject.Name));  
                } 
                if(fatherInformationMissing) {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'FatherAadhar Information missing '+newStudentObject.Name));  
                }
                
                if(mandatoryField){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Mandatory fields value missing '));
                }
               
                
                
                if(discountNotValid){
                      ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Sorry '+newStudentObject.Name + ', we cannot provide you '+ newStudentObject.Discount_Requested__c + '% discount'));
                      //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, 'ApexPages.Severity.WARNING'));
                }
                else{
                      ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'some error occured '+newStudentObject.Name));
                }
            }
            
        }catch(Exception e) {
           System.debug('The Exception is at Stack Trace'+e.getStackTraceString());
           System.debug('The Exception is at Line Number'+e.getLineNumber());
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, e.getMessage(), 'Error Saving the Record @Saravana...please check'));  
        }
        
        return NULL; 
    }
    PageReference returnPage = new PageReference(ApexPages.currentPage().getParameters().get('retURL'));  

    private Boolean isDataValidForDiscount() {
        motherAdhaarNumber = newStudentObject.mother_aadhar_number__c;  // getting the user input of aadhar no
        fatherAdhaarNumber =  newStudentObject.Father_s_Aadhar_number__c;

        System.debug('motherAdhaarNumber --> '+motherAdhaarNumber);
        System.debug('fatherAdhaarNumber --> '+fatherAdhaarNumber);// printing both aadhar no
       

        List<Parent01__c> parentRecords = [select  
                                                 Aadhar_Number__c, 
                                                Name, 
                                               	age__c, 
                                               	parent_ship__c, 
                                                	salary__c,
                                                job_sector__c
                                        from Parent01__c 
                                        where 	Aadhar_Number__c 
                                        IN (:motherAdhaarNumber, :fatherAdhaarNumber)]; // getting aaddhar no from parent object
        
        System.debug('Parent Records  --> '+parentRecords);
        if(parentRecords.size() == 0) {
            bothParentsAdharNumbersWrong = true;
            return false;
        }
        for(Parent01__c parent : parentRecords) {
            if(parent.parent_ship__c.equalsIgnoreCase('Father')) {
                this.fatherRecord = parent;
            }
            if(parent.parent_ship__c.equalsIgnoreCase('Mother')) {
                this.motherRecord = parent;
            }
        }
        System.debug('this.fatherRecord --> '+this.fatherRecord);
        System.debug('this.motherRecord --> '+this.motherRecord);
        
        if(fatherRecord==Null){
            fatherInformationMissing = true;
            return false;
        }
        
         
        if(motherRecord==Null){
            motherInformationMissing = true;
            return false;
        }
        
        this.fatherOccupation = fatherRecord.job_sector__c;
        this.motherOccupation = motherRecord.job_sector__c;
        //Condition 1 - If Father Job is Govt, Mother Job is Govt what is maximum Discount = 5%
        
        System.debug('this.fatherOccupation --> '+this.fatherOccupation);
        System.debug('this.motherOccupation --> '+this.motherOccupation);
        System.debug('this.newStudentObject --> '+this.newStudentObject);
        System.debug('this.newStudentObject.discount_requested__c --> '+this.newStudentObject.discount_requested__c);
        
        if(this.fatherOccupation.equalsIgnoreCase('Government') && 
          this.motherOccupation.equalsIgnoreCase('Government') &&
          this.newStudentObject.Discount_Requested__c > 5)  {
              discountNotValid =true;
              return false;
          }
        else if(this.fatherOccupation.equalsIgnoreCase('Private') &&
          this.motherOccupation.equalsIgnoreCase('Private') &&
          this.newStudentObject.Discount_Requested__c > 30)  {
              discountNotValid =true;
              return false;
          }
         else if(this.fatherOccupation.equalsIgnoreCase('UnEmployed') &&
          this.motherOccupation.equalsIgnoreCase('UnEmployed') &&
          this.newStudentObject.Discount_Requested__c > 80)  {
              discountNotValid =true;
              return false;
          }
         else if (this.fatherOccupation.equalsIgnoreCase('Government') &&
          this.motherOccupation.equalsIgnoreCase('Private') &&
          this.newStudentObject.Discount_Requested__c > 10)  {
              discountNotValid =true;
              return false;
          }
         else if (this.fatherOccupation.equalsIgnoreCase('Government') &&
          this.motherOccupation.equalsIgnoreCase('UnEmployed') &&
          this.newStudentObject.Discount_Requested__c > 10)  {
              discountNotValid =true;
              return false;
          }
         else if (this.fatherOccupation.equalsIgnoreCase('Private') &&
          this.motherOccupation.equalsIgnoreCase('UnEmployed') &&
          this.newStudentObject.Discount_Requested__c > 0 )  {
              discountNotValid =true;
              return false;
          }
         else if (this.fatherOccupation.equalsIgnoreCase('Private') &&
          this.motherOccupation.equalsIgnoreCase('Government') &&
          this.newStudentObject.Discount_Requested__c > 10)  {
             discountNotValid =true;
              return false;
          }
        else if (this.fatherOccupation.equalsIgnoreCase('UnEmployed') &&
          this.motherOccupation.equalsIgnoreCase('Government') &&
          this.newStudentObject.Discount_Requested__c > 10)  {
              discountNotValid =true;
              return false;
          }
         
       
        return true;
        
    }

}