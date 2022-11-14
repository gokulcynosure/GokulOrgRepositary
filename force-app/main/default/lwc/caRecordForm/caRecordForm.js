import { api,LightningElement,wire } from 'lwc';
import getAllLoan from "@salesforce/apex/CandidateHelper.getAllApplications";
import searchLoan from "@salesforce/apex/CandidateHelper.searchApplications";
import deleteLoan from "@salesforce/apex/CandidateHelper.deleteApplication";

import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';

const ACTIONS = [{label: 'Delete', name: 'delete'}]

const COLS = [{label: 'Candidate Name', fieldName: 'link', type: 'url', typeAttributes: {label: {fieldName: 'FullName'}}},
            {label: 'Application Status', fieldName: 'Email'},
          
            { fieldName: "actions", type: 'action', typeAttributes: {rowActions: ACTIONS}}
]

export default class caRecordForm extends  NavigationMixin(LightningElement) {
    @api recordId;
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
        var Status = row.Application_Status__c
        if(row.Application_Status__c == undefined){
            Status = ''
        }
        

        return {...row,
            FullName: `${row.Name}`,
            link: `/${row.Id}`,
            Email : `${row.Application_Status__c}`
           
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

    navigateToNewRecordPage() {
let cmpDef = {
    componentDef : "c:candidateApplication"
};
       let encodeDef = btoa(JSON.stringify(cmpDef));
     this[NavigationMixin.Navigate]({
        type: "standard__webPage",
        attributes: {
        url : '/one/one.app#'+encodeDef
     }
        });
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