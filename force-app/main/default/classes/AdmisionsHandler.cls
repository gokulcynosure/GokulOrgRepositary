public with sharing class AdmisionsHandler {
    
        public Set<CynoStudent> studentsSet {get;set;}
        public AdmisionsHandler() {
            this.studentsSet = new Set<CynoStudent>();
        }
        public void addStudent(CynoStudent student) {
    
        }
        public void removeStudent(CynoStudent student) {
    
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
    }