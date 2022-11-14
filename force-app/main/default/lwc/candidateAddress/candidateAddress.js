import {api, LightningElement } from 'lwc';
import LoanAmount_FIELD from '@salesforce/schema/Candidate_Application__c.Address__c';
import LoanType_FIELD from '@salesforce/schema/Candidate_Application__c.City__c';
export default class CandidateAddress extends LightningElement {
    @api recordId;
    @api objectApiName;
    
    fields = [LoanType_FIELD,LoanAmount_FIELD];

}