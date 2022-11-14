import { api,LightningElement } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Loan_Applications__c.Name';
import Age_FIELD from '@salesforce/schema/Loan_Applications__c.Age__c';
import FatherName_FIELD from '@salesforce/schema/Loan_Applications__c.Father_Name__c';
import AadharNumber_FIELD from '@salesforce/schema/Loan_Applications__c.Aadhar_Number__c';
import Street_FIELD from '@salesforce/schema/Loan_Applications__c.Street__c';
import City_FIELD from '@salesforce/schema/Loan_Applications__c.City__c';
import Province_FIELD from '@salesforce/schema/Loan_Applications__c.Province__c';
import country_FIELD from '@salesforce/schema/Loan_Applications__c.Country__c';



export default class LoanApplicationRecordForm extends LightningElement {
    @api recordId;
    @api objectApiName;

  fields = [NAME_FIELD,Age_FIELD,FatherName_FIELD,AadharNumber_FIELD];
  fields1 = [Street_FIELD,City_FIELD,Province_FIELD,country_FIELD];
 
    
}