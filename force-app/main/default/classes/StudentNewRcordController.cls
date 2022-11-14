public with sharing class StudentNewRcordController{
    
    public students1__c studentObject {get;set;}
    public parents1__c motherRecord {get; set;}
    public parents1__c fatherRecord {get;set;}
    public Boolean parentsRecordMatching {get;set;}
    public Boolean motherRecordMatching {get;set;}
    public Boolean fatherRecordMatching {get;set;}
    public Boolean studentNameMissing {get;set;}
    public Boolean discountExceeded{get;set;}
    public Boolean discountMissing{get;set;}
    public Boolean studentAdharMissing{get;set;}
    public Boolean motherAdharMissing{get;set;}
    public Boolean fatherAdharMissing{get;set;}
    public Boolean mandatoryField{get;set;}

    public String studentName{get;set;}
    public String studentAdharNo{get;set;}
    public String fatherAdharNo{get;set;}
    public String motherAdharNo{get;set;}
    public Decimal studentDiscount{get;set;}
    
    public StudentNewRcordController(ApexPages.StandardController controller){
        studentObject = (students1__c)Controller.getRecord();
        studentObject = new students1__c();
        initVariables();
       
    }
    
    public void initVariables(){
        // studentObject = new Student__c();
        motherRecord = null;
        fatherRecord = null;
        parentsRecordMatching = false;
        motherRecordMatching = false;
        fatherRecordMatching = false;
        discountExceeded = false;
        discountMissing=false;
        studentNameMissing= false;
        studentAdharMissing = false;
        motherAdharMissing = false;
        fatherAdharMissing = false;
        mandatoryField = false;

        studentAdharNo = studentObject.Aadhar_Number__c;
        motherAdharNo  = studentObject.mother_aadhar_number__c;
        fatherAdharNo = studentObject.Father_aadhar_number__c;
        studentName = studentObject.Name;
        studentDiscount = studentObject.Discount__c;

    }

   

    private  Boolean checkEmptyFields(){
        Boolean isEmpty = false;
        if(studentObject.Discount__c == null){
            discountMissing = true;
            isEmpty =true;
        }
        if(studentName == null){
            studentNamemissing = true;
            isEmpty =true;
         }
         if(studentAdharNo == null){
            studentAdharMissing = true;
            isEmpty =true;
         }
         if(motherAdharNo == null){
             motherAdharMissing = true;
             isEmpty =true;
         }

         if(fatherAdharNo == null){
            fatherAdharMissing = true;
            isEmpty =true;
        }
         
        return isEmpty;

    }
    
    public pagereference addNewRecord(){
             initVariables();
             Boolean isFieldEmpty = checkEmptyFields();
             Boolean isDataValid = isDataValidForDiscount();
             system.debug('discountExceeded'+discountExceeded);
             system.debug('parentsRecordMatching'+parentsRecordMatching);
             system.debug('motherRecordMatching'+motherRecordMatching);
             system.debug('fatherRecordMatching'+fatherRecordMatching);
             system.debug('studentRecordMissing'+ studentNameMissing);
             
            if(isFieldEmpty){
                if(studentNameMissing){
                    ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,' Student name cannot be Empty'));
                 }
                 if(studentAdharMissing){
                    ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,' Student Adhar cannot be Empty'));
                 }
                 if(motherAdharMissing){
                    ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,' Mother Adhar cannot be Empty'));
                 }
                 if(fatherAdharMissing){
                    ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,' Father Adhar cannot be Empty'));
                 }
                 if(discountMissing){
                    ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,' Discount cannot be Empty'));
                 }

             }else{

                if(isDataValid){
                    insert studentObject;  
                    PageReference retPage = new PageReference(ApexPages.currentPage().getParameters().get('retURL')); 
                    retPage.setRedirect(true); 
                    return retPage; 
                }
                else{
                    if(discountExceeded){
                        ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,' Discount percentage limit exceeded','Error Saving record'));
                    }
                    if(parentsRecordMatching){
                        ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,' Parents Adhar Number not Matching'));
                    }
                    if(motherRecordMatching){
                        ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,' Mother Adhar Number not Matching'));
                    }
                    if(fatherRecordMatching){
                        ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,' Father Adhar Number not Matching'));
                     }
                     if(mandatoryField){
                        ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,' Mandatory Field/Fields not Valid'));
                     }
                     
              }

             }

          return null;
               
    }
    
    public Boolean isDataValidForDiscount(){
       
        List<parents1__c> parentRecords = [SELECT Id,
                                         Aadhar_Number__c,
                                         job_sector__c,
                                         Parental__c
                                         FROM parents1__c
                                         WHERE Aadhar_Number__c IN (:motherAdharNo , :fatherAdharNo)];
                                         
                                         
        for(parents1__c parent : parentRecords){
            if(parent.Parental__c.equalsIgnoreCase('Father')){
                fatherRecord = parent;
            }
            if(parent.Parental__c.equalsIgnoreCase('Mother')){
                motherRecord = parent;
            }
        }

        system.debug('parent record size '+parentRecords.size());
        system.debug('father record '+fatherRecord);
        system.debug('motherrecord '+motherRecord);
        system.debug('studentDiscount'+ studentDiscount );
        

        if(parentRecords.size() == 0){
            parentsRecordMatching = true;
                return false;
        }

       
        if(fatherRecord == null ){
                fatherRecordMatching = true;
                return false;
                
        }
        if(motherRecord == null ){
                motherRecordMatching = true;
                return false;
        }
       
        
        if(studentName == '0' || studentAdharNo == '0' || motherAdharNo == '0' || fatherAdharNo == '0' || studentDiscount == 0)
        {
            mandatoryField = true;
            return false;
        }
       
      
        
        if(fatherRecord.job_sector__c.equalsIgnoreCase('Private') && motherRecord.job_sector__c.equalsIgnoreCase('Private') && studentObject.Discount__c > 30){
            
            discountExceeded = true;
            return false;

        }
        else if(fatherRecord.job_sector__c.equalsIgnoreCase('Public') && motherRecord.job_sector__c.equalsIgnoreCase('Public') && studentObject.Discount__c > 5){
            discountExceeded = true;
            return false;
        }
         else if(((fatherRecord.job_sector__c.equalsIgnoreCase('Public') && motherRecord.job_sector__c.equalsIgnoreCase('Private') )|| (fatherRecord.job_sector__c.equalsIgnoreCase('Private') && motherRecord.job_sector__c.equalsIgnoreCase('Public') ))&& studentObject.Discount__c > 10){
            discountExceeded = true;
            return false;
        }
        else if(fatherRecord.job_sector__c == 'Unemployed' && motherRecord.job_sector__c == 'unemployed' && studentObject.Discount__c > 80){
            discountExceeded = true;
            return false;
        }
       
         
        return true;
    }
    
    
    public pagereference cancelNewRecord(){
        PageReference retPage = new PageReference(ApexPages.currentPage().getParameters().get('retURL')); 
        retPage.setRedirect(true); 
        return retPage; 
        
    }

    public pagereference resetNewRecord(){
        PageReference newpage = new PageReference(System.currentPageReference().getURL());
        newpage.setRedirect(true);
        return newpage;
        
    }
}