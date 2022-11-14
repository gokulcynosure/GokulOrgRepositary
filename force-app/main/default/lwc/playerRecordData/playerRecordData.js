import { api,LightningElement, wire } from 'lwc';
import getAllPlayers from "@salesforce/apex/CandidateHelper.getAllPlayers"
import SearchPlayers from "@salesforce/apex/CandidateHelper.searchPlayers"
import deletePlayers from "@salesforce/apex/CandidateHelper.deletePlayers"

import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';

const ACTIONS = [{label: 'Delete', name: 'delete'}]

const COLS = [{label: 'Person Name', fieldName: 'link', type: 'url', typeAttributes: {label: {fieldName: 'FullName'}}},
                {label : 'Sport',fieldName  :'sport'},
                {label : 'Level',fieldName  :'level'},       
                
                
            
          
            { fieldName: "actions", type: 'action', typeAttributes: {rowActions: ACTIONS}}
]


export default class PlayerRecordData extends NavigationMixin(LightningElement) {
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

    
    @wire(getAllPlayers)
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
        var sport = row.Sport__c
        if(row.Sport__c== undefined){
           sport = ''
        }
        var level = row.Sport_Level__c
        if(row.Sport_Level__c== undefined){
           level = ''
        }
       
        

        return {...row,
            FullName: `${row.Name}`,
            link: `/${row.Id}`,
            level :`${row.Sport_Level__c}`,
            sport :`${row.Sport__c}`
            
           
        };
    }

    handleRowSelection(event){
        this.selectedContacts = event.detail.selectedRows;
    }

    async handleSearch(event){
        if(event.target.value == ""){
            this.contacts = this.baseData
        }else if(event.target.value.length > 1){
            const SearchPlayerss = await SearchPlayers({searchString: event.target.value})

            this.contacts = SearchPlayerss.map(row => {
                return this.mapContacts(row);
            })
        }
    }


    handleRowAction(event) {
        deletePlayers({contactIds : [event.detail.row.Id]}).then(() => {
            refreshApex(this.wiredContacts);
        })
    }

    deleteSelectedContacts(){
        const idList = this.selectedContacts.map( row => { return row.Id })
        console.log(idList);
        deletePlayers({contactIds : idList}).then( () => {
            refreshApex(this.wiredContacts);
        })
        this.template.querySelector('lightning-datatable').selectedRows = [];
        this.selectedContacts = undefined;
    }
}