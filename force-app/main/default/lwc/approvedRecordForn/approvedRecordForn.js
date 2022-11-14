import { api,LightningElement,wire,track } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Approved_Loans__c.Name';
import Interest from '@salesforce/schema/Approved_Loans__c.Interest__c';
import MonthEmi from '@salesforce/schema/Approved_Loans__c.Monthly_EMI__c';
import Months from '@salesforce/schema/Approved_Loans__c.Period_Months__c';
import Loan from '@salesforce/schema/Approved_Loans__c.Total_Loan_Amount__c';
import TotalInterest from '@salesforce/schema/Approved_Loans__c.Total_Interst__c';
import TotalPayment from '@salesforce/schema/Approved_Loans__c.Total_Payment__c';
import firstIn from '@salesforce/schema/Approved_Loans__c.firstIntrest__c';
import firstPr from '@salesforce/schema/Approved_Loans__c.FirstPrinciple__c';
import secondIn from '@salesforce/schema/Approved_Loans__c.secondEmi__c';
import secondPr from '@salesforce/schema/Approved_Loans__c.SecondBalance__c';
import thirdIn from '@salesforce/schema/Approved_Loans__c.thirdEmi__c';
import thirdPr from '@salesforce/schema/Approved_Loans__c.thirdBalance__c';
import fourthIn from '@salesforce/schema/Approved_Loans__c.forthEmi__c';
import fouthPr from '@salesforce/schema/Approved_Loans__c.forthBalance__c';
import fifthIn from '@salesforce/schema/Approved_Loans__c.fifthEmi__c';
import fifthPr from '@salesforce/schema/Approved_Loans__c.fifthBalance__c';
import sixthIn from '@salesforce/schema/Approved_Loans__c.SixthEmi__c';
import sixthPr from '@salesforce/schema/Approved_Loans__c.SixthBalance__c';
import seventhIn from '@salesforce/schema/Approved_Loans__c.seventhEmi__c';
import seventhPr from '@salesforce/schema/Approved_Loans__c.seventhBalance__c';
import eighthIn from '@salesforce/schema/Approved_Loans__c.eighthEmi__c';
import eighthPr from '@salesforce/schema/Approved_Loans__c.eighthBalance__c';
import ninthIn from '@salesforce/schema/Approved_Loans__c.ninthEmi__c';
import ninthPr from '@salesforce/schema/Approved_Loans__c.ninthBalance__c';
import tenthIn from '@salesforce/schema/Approved_Loans__c.tenthEmi__c';
import tenthPr from '@salesforce/schema/Approved_Loans__c.tenthBalance__c';
import elevenIn from '@salesforce/schema/Approved_Loans__c.elevenEmi__c';
import elevenPr from '@salesforce/schema/Approved_Loans__c.elevenBalance__c';
import tweleIn from '@salesforce/schema/Approved_Loans__c.TweleEmi__c';
import twelePr from '@salesforce/schema/Approved_Loans__c.tweleBalance__c';
import firstBa from '@salesforce/schema/Approved_Loans__c.First_Month_Balance__c';
import secondBa from '@salesforce/schema/Approved_Loans__c.Second_Month_Balance__c';
import thirdBa from '@salesforce/schema/Approved_Loans__c.Third_Month_Balance__c';
import fourthBa from '@salesforce/schema/Approved_Loans__c.Fourth_Month_Balance__c';
import fifthBa from '@salesforce/schema/Approved_Loans__c.Fifth_Month_Balance__c';
import sixthBa from '@salesforce/schema/Approved_Loans__c.Sixth_Moth_Balance__c';
import seventhBa from '@salesforce/schema/Approved_Loans__c.Seventh_Month_Balance__c';
import eighthBa from '@salesforce/schema/Approved_Loans__c.Eighth_Month_Balance__c';
import ninethBa from '@salesforce/schema/Approved_Loans__c.Ninth_Month_Balance__c';
import tenthBa from '@salesforce/schema/Approved_Loans__c.Tenth_Month_Balance__c';
import eleventhBa from '@salesforce/schema/Approved_Loans__c.Eleventh_Month_Balanace__c';
import twelthBa from '@salesforce/schema/Approved_Loans__c.Twelth_Month_Balance__c';





export default class ApprovedRecordForn extends LightningElement {
    @api recordId;
    @api objectApiName;

  fields = [NAME_FIELD,Interest,MonthEmi,Months,Loan];

  fields1 = [firstIn,firstPr,firstBa,secondIn,secondPr,secondBa,thirdIn,thirdPr,thirdBa,fourthIn,fouthPr,fourthBa,fifthIn,fifthPr,fifthBa,sixthIn,sixthPr,sixthBa,seventhIn,seventhPr,seventhBa,eighthIn,eighthPr,eighthBa,ninthIn,ninthPr,ninethBa
  ,tenthIn,tenthPr,tenthBa,elevenIn,elevenPr,eleventhBa,tweleIn,twelePr,twelthBa];





    
}