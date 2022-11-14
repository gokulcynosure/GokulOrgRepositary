import { api,LightningElement } from 'lwc';
import LoanAmount_FIELD from '@salesforce/schema/Candidate_Application__c.Name';
import LoanType_FIELD from '@salesforce/schema/Candidate_Application__c.Last_Name__c';
import Months_FIELD from '@salesforce/schema/Candidate_Application__c.Age__c';
import Loan_FIELD from '@salesforce/schema/Candidate_Application__c.Date_of_Birth__c';
import Loan_FIELD1 from '@salesforce/schema/Candidate_Application__c.Mobile_Number__c';
export default class CandidatePersonal extends LightningElement {
    @api recordId;
    @api objectApiName;
    
    fields = [LoanType_FIELD,LoanAmount_FIELD,Months_FIELD,Loan_FIELD,Loan_FIELD1];
}