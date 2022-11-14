import { api,LightningElement, wire } from 'lwc';
import getPersons from "@salesforce/apex/CandidateHelper.getAllPerson"
import searchPersons from "@salesforce/apex/CandidateHelper.searchPerson"
import deletePersons from "@salesforce/apex/CandidateHelper.deletePerson"

import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';

const ACTIONS = [{label: 'Delete', name: 'delete'}]

const COLS = [{label: 'Person Name', fieldName: 'link', type: 'url', typeAttributes: {label: {fieldName: 'FullName'}}},
                {label : 'City',fieldName  :'city'},    
                
                
            
          
            { fieldName: "actions", type: 'action', typeAttributes: {rowActions: ACTIONS}}
]

export default class PersonRecordData extends NavigationMixin(LightningElement) {
    cols = COLS;
    @api recordId;
    contacts;
    wiredContacts;
    selectedContacts;
    baseData;

    get selectedContactsLen() {
        if(this.selectedContacts == undefined) return 0;
        return this.selectedContacts.length
    }

    
    @wire(getPersons)
    PersonWire(result){
        this.wiredContacts = result;
        console.log(this.wiredContacts);
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
        var city = row.City__c
        if(row.City__c== undefined){
           city = ''
        }
       
        

        return {...row,
            FullName: `${row.Name}`,
            link: `/${row.Id}`,
            
            city :`${row.City__c}`
            
           
        };
    }

    handleRowSelection(event){
        this.selectedContacts = event.detail.selectedRows;
    }

    async handleSearch(event){
        if(event.target.value == ""){
            this.contacts = this.baseData
        }else if(event.target.value.length > 1){
            const searchPersonss = await searchPersons({searchString: event.target.value})

            this.contacts = searchPersonss.map(row => {
                return this.mapContacts(row);
            })
        }
    }


    handleRowAction(event) {
        deletePersons({contactIds : [event.detail.row.Id]}).then(() => {
            refreshApex(this.wiredContacts);
        })
    }

    deleteSelectedContacts(){
        const idList = this.selectedContacts.map( row => { return row.Id })
        console.log(idList);
        deletePersons({contactIds : idList}).then( () => {
            refreshApex(this.wiredContacts);
        })
        this.template.querySelector('lightning-datatable').selectedRows = [];
        this.selectedContacts = undefined;
    }
}