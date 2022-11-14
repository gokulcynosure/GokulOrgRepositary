@IsTest
private class CynoStudentAdmisionsHandlerTest {
    @IsTest
     static void testDefaultConstructor() {
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        System.assertEquals(true, handler.studentsSet != NULL);
        System.assertEquals(0, handler.studentsSet.size());
    
    }
    @IsTest
    static void testAddStudent() {
        CynoStudent madhuStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('madhu', 'M', '');
        madhuStudent.nameDetails = stud1Name;
        CynoAddress std1perAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');
        madhuStudent.permanentAddress=std1perAddress;
        CynoAddress std1curAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');
        madhuStudent.CurrentAddress=std1curAddress;
        CynoParent std1father=new CynoParent(new CynoName('Anbu', 'Mari',''),'male','father',5,'poltician');
        madhuStudent.father=std1father;
        CynoParent std1Mother=new CynoParent(new CynoName('subathra', 'mari',''),'Female','Mother',50,'Housewife');
        madhuStudent.mother=std1Mother;
        
       CynoStudent sivaStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Kani', 'Chandrashekharan', '');
       sivaStudent.nameDetails = stud2Name;
        CynoAddress std2perAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');
       sivaStudent.permanentAddress=std2perAddress;
        CynoAddress std2curAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');
       sivaStudent.CurrentAddress=std2curAddress;
        CynoParent std2father=new CynoParent(new CynoName('Arun', 'Kumar',''),'male','father',1000000,'police');
       sivaStudent.father=std2father;
        CynoParent std2Mother=new CynoParent(new CynoName('deepika', 'kumar',''),'Female','Mother',0,'Unemployed');
       sivaStudent.mother=std2Mother;
        
        CynoStudent ramuStudent = new CynoStudent();
        CynoName stud3Name = new CynoName('Rami', 'Gandham' , 'SpiderMan');
        ramuStudent.nameDetails = stud3Name;
         CynoAddress std3perAddress=new CynoAddress('kathir','college','coimbatore','641064','Tamilnadu','India');
        ramuStudent.permanentAddress=std3perAddress;
        CynoAddress std3curAddress=new CynoAddress('kathir','college','coimbatore','641064','Tamilnadu','India');
        ramuStudent.CurrentAddress=std3curAddress;
        CynoParent std3father=new CynoParent(new CynoName('dinesh', 'karthick',''),'male','father',0,'Unemployed');
        ramuStudent.father=std3father;
        CynoParent std3Mother=new CynoParent(new CynoName('smiruti', 'Mandana',''),'Female','Mother',900000,'athlete');
        ramuStudent.mother=std3Mother;
        
       CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        handler.addStudent(madhuStudent);
         handler.addStudent(sivaStudent);
        handler.addStudent(ramuStudent);
       

        System.debug('@@@@@ 29 @@@@@@ '+JSON.serialize(handler.studentsSet));
        System.assertEquals(3, handler.studentsSet.size());
    }
   /* @IsTest
    static  void testGetTotalSalaryofMothers(){
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
        CynoStudent student3 = new CynoStudent();

        CynoParent stud1Mother = new CynoParent(new CynoName('ishu', 'anu',''),'Female','mother',25000,'Doctor');
        CynoParent stud2Mother = new CynoParent(new CynoName('madhu', 'mitha',''),'Female','mother',50000,'Police');
        CynoParent stud3Mother = new CynoParent(new CynoName('anu', 'goshal',''),'Female','mother',70000,'Collector');

        //student1.mother = stud1Mother;
        stud1Mother = student1.mother;
        student2.mother = stud2Mother;
        student3.mother = stud3Mother;
        
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        handler.addStudent(student1);
        handler.addStudent(student2);
        handler.addStudent(student3);
        system.debug(' 30'+JSON.serialize(handler.studentsSet));
        Integer totalMothersSalary = handler.getTotalSalaryofMothers();
 
        System.assertEquals(145000,totalMothersSalary);
}*/
@IsTest
static void testGetLstOfStudsWhoseMothersSalMoreThanFathersSal() {
    CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();

    CynoStudent student1 = new CynoStudent();
    CynoStudent student2 = new CynoStudent();
    CynoStudent student3 = new CynoStudent();

    CynoParent stud1Father = new CynoParent(new CynoName('rathan', 'Tata',''),'Male', 'Father',260000,'Buissnessman');

    CynoParent stud1Mother = new CynoParent(new CynoName('Anitha', 'kumari',''),'Female','Mother',8000,'Lawyer');

    CynoParent stud2Mother = new CynoParent(new CynoName('anu', 'Ishu',''),'Female','Mother',16000,'Lawyer');

    CynoParent stud2Father = new CynoParent(new CynoName('Arun', 'kumar',''),'Male','Father',8000,'');

    CynoParent stud3Father = new CynoParent(new CynoName('guna', '','sekar'),'Male','Father',60000,'Doctor');

    CynoParent stud3Mother = new CynoParent(new CynoName('ramya', '',''),'Female','Mother',8000,'Lawyer');
    
    student1.mother = stud1Mother;
    student2.mother = stud2Mother;

    student1.father = stud1Father;
    student2.father = stud2Father;

    student3.mother = stud3Mother;
    student3.father = stud3Father;

    handler.addStudent(student1);
    handler.addStudent(student2);
    handler.addStudent(student3);

    List<CynoStudent> result = handler.getLstOfStudsWhoseMothersSalMoreThanFathersSal();

    System.assertEquals(1, result.size());

}
@IsTest
static void testGetLstOfStudsWhoseDaSalMoreThanMotherSal() {
    CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();

    CynoStudent student1 = new CynoStudent();
    CynoStudent student2 = new CynoStudent();
    CynoStudent student3 = new CynoStudent();

    CynoParent stud1Father = new CynoParent(new CynoName('rathan', 'Tata',''),'Male', 'Father',260000,'Buissnessman');

    CynoParent stud1Mother = new CynoParent(new CynoName('Anitha', 'kumari',''),'Female','Mother',8000,'Lawyer');

    CynoParent stud2Mother = new CynoParent(new CynoName('anu', 'Ishu',''),'Female','Mother',16000,'Lawyer');

    CynoParent stud2Father = new CynoParent(new CynoName('Arun', 'kumar',''),'Male','Father',8000,'');

    CynoParent stud3Father = new CynoParent(new CynoName('guna', '','sekar'),'Male','Father',60000,'Doctor');

    CynoParent stud3Mother = new CynoParent(new CynoName('ramya', '',''),'Female','Mother',8000,'Lawyer');
    
    student1.mother = stud1Mother;
    student2.mother = stud2Mother;

    student1.father = stud1Father;
    student2.father = stud2Father;

    student3.mother = stud3Mother;
    student3.father = stud3Father;

    handler.addStudent(student1);
    handler.addStudent(student2);
    handler.addStudent(student3);

    List<CynoStudent> result = handler.getLstOfStudsWhoseDadSalMoreThanMotherSal();

    
    System.assertEquals(2, result.size());

}
@IsTest
static void testGetLstOfStudsWhoseMotherIsUnEmployedl() {
    CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();

    CynoStudent student1 = new CynoStudent();
    CynoStudent student2 = new CynoStudent();
    CynoStudent student3 = new CynoStudent();

    

    CynoParent stud1Mother = new CynoParent(new CynoName('Anitha', 'kumari',''),'Female','Mother',4550,'lawyer');

     CynoParent stud2Mother = new CynoParent(new CynoName('anu', 'Ishu',''),'Female','Mother',0,NULL);

    CynoParent stud3Mother = new CynoParent(new CynoName('ramya', '',''),'Female','Mother',8000,'Doctar');
    
    student1.mother = stud1Mother;
    
    student2.mother = stud2Mother;
    
    student3.mother = stud3Mother;
    

    handler.addStudent(student1);
    handler.addStudent(student2);
    handler.addStudent(student3);

    List<CynoStudent> result1 = handler.getLstOfStudsWhoseMotherIsUnEmployed();

    
    System.assertEquals(1, result1.size());

}
@IsTest
static void testGetLstOfStudsWhoseFatherIsUnEmployed() {
    CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();

    CynoStudent student1 = new CynoStudent();
    CynoStudent student2 = new CynoStudent();
    CynoStudent student3 = new CynoStudent();

    CynoParent stud1Father = new CynoParent(new CynoName('rathan', 'Tata',''),'Male', 'Father',260000,'Buissnessman');

    CynoParent stud2Father = new CynoParent(new CynoName('Arun', 'kumar',''),'Male','Father',0,NULL);

    CynoParent stud3Father = new CynoParent(new CynoName('guna', '','sekar'),'Male','Father',60000,'Doctor');
    
    student1.father = stud1Father;
    student2.father = stud2Father;
    student3.father=stud3Father;
    
    handler.addStudent(student1);
    handler.addStudent(student2);
    handler.addStudent(student3);

    List<CynoStudent> result1 = handler.getLstOfStudsWhoseFatherIsUnEmployed();
    
    System.assertEquals(1, result1.size());

}
@IsTest
static void testGetLstOfStudsWhosePermanentAddressIsDifferFromCurrentAddress() {
    CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();

    CynoStudent student1 = new CynoStudent();
    CynoStudent student2 = new CynoStudent();
    CynoStudent student3 = new CynoStudent();

    CynoAddress student1PerAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');
    CynoAddress student1CurAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');

    CynoAddress student2PerAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');
    CynoAddress student2CurAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');

    CynoAddress student3PerAddress=new CynoAddress('kathir','college','coimbatore','641064','Tamilnadu','India');
    CynoAddress student3CurAddress=new CynoAddress('GHSSS','Kalapatti','Coimbatore','641048','tamilnadu','India');

     student1.permanentAddress = student1PerAddress;
     student1.currentAddress = student1CurAddress;

     student2.permanentAddress = student2PerAddress;
     student2.currentAddress = student2CurAddress;

     student3.permanentAddress = student3PerAddress;
     student3.currentAddress = student3CurAddress;

    handler.addStudent(student1);
    handler.addStudent(student2);
    handler.addStudent(student3);

    List<CynoStudent> result1 = handler.getLstOfStudsWhosePermanentAddressIsDifferFromCurrentAddress();

    System.assertEquals(1, result1.size());

}
@IsTest
static void testGetLstOfStudsWhoHaveSameAddressAsPermanentandCurrentAddress() {
    CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();

    CynoStudent student1 = new CynoStudent();
    CynoStudent student2 = new CynoStudent();
    CynoStudent student3 = new CynoStudent();

    CynoAddress student1PerAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');
    CynoAddress student1CurAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');

    CynoAddress student2PerAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');
    CynoAddress student2CurAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');

    CynoAddress student3PerAddress=new CynoAddress('kathir','college','coimbatore','641064','Tamilnadu','India');
    CynoAddress student3CurAddress=new CynoAddress('GHSSS','Kalapatti','Coimbatore','641048','tamilnadu','India');

     student1.permanentAddress = student1PerAddress;
     student1.currentAddress = student1CurAddress;

     student2.permanentAddress = student2PerAddress;
     student2.currentAddress = student2CurAddress;

     student3.permanentAddress = student3PerAddress;
     student3.currentAddress = student3CurAddress;

    handler.addStudent(student1);
    handler.addStudent(student2);
    handler.addStudent(student3);

    List<CynoStudent> result1 = handler.getLstOfStudsWhoHaveSameAddressAsPermanentandCurrentAddress();

    System.assertEquals(2, result1.size());

}

@IsTest
static void testGetLstOfStudentsWhoseBothParentsAReUnemployeed() {
    CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();

    CynoStudent student1 = new CynoStudent();
    CynoStudent student2 = new CynoStudent();
    CynoStudent student3 = new CynoStudent();

    CynoParent stud1Father = new CynoParent(new CynoName('rathan', 'Tata',''),'Male', 'Father',260000,'Buissnessman');

    CynoParent stud1Mother = new CynoParent(new CynoName('Anitha', 'kumari',''),'Female','Mother',8000,'Lawyer');

    CynoParent stud2Mother = new CynoParent(new CynoName('anu', 'Ishu',''),'Female','Mother',0,NULL);

    CynoParent stud2Father = new CynoParent(new CynoName('Arun', 'kumar',''),'Male','Father',0,NULL);

    CynoParent stud3Father = new CynoParent(new CynoName('guna', '','sekar'),'Male','Father',60000,'Doctor');

    CynoParent stud3Mother = new CynoParent(new CynoName('ramya', '',''),'Female','Mother',8000,'Lawyer');
    
    student1.mother = stud1Mother;
    student2.mother = stud2Mother;

    student1.father = stud1Father;
    student2.father = stud2Father;

    student3.mother = stud3Mother;
    student3.father = stud3Father;

    handler.addStudent(student1);
    handler.addStudent(student2);
    handler.addStudent(student3);

    List<CynoStudent> result = handler.getLstOfStudentsWhoseBothParentsAReUnemployeed();

    
    System.assertEquals(1, result.size());

}
@IsTest
static void testGetLstOfStudentsWhoseHaveemployeedParents() {
    CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();

    CynoStudent student1 = new CynoStudent();
    CynoStudent student2 = new CynoStudent();
    CynoStudent student3 = new CynoStudent();

    CynoParent stud1Father = new CynoParent(new CynoName('rathan', 'Tata',''),'Male', 'Father',260000,'Buissnessman');

    CynoParent stud1Mother = new CynoParent(new CynoName('Anitha', 'kumari',''),'Female','Mother',8000,'Lawyer');

    CynoParent stud2Mother = new CynoParent(new CynoName('anu', 'Ishu',''),'Female','Mother',0,NULL);

    CynoParent stud2Father = new CynoParent(new CynoName('Arun', 'kumar',''),'Male','Father',0,NULL);

    CynoParent stud3Father = new CynoParent(new CynoName('guna', '','sekar'),'Male','Father',60000,'Doctor');

    CynoParent stud3Mother = new CynoParent(new CynoName('ramya', '',''),'Female','Mother',8000,'Lawyer');
    
    student1.mother = stud1Mother;
    student2.mother = stud2Mother;

    student1.father = stud1Father;
    student2.father = stud2Father;

    student3.mother = stud3Mother;
    student3.father = stud3Father;

    handler.addStudent(student1);
    handler.addStudent(student2);
    handler.addStudent(student3);

    List<CynoStudent> result = handler.getLstOfStudentsWhoseHaveemployeedParents();

    System.assertEquals(2, result.size());

}

@IsTest
static void testGetLstOfStudentsAnyParentsAReUnemployeed() {
    CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();

    CynoStudent student1 = new CynoStudent();
    CynoStudent student2 = new CynoStudent();
    CynoStudent student3 = new CynoStudent();

    CynoParent stud1Father = new CynoParent(new CynoName('rathan', 'Tata',''),'Male', 'Father',260000,'Buissnessman');

    CynoParent stud1Mother = new CynoParent(new CynoName('Anitha', 'kumari',''),'Female','Mother',8000,'Lawyer');

    CynoParent stud2Mother = new CynoParent(new CynoName('anu', 'Ishu',''),'Female','Mother',0,NULL);

    CynoParent stud2Father = new CynoParent(new CynoName('Arun', 'kumar',''),'Male','Father',100000,'IPS');

    CynoParent stud3Father = new CynoParent(new CynoName('guna', '','sekar'),'Male','Father',60000,'Doctor');

    CynoParent stud3Mother = new CynoParent(new CynoName('ramya', '',''),'Female','Mother',8000,'Lawyer');
    
    student1.mother = stud1Mother;
    student2.mother = stud2Mother;

    student1.father = stud1Father;
    student2.father = stud2Father;

    student3.mother = stud3Mother;
    student3.father = stud3Father;

    handler.addStudent(student1);
    handler.addStudent(student2);
    handler.addStudent(student3);

    List<CynoStudent> result = handler.getLstOfStudentsAnyParentsAReUnemployeed();

    System.assertEquals(1, result.size());

}

@IsTest
    static void testRemoveStudentWhoHaveNotGivePermanentAddress() {
       
        CynoStudent madhuStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('madhu', 'M', '');
        madhuStudent.nameDetails = stud1Name;
        //CynoAddress std1perAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');
       // madhuStudent.permanentAddress=std1perAddress;
        CynoAddress std1curAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');
        madhuStudent.CurrentAddress=std1curAddress;
        CynoParent std1father=new CynoParent(new CynoName('Anbu', 'Mari',''),'male','father',5,'poltician');
        madhuStudent.father=std1father;
        CynoParent std1Mother=new CynoParent(new CynoName('subathra', 'mari',''),'Female','Mother',50,'Housewife');
        madhuStudent.mother=std1Mother;
        
       CynoStudent sivaStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Kani', 'Chandrashekharan', '');
       sivaStudent.nameDetails = stud2Name;
        CynoAddress std2perAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');
       sivaStudent.permanentAddress=std2perAddress;
        CynoAddress std2curAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');
       sivaStudent.CurrentAddress=std2curAddress;
        CynoParent std2father=new CynoParent(new CynoName('Arun', 'Kumar',''),'male','father',1000000,'police');
       sivaStudent.father=std2father;
        CynoParent std2Mother=new CynoParent(new CynoName('deepika', 'kumar',''),'Female','Mother',0,'Unemployed');
       sivaStudent.mother=std2Mother;
        
        CynoStudent ramuStudent = new CynoStudent();
        CynoName stud3Name = new CynoName('Rami', 'Gandham' , 'SpiderMan');
        ramuStudent.nameDetails = stud3Name;
         CynoAddress std3perAddress=new CynoAddress('kathir','college','coimbatore','641064','Tamilnadu','India');
        ramuStudent.permanentAddress=std3perAddress;
        CynoAddress std3curAddress=new CynoAddress('kathir','college','coimbatore','641064','Tamilnadu','India');
       ramuStudent.CurrentAddress=std3curAddress;
        CynoParent std3father=new CynoParent(new CynoName('dinesh', 'karthick',''),'male','father',0,'Unemployed');
       ramuStudent.father=std3father;
        CynoParent std3Mother=new CynoParent(new CynoName('smiruti', 'Mandana',''),'Female','Mother',900000,'athlete');
       ramuStudent.mother=std3Mother;
        
       CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        
       handler.addStudent(madhuStudent);
         handler.addStudent(sivaStudent);
        handler.addStudent(ramuStudent);
       
        Set<CynoStudent> result = handler.removeStudentWhoHaveNotGivePermanentAddress();

        System.assertEquals(2, result.size());
    
    }

