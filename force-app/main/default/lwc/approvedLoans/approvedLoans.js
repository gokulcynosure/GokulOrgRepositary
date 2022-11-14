import { LightningElement, wire } from 'lwc';

import getAllLoan from "@salesforce/apex/ApprovedHelper.getAllLoan"
import searchLoan from "@salesforce/apex/ApprovedHelper.searchLoan"
import deleteLoan from "@salesforce/apex/ApprovedHelper.deleteLoan"

import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';

const ACTIONS = [{label: 'Delete', name: 'delete'}]

const COLS = [{label: 'Customer Name', fieldName: 'link', type: 'url', typeAttributes: {label: {fieldName: 'FullName'}}},
                {label : 'Total Loan Amount',fieldName  :'loanAmount',type:'currency'},    
                {label : 'Periods(Months)' ,fieldName : 'month',type : 'number'},
                
            
          
            { fieldName: "actions", type: 'action', typeAttributes: {rowActions: ACTIONS}}
]

export default class ApprovedLoans extends NavigationMixin(LightningElement) {
    cols = COLS;
    contacts;
    wiredContacts;
    selectedContacts;
    baseData;

    get selectedContactsLen() {
        if(this.selectedContacts == undefined) return 0;
        return this.selectedContacts.length
    }

    @wire(getAllLoan)
    LoanWire(result){
        this.wiredContacts = result;
        if(result.data){
            this.contacts = result.data.map((row) => {
                return this.mapContacts(row);
            })
            this.baseData = this.contacts;
        }
        if(result.error){
            console.error(result.error);
        }
    }

    mapContacts(row){
      
       

        
        var Name = row.Name
        if(row.Name == undefined){
            Name = ''
        }
        var month = row.Period_Months__c
        if(row.Period_Months__c== undefined){
            month = ''
        }
        var loanAmount = row.Total_Loan_Amount__c
        if(row.Total_Loan_Amount__c== undefined){
            loanAmount = ''
        }
        

        return {...row,
            FullName: `${row.Name}`,
            link: `/${row.Id}`,
            month : `${row.Period_Months__c}`,
            loanAmount :`${row.Total_Loan_Amount__c}`
            
           
        };
    }

    handleRowSelection(event){
        this.selectedContacts = event.detail.selectedRows;
    }

    async handleSearch(event){
        if(event.target.value == ""){
            this.contacts = this.baseData
        }else if(event.target.value.length > 1){
            const searchLoans = await searchLoan({searchString: event.target.value})

            this.contacts = searchLoans.map(row => {
                return this.mapContacts(row);
            })
        }
    }


    handleRowAction(event) {
        deleteLoan({contactIds : [event.detail.row.Id]}).then(() => {
            refreshApex(this.wiredContacts);
        })
    }

    deleteSelectedContacts(){
        const idList = this.selectedContacts.map( row => { return row.Id })
        deleteLoan({contactIds : idList}).then( () => {
            refreshApex(this.wiredContacts);
        })
        this.template.querySelector('lightning-datatable').selectedRows = [];
        this.selectedContacts = undefined;
    }
}