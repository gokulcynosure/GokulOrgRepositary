import { api,LightningElement } from 'lwc';
import LoanAmount_FIELD from '@salesforce/schema/Loan_Applications__c.Loan_Amount__c';
import LoanType_FIELD from '@salesforce/schema/Loan_Applications__c.Loan_Type__c';
import Months_FIELD from '@salesforce/schema/Loan_Applications__c.Period_Months__c';
import Loan_FIELD from '@salesforce/schema/Loan_Applications__c.Loan_Status__c';

export default class LoanDetailsRecordForm extends LightningElement {
    @api recordId;
    @api objectApiName;
    
    fields = [LoanType_FIELD,LoanAmount_FIELD,Months_FIELD,Loan_FIELD];

}