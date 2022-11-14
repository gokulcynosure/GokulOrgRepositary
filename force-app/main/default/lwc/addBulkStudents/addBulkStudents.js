import { track,api,LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import addBulkStudents1 from '@salesforce/apex/studentServiceHandler.addBulkStudents';



export default class AddBulkStudents extends LightningElement {

    @api recordId;
    @track name1;
    @track marks1;

    valueChanged(event) {
        var inputTypeName = event.target.label;
        console.log('@@@@@ Input Event TValue @@@@@@@ '+inputTypeName);

        if(inputTypeName == 'name1') {
            this.name1 = event.detail.value;
            console.log('@@@@@ Name @@@@@@@ '+this.name1);
        }
        if(inputTypeName == 'marks1') {
            this.marks1 = event.detail.value;
            console.log('@@@@@ Fathers Name @@@@@@@ '+this.marks1);
        }
    }

        handleOnAdd(){

            console.log('name'+ this.name1);
            console.log('marks'+ this.marks1);

            addBulkStudents1({ name1 : this.name1,marks1 : this.marks1})
            .then(result => {
                
                if(result==true) {
                     this.dispatchEvent(
                            new ShowToastEvent({
                                title: 'Success!!',
                                message: "Student Record Created Successfully.",
                                variant: 'success'}),);
                }else{
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'FAILURE!!',
                            message: "Student Record WAS NOT Created .",
                            variant: 'Failure'}),);
                }
            })
            .catch(error => { })

            }


        }