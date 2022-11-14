public with sharing class MapAdmissionHandler {
   public Map<Integer,CynoStudent> studentsMap {get;set;}
   
   public MapAdmissionHandler(){
     this.studentsMap = new Map<Integer,CynoStudent>();
   }
   
   public void addStudentInMap(Integer a,CynoStudent student){
      if(studentsMap.containsKey(a) != NULL){
      this.studentsMap.put(a,student);
      
      }
      }
   
   public List<CynoStudent> getLstOfStudsWhoseMothersSalMoreThanFathersSal() {
       List<CynoStudent> studentsList = new List<CynoStudent>();
       for(CynoStudent student : this.studentsMap.values()) {
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
   public List<CynoStudent> getLstOfStudsWhoseFathersSalMoreThanMothersSal() {
       List<CynoStudent> newStudentsList = new List<CynoStudent>();
       for(CynoStudent student : this.studentsMap.values()) {
           CynoParent mother = student.mother;
           CynoParent father = student.father;
           
       CynoParent motherSalMoreThanFather = CynosureGenericUtility.getRecordWithMoreSalary(mother, father);
            if(motherSalMoreThanFather ==  father) {
               newStudentsList.add(student);
               System.debug('@@@@@ 09 @@@@@@ '+JSON.serialize(newStudentsList));
           }
       }
       return newStudentsList;
   
   }
   
   public List<CynoStudent> getLstOfStudsWhoseMotherIsUnEmployed() {
       List<CynoStudent> newStudentsList = new List<CynoStudent>();
       for(CynoStudent student : this.studentsMap.values()) {
           CynoParent mother = student.mother;
           if (mother.unEmployee == true) {
               newStudentsList.add(student);
               system.debug('@@@34@@@'+newStudentsList);
               
           }
           
       }
   
       return newStudentsList;
   }
   
   public List<CynoStudent> getLstOfStudsWhoseFatherIsUnEmployed() {
       List<CynoStudent> newStudentsList = new List<CynoStudent>();
       for(CynoStudent student : this.studentsMap.values()) {
           CynoParent father = student.father;
           if (father.unEmployee == true) {
               newStudentsList.add(student);
               system.debug('@@@38@@@'+newStudentsList);
           }
           
       }
   
       return newStudentsList;
   }
   public List<CynoStudent> getLstOfStudsWhosePermanentAddressIsDifferFromCurrentAddress(){
       List<CynoStudent> newStudentList = new List <CynoStudent>();
       for(CynoStudent student : this.studentsMap.values()){
           CynoAddress permanentAddress = student.permanentAddress;
           CynoAddress currentAddress = student.currentAddress;
           
   CynoAddress differentAddress = CynosureGenericUtility.getRecordDifferentAddress(permanentAddress,currentAddress);
           if(differentAddress == permanentAddress){
               newStudentList.add(student);
           system.debug('@@@30@@@'+newStudentList);
           }
       }
       
       return newStudentList;
   }
   
   public List<CynoStudent>getLstOfStudsWhoHaveSameAddressAsPermanentandCurrentAddress(){
       List<CynoStudent> newStudentList = new List <CynoStudent>();
       for(CynoStudent student : this.studentsMap.values()){
           CynoAddress permanentAddress = student.permanentAddress;
           CynoAddress currentAddress = student.currentAddress;
           
   
   CynoAddress differentAddress = CynosureGenericUtility.getRecordDifferentAddress(permanentAddress,currentAddress);
           if(differentAddress == currentAddress){
               newStudentList.add(student);
           system.debug('@@@303@@@'+newStudentList);
           }
       }
       
       return newStudentList;
   }
   
   public List<CynoStudent>getLstOfStudentsWhoseBothParentsAReUnemployeed(){
       List<CynoStudent> newStudentsList = new List <CynoStudent>();
       for(CynoStudent student : this.studentsMap.values()){
       CynoParent father = student.father;
       CynoParent mother = student.mother;
   
   CynoParent bothParentsAreUnemployeed =CynosureGenericUtility.getRecordWithBothParentsAreUnemployee(mother,father);
       if (bothParentsAreUnemployeed == mother){
       newStudentsList.add(student);
           system.debug('@@@302@@@'+newStudentsList);
           }
   }
   return newStudentsList;
   }
   public List<CynoStudent> getLstOfStudentsWhoseHaveemployeedParents(){
       List<CynoStudent> newStudentsList = new List <CynoStudent>();
       for(CynoStudent student : this.studentsMap.values())
   {
       CynoParent father = student.father;
       CynoParent mother = student.mother;
   
   CynoParent bothParentsAreUnemployeed =CynosureGenericUtility.getRecordWithBothParentsAreUnemployee(mother,father);
       if (bothParentsAreUnemployeed == father){
       newStudentsList.add(student);
           system.debug('@@@301@@@'+newStudentsList);
           }
   }
   return newStudentsList;
   }
   
   public List<CynoStudent> getLstOfStudentsAnyParentsAReUnemployeed(){
       List<CynoStudent> newStudentsList = new List <CynoStudent>();
       for(CynoStudent student : this.studentsMap.values())
   {
       CynoParent father = student.father;
       CynoParent mother = student.mother;
   
   CynoParent bothParentsAreUnemployeed =CynosureGenericUtility.getRecordWithAnyParentsAreUnemployee(mother,father);
       if (bothParentsAreUnemployeed == mother){
       newStudentsList.add(student);
           system.debug('@@@300@@@'+newStudentsList);
           }
   }
   return newStudentsList;
   }
   public List<CynoStudent> removeStudentWhoHaveNotGivePermanentAddress() {
       List<CynoStudent> newStudentsList = new List<CynoStudent>();
       for(CynoStudent student : this.studentsMap.values()) {
           CynoAddress peradd = student.permanentAddress;
           if (peradd == NULL) {
               newStudentsList.add(student);
               newStudentsList.remove(0);
               system.debug('REMOVE Students List'+newStudentsList);
           }
           Else{
               newStudentsList.add(student);
               system.debug('@@@25@@@'+newStudentsList);
           }
           
       }
   
       return newStudentsList;
   }
   
   public List<CynoStudent> removeStudentWhoHaveNotGiveCurrentAddress() {
       List<CynoStudent> newStudentsList = new List<CynoStudent>();
       for(CynoStudent student : this.studentsMap.values()) {
           CynoAddress curadd = student.CurrentAddress;
           if (curadd == NULL) {
               newStudentsList.add(student);
               newStudentsList.remove(0);
               system.debug('REMOVE Students List'+newStudentsList);
           }
           Else{
               newStudentsList.add(student);
               system.debug('@@@25@@@'+newStudentsList);
           }
           
       }
   
       return newStudentsList;
   }
   public List<CynoStudent> removeStudentWhoHaveUnemployeeParents() {
       List<CynoStudent> newStudentsList = new List<CynoStudent>();
       for(CynoStudent student : this.studentsMap.values()) {
           CynoParent father = student.father;
           CynoParent mother = student.mother;
           
           CynoParent bothParentsAreUnemployeed = CynosureGenericUtility.getRecordWithBothParentsAreUnemployee(mother,father);
       
           if (bothParentsAreUnemployeed == mother){
               newStudentsList.add(student);
               newStudentsList.remove(0);
               system.debug('REMOVE Students List'+newStudentsList);
           }
           Else{
               newStudentsList.add(student);
               system.debug('@@@25@@@'+newStudentsList);
           }
           
       }
   
       return newStudentsList;
   }
   
   
   
       
   

}