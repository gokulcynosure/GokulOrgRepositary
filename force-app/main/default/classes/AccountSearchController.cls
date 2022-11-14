public with sharing class AccountSearchController {
    public AccountSearchController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Sport__c> getAccounts(String actName){
        List<Sport__c> accountList = new List<Sport__c>();
        if(actName!=''){
            String accountName = '%' + actName + '%';
            accountList = [select id,name from Sport__c where name like:accountName];
            return accountList;  
        }
        return accountList;
              
    }
    @AuraEnabled(cacheable=true)
    public static List<Sport_Level__c> getAccounts1(String actName1){
        List<Sport_Level__c> accountList1 = new List<Sport_Level__c>();
        if(actName1!=''){
            String accountName1 = '%' + actName1 + '%';
            accountList1 = [select id,name from Sport_Level__c where name like:accountName1];
            return accountList1;  
        }
        return accountList1;
              
    }

    @AuraEnabled
    public static boolean candidate(Id accId,Id accId1,String firstName,String LastName,Integer age,String phone,Date dob,Integer exp,String strret,String city){
        Candidate_Application__c ca = new Candidate_Application__c();
        Id basic;
        Id junior;
        Id senior;
        system.debug('Hi');
        try {
           ca.Name = firstName;
           ca.Last_Name__c = LastName;
           ca.Age__c = age;
           ca.Mobile_Number__c = phone;
           ca.Date_of_Birth__c = dob;
           ca.Sport__c = accId;
           ca.Address__c = strret;
           ca.City__c = city;
           ca.No_Of_Experience_Months__c = exp;
           ca.Sport_Level__c = accId1;
           system.debug('levelId'+accId1);
            String levelName;
           List<Sport_Level__c> level = [Select Name From Sport_Level__c where id  =:accId1];

           for(Sport_Level__c lv : level){
            levelName = lv.Name;
           }
           system.debug(levelName);
           system.debug(exp);
           if(levelName == 'Basic'){
            ca.Application_Status__c = 'Approved';
           }Else If(levelName == 'Junior' && exp >5 ){
            ca.Application_Status__c = 'Approved';
           }Else If(levelName == 'Senior' && exp > 11){
            system.debug(ca.Application_Status__c);
            ca.Application_Status__c = 'Approved';
           }
           
           ELSE{
            ca.Application_Status__c = 'Rejected';
           }

           Insert ca;
           system.debug('Application'+ ca);
        } catch (Exception e) {
          return false; 
        }

        return true;
    }
}