public class CandidateApplicationTriggerHandler extends TriggerHandler {

    protected override void afterInsert(){
        List<Person__c>perList=new List<Person__c>();
        for(Candidate_Application__c acc:(List<Candidate_Application__c>) Trigger.new){
            if(acc.Application_Status__c == 'Approved'){
            Person__c per=new Person__c();
            per.Name = acc.Name;
            per.Last_Name__c = acc.Last_Name__c;
            per.Date_Of_Birth__c= acc.Date_Of_Birth__c;
            per.City__c = acc.City__c;
            per.Address__c = acc.Address__c;
            per.Mobile_Number__c = acc.Mobile_Number__c;
            per.Email__c = acc.Email__c;
            per.Candidate_Application__c = acc.Id;
            perList.add(per);
            }
        }
        insert PerList;
      }
    }