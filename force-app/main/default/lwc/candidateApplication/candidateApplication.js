import { api, LightningElement,wire,track  } from 'lwc';
import getAccounts from '@salesforce/apex/AccountSearchController.getAccounts';
import getAccounts1 from '@salesforce/apex/AccountSearchController.getAccounts1';
import candidate from '@salesforce/apex/AccountSearchController.candidate';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
export default class CandidateApplication extends NavigationMixin(LightningElement) {
    @api recordId;
    @track accountName = '';
    @track accountList = [];     
    @track accountId; 
    @track isshow=false;
    @track messageResult=false;
    @track isShowResult = true;   
    @track showSearchedValues = false;
    @track accountName1 = '';
@track accountList1 = [];     
@track accountId1; 
@track isshow1=false;
@track messageResult1=false;
@track isShowResult1 = true;   
@track showSearchedValues1 = false;   
  @wire(getAccounts, {actName:'$accountName'})
    retrieveAccounts1 ({error, data}) {
       this.messageResult=false;
       if (data) {
           // TODO: Error handling 
           console.log('data::'+data.length);
           if(data.length>0 && this.isShowResult){
               this.accountList = data;                
               this.showSearchedValues = true; 
               this.messageResult=false;
           }            
           else if(data.length==0){
               this.accountList = [];                
               this.showSearchedValues = false;
               if(this.accountName!='')
                   this.messageResult=true;               
           }  
               
       } else if (error) {
           // TODO: Data handling
           this.accountId =  '';
           this.accountName =  '';
           this.accountList=[];           
           this.showSearchedValues = false;
           this.messageResult=true;   
       }
   }
   handleClick(event){
    this.isShowResult = true;   
    this.messageResult=false;        
  }
  handleKeyChange(event){       
    this.messageResult=false; 
    this.accountName = event.target.value;
  }  
  handleParentSelection(event){        
    this.showSearchedValues = false;
    this.isShowResult = false;
    this.messageResult=false;
    //Set the parent calendar id
    this.accountId =  event.target.dataset.value;
    //Set the parent calendar label
    this.accountName =  event.target.dataset.label;      
    console.log('accountId::'+this.accountId);    
    const selectedEvent = new CustomEvent('selected', { detail: this.accountId });
        // Dispatches the event.
    this.dispatchEvent(selectedEvent);    
}
handleOpenModal(event){
    this.isshow = true;
    console.log('balaji:::');
}
handleCloseModal(event){
    this.isshow = false;
}
handleSuccess(event){       
    this.isShowResult = false;
    this.messageResult=false;
    this.isshow = false;
    this.accountId = event.detail.id;
    console.log(event.detail.id);
    //console.log('JSON OBject:'+JSON.stringify(event.detail));
    this.accountName = event.detail.fields.Name.value;
    const selectedEvent = new CustomEvent('selected', { detail: this.accountId });
    // Dispatches the event.
    this.dispatchEvent(selectedEvent);
}
handleReset(event) {
    const inputFields = this.template.querySelectorAll(
        'lightning-input-field'
    );
    if (inputFields) {
        inputFields.forEach(field => {
            field.reset();
        });
    }
     this.isshow = false;
}
@wire(getAccounts1, {actName1:'$accountName1'})
retrieveAccounts ({error, data}) {
    console.log(data);
    console.log('Vanakam');
   this.messageResult1=false;
   if (data) {
       // TODO: Error handling 
       console.log('data::'+data.length);
       if(data.length>0 && this.isShowResult1){
           this.accountList1 = data;                
           this.showSearchedValues1= true; 
           this.messageResult1=false;
       }            
       else if(data.length==0){
           this.accountList1 = [];                
           this.showSearchedValues1 = false;
           if(this.accountName1!='')
               this.messageResult1=true;               
       }  
           
   } else if (error) {
       // TODO: Data handling
       this.accountId1 =  '';
       this.accountName1 =  '';
       this.accountList1=[];           
       this.showSearchedValues1 = false;
       this.messageResult1=true;   
   }
}
handleClick1(event){
this.isShowResult1 = true;   
this.messageResult1=false;        
}
handleKeyChange1(event){       
this.messageResult1=false; 
this.accountName1 = event.target.value;
}  
handleParentSelection1(event){        
this.showSearchedValues1 = false;
this.isShowResult1 = false;
this.messageResult1=false;
//Set the parent calendar id
this.accountId1 =  event.target.dataset.value;
//Set the parent calendar label
this.accountName1 =  event.target.dataset.label;      
console.log('accountId::'+this.accountId1);    
const selectedEvent1 = new CustomEvent('selected', { detail: this.accountId1 });
    // Dispatches the event.
this.dispatchEvent1(selectedEvent1);    
}
handleOpenModal1(event){
this.isshow1 = true;
console.log('balaji:::');
}
handleCloseModal1(event){
this.isshow1 = false;
}
handleSuccess1(event){       
this.isShowResult1 = false;
this.messageResult1=false;
this.isshow1 = false;
this.accountId1 = event.detail.id;
console.log(event.detail.id);
//console.log('JSON OBject:'+JSON.stringify(event.detail));
this.accountName1 = event.detail.fields.Name.value;
const selectedEvent1 = new CustomEvent('selected', { detail: this.accountId1 });
// Dispatches the event.
this.dispatchEvent(selectedEvent1);
}
handleReset1(event) {
const inputFields1 = this.template.querySelectorAll(
    'lightning-input-field'
);
if (inputFields1) {
    inputFields1.forEach(field1 => {
        field1.reset();
    });
}
 this.isshow1 = false;
}

@track customerName;
@track LastName;
@track age;
@track DOB;
@track Mobile;
@track Exp;
@track street;
@track city;

valueChanged(event) {
    var inputTypeName = event.target.label;
    console.log('@@@@@ Input Event TValue @@@@@@@ '+inputTypeName);

   
    if(inputTypeName == 'Applicant Name') {
        this.customerName= event.detail.value;
        console.log('@@@@@ Loan Amount @@@@@@@ '+this.customerName);
    }
    if(inputTypeName == 'LastName') {
        this.LastName= event.detail.value;
        console.log('@@@@@ Loan Amount @@@@@@@ '+this.LastName);
    }
    if(inputTypeName == 'age') {
        this.age= event.detail.value;
        console.log('@@@@@ Loan Amount @@@@@@@ '+this.age);
    }
    if(inputTypeName == 'Date Of Birth') {
        this.DOB= event.detail.value;
        console.log('@@@@@ Loan Amount @@@@@@@ '+this.DOB);
    }
    if(inputTypeName == 'Mobile') {
        this.Mobile= event.detail.value;
        console.log('@@@@@ Loan Amount @@@@@@@ '+this.Mobile);
    }
    if(inputTypeName == 'How Many Months Experience In This Sport') {
        this.Exp= event.detail.value;
        console.log('@@@@@ Loan Amount @@@@@@@ '+this.Exp);
    }
    if(inputTypeName == 'Street') {
        this.street= event.detail.value;
        console.log('@@@@@ Loan Amount @@@@@@@ '+this.street);
    }

    if(inputTypeName == 'City') {
        this.city= event.detail.value;
        console.log('@@@@@ Loan Amount @@@@@@@ '+this.city);
    }

}
    handleOnSave() {
        console.log('sucess');
        
        
        candidate({accId: this.accountId,accId1 : this.accountId1,firstName: this.customerName, age : this.age, LastName : this.LastName, phone : this.Mobile, dob : this.DOB , exp : this.Exp ,strret : this.street,city : this.city})
                        .then(result => {
                            console.log('ss');
                            if(result==true) {
                                console.log('success');
                                 this.dispatchEvent(
                                        new ShowToastEvent({
                                            title: 'Success!!',
                                            message: "Application Applied Successfully.",
                                            variant: 'success'}),);
                            }
                        })
                        let cmpDef = {
                            componentDef : "c:caRecordForm"
                        };
                               let encodeDef = btoa(JSON.stringify(cmpDef));
                             this[NavigationMixin.Navigate]({
                                type: "standard__webPage",
                                attributes: {
                                url : '/one/one.app#'+encodeDef
                             }
                                })
                                
                    }
                }