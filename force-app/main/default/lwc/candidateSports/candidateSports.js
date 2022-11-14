import {api, LightningElement } from 'lwc';
import LoanAmount_FIELD from '@salesforce/schema/Candidate_Application__c.Sport__c';
import LoanType_FIELD from '@salesforce/schema/Candidate_Application__c.Sport_Level__c';
import Months_FIELD from '@salesforce/schema/Candidate_Application__c.No_Of_Experience_Months__c';
import Months_FIELD1 from '@salesforce/schema/Candidate_Application__c.Application_Status__c';
export default class CandidateSports extends LightningElement {
    @api recordId;
    @api objectApiName;
    
    fields = [LoanType_FIELD,LoanAmount_FIELD,Months_FIELD,Months_FIELD1];

}