    @IsTest
    static void testRemoveStudentWhoHaveNotGiveCurrentAddress() {
       
        CynoStudent madhuStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('madhu', 'M', '');
        madhuStudent.nameDetails = stud1Name;
        CynoAddress std1perAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');
        madhuStudent.permanentAddress=std1perAddress;
        CynoAddress std1curAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');
        madhuStudent.CurrentAddress=std1curAddress;
        CynoParent std1father=new CynoParent(new CynoName('Anbu', 'Mari',''),'male','father',5,'poltician');
        madhuStudent.father=std1father;
        CynoParent std1Mother=new CynoParent(new CynoName('subathra', 'mari',''),'Female','Mother',50,'Housewife');
        madhuStudent.mother=std1Mother;
        
        CynoStudent sivaStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Kani', 'Chandrashekharan', '');
       sivaStudent.nameDetails = stud2Name;
        CynoAddress std2perAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');
       sivaStudent.permanentAddress=std2perAddress;
        //CynoAddress std2curAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');
       //sivaStudent.CurrentAddress=std2curAddress;
        CynoParent std2father=new CynoParent(new CynoName('Arun', 'Kumar',''),'male','father',1000000,'police');
       sivaStudent.father=std2father;
        CynoParent std2Mother=new CynoParent(new CynoName('deepika', 'kumar',''),'Female','Mother',0,'Unemployed');
       sivaStudent.mother=std2Mother;
        
        CynoStudent ramuStudent = new CynoStudent();
        CynoName stud3Name = new CynoName('Rami', 'Gandham' , 'SpiderMan');
        ramuStudent.nameDetails = stud3Name;
         CynoAddress std3perAddress=new CynoAddress('kathir','college','coimbatore','641064','Tamilnadu','India');
        ramuStudent.permanentAddress=std3perAddress;
        //CynoAddress std3curAddress=new CynoAddress('kathir','college','coimbatore','641064','Tamilnadu','India');
       //ramuStudent.CurrentAddress=std3curAddress;
        CynoParent std3father=new CynoParent(new CynoName('dinesh', 'karthick',''),'male','father',0,'Unemployed');
       ramuStudent.father=std3father;
        CynoParent std3Mother=new CynoParent(new CynoName('smiruti', 'Mandana',''),'Female','Mother',900000,'athlete');
       ramuStudent.mother=std3Mother;
        
       CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        
       handler.addStudent(madhuStudent);
         handler.addStudent(sivaStudent);
        handler.addStudent(ramuStudent);
       

        Set<CynoStudent> result = handler.removeStudentWhoHaveNotGiveCurrentAddress();

        System.assertEquals(1, result.size());
    }

