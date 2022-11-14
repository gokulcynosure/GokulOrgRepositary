import { LightningElement,api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Student__c.Name';
import TAMIL_MARK from '@salesforce/schema/Student__c.Tamil__c';
import ENGLISH_MARK from '@salesforce/schema/Student__c.English__c';
import MATHS_MARK from '@salesforce/schema/Student__c.Maths__c';
import SCIENCE_MARK from '@salesforce/schema/Student__c.Science__c';
import SOCIAL_MARK from '@salesforce/schema/Student__c.Social__c';
import TOTAL from '@salesforce/schema/Student__c.Total__c';
import GRADE from '@salesforce/schema/Student__c.Grade__c';
import PERCENTAGE from '@salesforce/schema/Student__c.percentage__c';


export default class StudentDetailFrom extends LightningElement {

    fields = [NAME_FIELD,TAMIL_MARK,ENGLISH_MARK,MATHS_MARK,SCIENCE_MARK,SOCIAL_MARK,TOTAL,GRADE,PERCENTAGE];
    
    @api recordId;
    @api objectApiName;
}