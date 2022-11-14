import { api,LightningElement } from 'lwc';
import OwnHouse_FIELD from '@salesforce/schema/Loan_Applications__c.Own_House__c';
import street_FIELD from '@salesforce/schema/Loan_Applications__c.Street_Own__c';
import city_FIELD from '@salesforce/schema/Loan_Applications__c.City_Own__c';
import country_FIELD from '@salesforce/schema/Loan_Applications__c.Country_Own__c';
import province_FIELD from '@salesforce/schema/Loan_Applications__c.Province_Own__c';
import ownVehi_FIELD from '@salesforce/schema/Loan_Applications__c.Own_Vehicle__c';
import name_FIELD from '@salesforce/schema/Loan_Applications__c.Vehicle_Name__c';
import model_FIELD from '@salesforce/schema/Loan_Applications__c.Model__c';
import regNo_FIELD from '@salesforce/schema/Loan_Applications__c.Registration_Number__c';

export default class PropertyDetails extends LightningElement {
    @api recordId;
    @api objectApiName;

  fields = [OwnHouse_FIELD,street_FIELD,city_FIELD,province_FIELD,country_FIELD];
  fields1 = [ownVehi_FIELD,name_FIELD,model_FIELD,regNo_FIELD];
}