    @IsTest
    static void testRemoveStudentWhoseBothParentsAreUnployeed() {
       
        CynoStudent madhuStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('madhu', 'M', '');
        madhuStudent.nameDetails = stud1Name;
        CynoAddress std1perAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');
        madhuStudent.permanentAddress=std1perAddress;
        CynoAddress std1curAddress=new CynoAddress('HousingUnit','Nehrunagar','Coimbatore','641014','tamilnadu','India');
        madhuStudent.CurrentAddress=std1curAddress;
        CynoParent std1father=new CynoParent(new CynoName('Anbu', 'Mari',''),'male','father',5,'poltician');
        madhuStudent.father=std1father;
        CynoParent std1Mother=new CynoParent(new CynoName('subathra', 'mari',''),'Female','Mother',50,'Housewife');
        madhuStudent.mother=std1Mother;
        
       CynoStudent sivaStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Kani', 'Chandrashekharan', '');
       sivaStudent.nameDetails = stud2Name;
        CynoAddress std2perAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');
       sivaStudent.permanentAddress=std2perAddress;
        CynoAddress std2curAddress=new CynoAddress('chilzIT','Saravanapatti','Coimbatore','641064','tamilnadu','India');
       sivaStudent.CurrentAddress=std2curAddress;
        CynoParent std2father=new CynoParent(new CynoName('Arun', 'Kumar',''),'male','father',0,NULL);
       sivaStudent.father=std2father;
        CynoParent std2Mother=new CynoParent(new CynoName('deepika', 'kumar',''),'Female','Mother',0,NULL);
       sivaStudent.mother=std2Mother;
        
        CynoStudent ramuStudent = new CynoStudent();
        CynoName stud3Name = new CynoName('Rami', 'Gandham' , 'SpiderMan');
        ramuStudent.nameDetails = stud3Name;
         CynoAddress std3perAddress=new CynoAddress('kathir','college','coimbatore','641064','Tamilnadu','India');
        ramuStudent.permanentAddress=std3perAddress;
        CynoAddress std3curAddress=new CynoAddress('kathir','college','coimbatore','641064','Tamilnadu','India');
       ramuStudent.CurrentAddress=std3curAddress;
        CynoParent std3father=new CynoParent(new CynoName('dinesh', 'karthick',''),'male','father',0,NULL);
       ramuStudent.father=std3father;
        CynoParent std3Mother=new CynoParent(new CynoName('smiruti', 'Mandana',''),'Female','Mother',0,NULL);
       ramuStudent.mother=std3Mother;
        
       CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        
       handler.addStudent(madhuStudent);
         handler.addStudent(sivaStudent);
        handler.addStudent(ramuStudent);
       

        Set<CynoStudent> result = handler.removeStudentWhoseBothParentsAreUnployeed();

        System.assertEquals(1, result.size());
    }
}