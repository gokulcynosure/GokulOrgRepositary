import { api, LightningElement, track } from 'lwc';
import addStudent from '@salesforce/apex/studentServiceHandler.saveStudent';
import updateStudent from '@salesforce/apex/studentServiceHandler.updateStudent';
import delStudent from '@salesforce/apex/studentServiceHandler.delStudent';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class StudentOperationsController extends LightningElement {
   

   @api recordId;
  
   @track name;
   @track tamilMark;
   @track englishMark;
   @track mathsMark;
   @track scienceMark;
   @track socialMark;
   @track age;
   @track date1;

  

   valueChanged(event) {
       var inputTypeName = event.target.label;
       console.log('@@@@@ Input Event TValue @@@@@@@ '+inputTypeName);

       if(inputTypeName == 'name') {
           this.name = event.detail.value;
           console.log('@@@@@ Name @@@@@@@ '+this.name);
       }
       if(inputTypeName == 'Tamil Mark') {
           this.tamilMark = event.detail.value;
           console.log('@@@@@ Fathers Name @@@@@@@ '+this.tamilMark);
       }
       if(inputTypeName == 'English Mark') {
        this.englishMark = event.detail.value;
        console.log('@@@@@ English Mark @@@@@@@ '+this.englishMark);
    }
    if(inputTypeName == 'Maths Mark') {
        this.mathsMark = event.detail.value;
        console.log('@@@@@ Maths Mark @@@@@@@ '+this.mathsMark);
    }
    if(inputTypeName == 'Science Mark') {
        this.scienceMark = event.detail.value;
        console.log('@@@@@ Science Mark @@@@@@@ '+this.scienceMark);
    }
    if(inputTypeName == 'Social Mark') {
        this.socialMark = event.detail.value;
        console.log('@@@@@ Social Mark @@@@@@@ '+this.socialMark);
    }
    if(inputTypeName == 'age') {
        this.age = event.detail.value;
        console.log('@@@@@ Social Mark @@@@@@@ '+this.age);
    }
    
    if(inputTypeName == 'Date Of Birth') {
        this.date1 = event.detail.value;
        console.log('@@@@@ Social Mark @@@@@@@ '+this.date1);
    }
    }
   handleOnSave() {
       console.log('@@@@@@@@ Name @@@@@@@'+this.name);
       console.log('@@@@@@@@ Fathers Namw @@@@@@@'+this.TamilMark);
       addStudent({name: this.name, tamilMark : this.tamilMark, englishMark : this.englishMark, mathsMark : this.mathsMark, scienceMark : this.scienceMark, socialMark : this.socialMark , age : this.age ,date1 : this.date1})
                       .then(result => {
                           if(result==true) {
                                this.dispatchEvent(
                                       new ShowToastEvent({
                                           title: 'Success!!',
                                           message: "Student Record Created Successfully.",
                                           variant: 'success'}),);
                           }
                       })
                       .catch(error => { })
   }
   handleOnDelete() {
    delStudent({name:this.name})
    .then(result => {
        if(result==true) {
             this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success!!',
                        message: "Student Record Deleted Successfully.",
                        variant: 'success'}),);
        }
    })
    .catch(error => { })

   }
   handleOnUpdate() {
    updateStudent({name: this.name, tamilMark : this.tamilMark, englishMark : this.englishMark, mathsMark : this.mathsMark, scienceMark : this.scienceMark, socialMark : this.socialMark})
   .then(result => {
       if(result==true) {
            this.dispatchEvent(
                   new ShowToastEvent({
                       title: 'Success!!',
                       message: "Student Record Updated Successfully.",
                       variant: 'success'}),);
       }
   })
   .catch(error => { })

   }
}