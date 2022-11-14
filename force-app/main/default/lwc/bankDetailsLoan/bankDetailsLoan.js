import { api,LightningElement } from 'lwc';
import Bank_FIELD from '@salesforce/schema/Loan_Applications__c.Bank_Name__c';
import accNo_FIELD from '@salesforce/schema/Loan_Applications__c.Account_Number__c';
import IFSC_FIELD from '@salesforce/schema/Loan_Applications__c.IFSC_Code__c';
import Branch_FIELD from '@salesforce/schema/Loan_Applications__c.Branch_Name__c';

export default class BankDetailsLoan extends LightningElement {
    @api recordId123;
    @api objectApiName;
    
    fields = [Bank_FIELD,accNo_FIELD,IFSC_FIELD,Branch_FIELD];
}