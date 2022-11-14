import { api, LightningElement,track } from 'lwc';
import loan from '@salesforce/apex/loanApplicationForm.loanApplication';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class LoanApplicationForm extends NavigationMixin(LightningElement) {


    @api recordId;
    @track loanAmount;
    @track customerName;
    @track age;
    @track fatherName;
    @track phoneNumber;
    @track street;
    @track city;
    @track province;
    @track country;
    @track aadharNo;
    @track accountNo;
    @track bankName;
    @track IFSCCode;
    @track branch;
    @track streetOwn;
    @track cityOwn;
    @track provinceOwn;
    @track countryOwn;
    @track bikeName;
    @track modelNo;
    @track registrationNo;
    @track occupation;
    @track company;
    @track salary;
    @track loanAmountPeriod
    
    valueChanged(event) {
        var inputTypeName = event.target.label;
        console.log('@@@@@ Input Event TValue @@@@@@@ '+inputTypeName);
 
       
        if(inputTypeName == 'loanAmount') {
            this.loanAmount= event.detail.value;
            console.log('@@@@@ Loan Amount @@@@@@@ '+this.loanAmount);
        }
        if(inputTypeName == 'customerName') {
            this.customerName = event.detail.value;
            console.log('@@@@@ Customer Name @@@@@@@ '+this.customerName);
        }
        if(inputTypeName == 'age') {
            this.age = event.detail.value;
            console.log('@@@@@ Age @@@@@@@ '+this.age);
        }
        if(inputTypeName == 'fatherName') {
            this.fatherName = event.detail.value;
            console.log('@@@@@ fatherName @@@@@@@ '+this.fatherName);
        }
        if(inputTypeName == 'phoneNumber') {
            this.phoneNumber = event.detail.value;
            console.log('@@@@@ fatherName @@@@@@@ '+this.phoneNumber);
        }
        if(inputTypeName == 'street') {
            this.street = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.street);
        }
        if(inputTypeName == 'city') {
            this.city = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.city);
        }
        if(inputTypeName == 'province') {
            this.province = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.province);
        }
        if(inputTypeName == 'country') {
            this.country = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.country);
        }
        if(inputTypeName == 'aadharNo') {
            this.aadharNo = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.aadharNo);
        }
        if(inputTypeName == 'accountNo') {
            this.accountNo = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.accountNo);
        }
        if(inputTypeName == 'bankName') {
            this.bankName = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.bankName);
        }
        if(inputTypeName == 'IFSCCode') {
            this.IFSCCode = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.IFSCCode);
        }
        if(inputTypeName == 'branch') {
            this.branch = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.branch);
        }
        if(inputTypeName == 'streetOwn') {
            this.streetOwn = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.streetOwn);
        }
        if(inputTypeName == 'cityOwn') {
            this.cityOwn = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.cityOwn);
        }
        if(inputTypeName == 'provinceOwn') {
            this.provinceOwn = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.provinceOwn);
        }
        if(inputTypeName == 'countryOwn') {
            this.countryOwn = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.countryOwn);
        }
        if(inputTypeName == 'Vehicle Name') {
            this.bikeName = event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.bikeName);
        }
        if(inputTypeName == 'Model') {
            this.modelNo= event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.modelNo);
        }
        if(inputTypeName == 'Registration Number') {
            this.registrationNo= event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.registrationNo);
        }
        if(inputTypeName == 'Occupation') {
            this.occupation= event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.occupation);
        }
        if(inputTypeName == 'Company Name') {
            this.company= event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.company);
        }
        if(inputTypeName == 'Monthly Salary') {
            this.salary= event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.salary);
        }
        if(inputTypeName == 'loanAmountPeriod') {
            this.loanAmountPeriod= event.detail.value;
            console.log('@@@@@ street @@@@@@@ '+this.loanAmount);
        }
        
        
    }
    @track value1 = 'yes';

    get options1() {
        return [
            { label: 'Yes', value: 'Yes' },
            { label: 'No', value: 'No' },
            
        ];
    }

    handleChange1(event) {
        this.value1 = event.detail.value;
        console.log('Loan'+this.value1);
    }

    @track value2 = 'Yes';

    get options2() {
        return [
            { label: 'Yes', value: 'Yes' },
            { label: 'No', value: 'No' },
            
        ];
    }

    handleChange2(event) {
        this.value2 = event.detail.value;
        console.log('Loan'+this.value2);
    }


@track value = 'Vehicle Loan';

    get options() {
        return [
            { label: 'Gold Loan', value: 'Gold Loan' },
            { label: 'Vehicle Loan', value: 'Vehicle Loan' },
            { label: 'Personal Loan', value: 'Personal Loan' },
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
        console.log('Loan'+this.value);
    }
    
    handleOnSave() {
        console.log('sucess');
        console.log(this.value1);
        
        loan({loanAmount: this.loanAmount,customerName: this.customerName, age : this.age, fatherName : this.fatherName, phoneNumber : this.phoneNumber, street : this.street , city : this.city ,province : this.province,country : this.country,aadharNo : this.aadharNo,accountNo : this.accountNo,bankName : this.bankName,IFSCCode : this.IFSCCode,branch : this.branch,
            streetOwn : this.streetOwn,cityOwn : this.cityOwn,provinceOwn: this.provinceOwn,countryOwn : this.countryOwn,bikeName : this.bikeName,modelNo : this.modelNo,registrationNo : this.registrationNo,occupation : this.occupation,company : this.company,salary : this.salary,value : this.value,value1 : this.value1,value2 : this.value2,loanAmountPeriod : this.loanAmountPeriod})
                        .then(result => {
                            console.log('ss');
                            if(result==true) {
                                console.log('success');
                                 this.dispatchEvent(
                                        new ShowToastEvent({
                                            title: 'Success!!',
                                            message: "Loan Applied Successfully.",
                                            variant: 'success'}),);
                            }
                        })
                        let cmpDef = {
                            componentDef : "c:loanRecordPage"
                        };
                               let encodeDef = btoa(JSON.stringify(cmpDef));
                             this[NavigationMixin.Navigate]({
                                type: "standard__webPage",
                                attributes: {
                                url : '/one/one.app#'+encodeDef
                             }
                                })
                        .catch(error => {
                            
                         })
    }
    
}