import { api,LightningElement } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Player__c.Name';
import Age_FIELD from '@salesforce/schema/Player__c.Last_Name__c';
import FatherName_FIELD from '@salesforce/schema/Player__c.Enrollment_Date__c';
import AadharNumber_FIELD from '@salesforce/schema/Player__c.Sport__c';
import Street_FIELD from '@salesforce/schema/Player__c.Sport_Level__c';
import City_FIELD from '@salesforce/schema/Player__c.Person__c';
import Province_FIELD from '@salesforce/schema/Player__c.Total_Fees__c';
import country_FIELD from '@salesforce/schema/Player__c.Total_Paid__c';
import country_FIELD1 from '@salesforce/schema/Player__c.Balance__c';

export default class PlayerRecordForm extends LightningElement {
    @api recordId;
    @api objectApiName;

  fields = [NAME_FIELD,Age_FIELD,City_FIELD,FatherName_FIELD,AadharNumber_FIELD,Street_FIELD];
  fields1 = [,Province_FIELD,country_FIELD,country_FIELD1];
}