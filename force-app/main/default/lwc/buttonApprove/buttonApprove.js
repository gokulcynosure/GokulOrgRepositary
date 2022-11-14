import { track,api,LightningElement } from 'lwc';
import approveLoan from '@salesforce/apex/Approved.approve';
import declineLoan from '@salesforce/apex/Approved.decline';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class ButtonApprove extends LightningElement {
    @api recordId;
    @track id;

    

   

    handleOnApprove(){
        this.id = this.recordId;
        console.log(this.id);
        approveLoan({recordId : this.id}).then(result => {
            console.log(this.id1);
            if(result==true) {
                 this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success!!',
                            message: "Loan Approved Successfully.",
                            variant: 'success'}),);
            }
        })
        .catch(error => { })
        console.log('s');
}

handleOnDecline(){
    this.id = this.recordId;
    console.log(this.id);
    declineLoan({recordId : this.id}).then(result => {
        console.log(this.id1);
        if(result==true) {
             this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success!!',
                        message: "Loan Rejected  Successfully.",
                        variant: 'success'}),);
        }
    })
    .catch(error => { })
    console.log('s');
}
    }