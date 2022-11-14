import { api, LightningElement, track } from 'lwc'; 
import generateData from './generateDate';
  

const columns = [
    { label: 'name', fieldName: 'Name' },
    { label: 'website', fieldName: 'Age__c', type: 'Number' },
    { label: 'Tamil', fieldName: 'Tamil__c', type: 'Number' },
    { label: 'English', fieldName: 'English__C', type: 'Number' },
    { label: 'Social', fieldName: 'Social__C', type: 'Number' },
];


export default class BasicDatatable extends LightningElement {
    @api recordId;
    data = [];
    columns = columns;

}