import {api, LightningElement,wire } from 'lwc';
import child_Records from '@salesforce/apex/getChild.childRec';;
const columns = [
    { label: 'Month', fieldName: 'Month__c',type : 'number',sortable: "true" },
    { label: 'Month Starting Balance', fieldName: 'Starting_Balance__c',type: 'currency' },
    { label: 'Month Interest', fieldName: 'Month_Interest__c',type: 'currency' },
    { label: 'Month Principle', fieldName: 'Month_Principle__c',type: 'currency' },
    { label: 'Month EndingBalance', fieldName: 'Month_Ending_Balance__c',type: 'currency' },
    
];
export default class ChildRecordsInTable extends LightningElement {

    @api recordId;
    @api buttonLabel ="Payment Schedule"

    data = [];
    columns = columns;

    @api showDataTable = false;

   childTempArray = [];


    handleShow(event){
        if(event.target.label == "Payment Schedule"){
            this.buttonLabel = "Hide";
            this.showDataTable = true;
        }

        else if(event.target.label == "Hide"){
            this.buttonLabel =="PaymentSchedule";
            this.showDataTable = false;
        }
    }

   connectedCallback(){
    console.log("vanakam");
    child_Records({recordId : this.recordId})
    .then( res=>{
        let tempRecord = res;
        console.log(tempRecord);

        let temp = tempRecord.map(row =>{
            return Object.assign({Month_Interest__c: row.Payment_Schedules__r

            })
        })

        temp.forEach(element => {
            this.childTempArray = element.Month_Interest__c;
            
        });

        this.data = this.childTempArray;
        console.log("Hi");
    })
    .catch(error =>{
        console.log(Json.stringify(error));
    })
}
defaultSortDirection = 'asc';
    sortDirection = 'asc';
    sortedBy;
 
    // Used to sort the 'Age' column
    sortBy(field, reverse, primer) {
        const key = primer
            ? function(x) {
                  return primer(x[field]);
              }
            : function(x) {
                  return x[field];
              };
 
        return function(a, b) {
            a = key(a);
            b = key(b);
            return reverse * ((a > b) - (b > a));
        };
    }
 
    onHandleSort(event) {
        const { fieldName: sortedBy, sortDirection } = event.detail;
        const cloneData = [...this.data];
 
        cloneData.sort(this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1));
        this.data = cloneData;
        this.sortDirection = sortDirection;
        this.sortedBy = sortedBy;
    }
}