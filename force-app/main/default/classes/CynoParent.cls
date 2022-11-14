public class CynoParent {
    public CynoName nameDetails {set;get;}
    public String gender {set;get;}
    public String parentType {set;get;}
    public Integer yearSalary {set;get;}
    public String occupation {set;get;}
    public boolean unEmployee {set;get;}

    public CynoParent(CynoName cpName,String gender,string parentType,Integer yearSalary,String Occupation){
        

        this.nameDetails = cpName;
        this.gender=gender;
        this.parentType=parentType;
        this.yearSalary=yearSalary;
        this.Occupation=occupation;
        if(occupation == NULL){
            this.unEmployee = true;
        }
    }
}