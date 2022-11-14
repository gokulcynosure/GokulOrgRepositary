import { api,LightningElement } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Person__c.Name';
import Age_FIELD from '@salesforce/schema/Person__c.Last_Name__c';
import FatherName_FIELD from '@salesforce/schema/Person__c.Date_of_Birth__c';
import AadharNumber_FIELD from '@salesforce/schema/Person__c.Mobile_Number__c';
import Street_FIELD from '@salesforce/schema/Person__c.City__c';
import City_FIELD from '@salesforce/schema/Person__c.Address__c';
import City_FIELD1 from '@salesforce/schema/Person__c.Candidate_Application__c';

export default class PersonRecordForm extends LightningElement {
    @api recordId;
    @api objectApiName;
   
   
    fields = [NAME_FIELD,Age_FIELD,FatherName_FIELD,AadharNumber_FIELD,Street_FIELD,City_FIELD,City_FIELD1];
    
}