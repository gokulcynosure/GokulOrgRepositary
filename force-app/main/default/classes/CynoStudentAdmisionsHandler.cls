public with sharing class CynoStudentAdmisionsHandler {
    public Set<CynoStudent> studentsSet {get;set;}
    
    public CynoStudentAdmisionsHandler() {
        this.studentsSet = new Set<CynoStudent>();
    }
    public void addStudent(CynoStudent student) {
      this.studentsSet.add(student);
    }
   
    public Integer getStudentCount() {
        return 0;
    }
    public  Integer getWorkingMothersCount()  {
      return 0;
    }
    public Integer getWorkingFathersCount() {
        return 0;
    }
    public Decimal getTotalParentsSalaryOfStudent(CynoStudent student) {
        return 0;
    }
    public Integer getStudentCountLessThanSalary(Decimal salaryThreshold) {
        return 0;
    }
    public Integer getHowManyStudentsShouldGetDiscountOnParentsSalary(Decimal salaryThreshold) {
        return 0;
    }
    /*public Integer getTotalSalaryofMothers(){
        Integer totalSalary=0; 
        for(CynoStudent stud: studentsSet){
            CynoParent mother = stud.mother;
            totalSalary=totalSalary+mother.yearSalary;
        }
        return totalSalary;
    }/*/   
    public List<CynoStudent> getLstOfStudsWhoseMothersSalMoreThanFathersSal() {
        List<CynoStudent> studentsList= new List<CynoStudent>();
        for(CynoStudent student : this.studentsSet) {
            CynoParent mother = student.mother;
            CynoParent father = student.father;
            
        CynoParent highestParentInSal = CynosureGenericUtility.getRecordWithMoreSalary(mother, father);
             if(highestParentInSal ==  mother) {
                studentsList.add(student);
                System.debug('@@@45@@@'+studentsList);
            }
 }
        return studentsList;
    }

public List<CynoStudent> getLstOfStudsWhoseDadSalMoreThanMotherSal() {
    List<CynoStudent> studentsList = new List<CynoStudent>();
    for(CynoStudent student : this.studentsSet) {
        CynoParent mother = student.mother;
        CynoParent father = student.father;
        
    CynoParent highestParentInSal = CynosureGenericUtility.getRecordWithMoreSalary(father,mother);
         if(highestParentInSal ==  father) {
            studentsList.add(student);
            system.debug('@@@34@@@'+studentsList);
        }
    }
    return studentsList;
}

public List<CynoStudent> getLstOfStudsWhoseMotherIsUnEmployed() {
    List<CynoStudent> studentsList = new List<CynoStudent>();
    for(CynoStudent student : this.studentsSet) {
        CynoParent mother = student.mother;
        if (mother.unEmployee == true) {
            studentsList.add(student);
            system.debug('@@@34@@@'+studentsList);
        }
        
    }

    return studentsList;
}

public List<CynoStudent> getLstOfStudsWhoseFatherIsUnEmployed() {
    List<CynoStudent> studentsList = new List<CynoStudent>();
    for(CynoStudent student : this.studentsSet) {
        CynoParent father = student.father;
        if (father.unEmployee == true) {
            studentsList.add(student);
            system.debug('@@@38@@@'+studentsList);
        }
        
    }

    return studentsList;
}

public List<CynoStudent> getLstOfStudsWhosePermanentAddressIsDifferFromCurrentAddress(){
    List<CynoStudent> studentList = new List <CynoStudent>();
    for(CynoStudent student : this.studentsSet){
        CynoAddress permanentAddress = student.permanentAddress;
        CynoAddress currentAddress = student.currentAddress;
        
CynoAddress differentAddress = CynosureGenericUtility.getRecordDifferentAddress(permanentAddress,currentAddress);
        if(differentAddress == permanentAddress){
            studentList.add(student);
        system.debug('@@@30@@@'+studentList);
        }
    }
    
    return studentList;
}

public List<CynoStudent>getLstOfStudsWhoHaveSameAddressAsPermanentandCurrentAddress(){
    List<CynoStudent> studentList = new List <CynoStudent>();
    for(CynoStudent student : this.studentsSet){
        CynoAddress permanentAddress = student.permanentAddress;
        CynoAddress currentAddress = student.currentAddress;
        

CynoAddress differentAddress = CynosureGenericUtility.getRecordDifferentAddress(permanentAddress,currentAddress);
        if(differentAddress == currentAddress){
            studentList.add(student);
        system.debug('@@@303@@@'+studentList);
        }
    }
    
    return studentList;
}

public List<CynoStudent>getLstOfStudentsWhoseBothParentsAReUnemployeed(){
    List<CynoStudent>studentsList = new List <CynoStudent>();
    for(CynoStudent student : this.studentsSet){
    CynoParent father = student.father;
    CynoParent mother = student.mother;

CynoParent bothParentsAreUnemployeed =CynosureGenericUtility.getRecordWithBothParentsAreUnemployee(mother,father);
    if (bothParentsAreUnemployeed == mother){
    studentsList.add(student);
        system.debug('@@@302@@@'+studentsList);
        }
}
return studentsList;
}
public List<CynoStudent> getLstOfStudentsWhoseHaveemployeedParents(){
    List<CynoStudent>studentsList = new List <CynoStudent>();
    for(CynoStudent student : this.studentsSet)
{
    CynoParent father = student.father;
    CynoParent mother = student.mother;

CynoParent bothParentsAreUnemployeed =CynosureGenericUtility.getRecordWithBothParentsAreUnemployee(mother,father);
    if (bothParentsAreUnemployeed == father){
    studentsList.add(student);
        system.debug('@@@301@@@'+studentsList);
        }
}
return studentsList;
}

public List<CynoStudent> getLstOfStudentsAnyParentsAReUnemployeed(){
    List<CynoStudent>studentsList = new List <CynoStudent>();
    for(CynoStudent student : this.studentsSet)
{
    CynoParent father = student.father;
    CynoParent mother = student.mother;

CynoParent bothParentsAreUnemployeed =CynosureGenericUtility.getRecordWithAnyParentsAreUnemployee(mother,father);
    if (bothParentsAreUnemployeed == mother){
    studentsList.add(student);
        system.debug('@@@300@@@'+studentsList);
        }
}
return studentsList;
}

public Set<CynoStudent> removeStudentWhoHaveNotGivePermanentAddress() {
    for(CynoStudent student : this.studentsSet)
{
    CynoAddress perAddress = student.permanentAddress;
    
    if (perAddress == NULL){
    studentsSet.remove(student);
    }
    Else{
        studentsSet.add(student);
    }
    
}
return studentsSet;
}

    


public Set<CynoStudent> removeStudentWhoHaveNotGiveCurrentAddress() {
    for(CynoStudent student : this.studentsSet)
{
    CynoAddress currentAdd = student.currentAddress;
    
    if (currentAdd == NULL){
    studentsSet.remove(student);
    }
    Else{
        studentsSet.add(student);
    }
    
}
return studentsSet;
}

public Set<CynoStudent> removeStudentWhoseBothParentsAreUnployeed() {
   for(CynoStudent student : this.studentsSet)
{
    CynoParent father = student.father;
    CynoParent mother = student.mother;
    
    CynoParent bothParentsAreUnemployeed = CynosureGenericUtility.getRecordWithBothParentsAreUnemployee(mother,father);

    if (bothParentsAreUnemployeed == mother){
        studentsSet.remove(student);
       }
       else {
        studentsSet.add(student);
       }
    
}
return studentsSet;
}
}