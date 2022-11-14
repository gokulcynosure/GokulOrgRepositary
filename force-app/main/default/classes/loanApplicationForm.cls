public with sharing class loanApplicationForm {
    
    @AuraEnabled
    
public static boolean loanApplication(Decimal loanAmount,String customerName,Decimal age,String fatherName,Decimal phoneNumber,String street,String city,String province,String country,Decimal aadharNo,Decimal accountNo,
    String bankName,Decimal IFSCCode,String branch,String streetOwn,String cityOwn,String provinceOwn,String countryOwn,String bikeName,Decimal modelNo,
    String registrationNo,String occupation,String company,Decimal salary,String value,String value1,String value2,Decimal loanAmountPeriod){
        
        Loan_Applications__c loan = new Loan_Applications__c();
        SYSTEM.debug(cityOwn);
        system.debug(provinceOwn);
        system.debug(countryOwn);
        
        try {
            loan.Name = customerName;
            loan.Aadhar_Number__c =aadharNo;
            loan.Account_Number__c = accountNo;
            loan.Age__c = age;
            loan.Bank_Name__c = bankName;
            loan.Branch_Name__c = branch;
            loan.City__c = city;
            loan.City_Own__c = cityOwn;
            loan.Company_Name__c = company;
            loan.Country__c = country;
            loan.Country_Own__c = countryOwn;
            loan.Father_Name__c =fatherName;
            loan.IFSC_Code__c = IFSCCode;
            loan.Loan_Amount__c = loanAmount;
            loan.Loan_Type__c =value;
            loan.Model__c =modelNo;
            loan.Month_Salary__c = salary;
            loan.Occupation__c = occupation;
            loan.Own_House__c = value1;
            loan.Own_Vehicle__c = value2;
            loan.Province__c = province;
            loan.Province_Own__c =provinceOwn;
            loan.Registration_Number__c = registrationNo;
            loan.Street__c = street;
            loan.Street_Own__c = streetOwn;
            loan.Vehicle_Name__c = bikeName;
            loan.Period_Months__c = loanAmountPeriod;
           
            insert loan;
            System.debug(loan);
            
        } catch (Exception e) {
            system.debug(loan);
            return false;
            
        }
        return true;
    }

   
}