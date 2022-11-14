import { api,LightningElement } from 'lwc';
import Bank_FIELD from '@salesforce/schema/Loan_Applications__c.Occupation__c';
import accNo_FIELD from '@salesforce/schema/Loan_Applications__c.Company_Name__c';
import IFSC_FIELD from '@salesforce/schema/Loan_Applications__c.Month_Salary__c';

export default class EmployementDetails extends LightningElement {
    @api recordId;
    @api objectApiName;
    
    fields = [Bank_FIELD,accNo_FIELD,IFSC_FIELD];
}