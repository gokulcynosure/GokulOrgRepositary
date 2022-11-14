public  class CynoAddress {
    public String firstLineOfAddress{get;set;}
    public String secondLineOfAddress{get;set;}
    public String city{get;set;}
    public String postCode{get;set;}
    public String state{get;set;}
    public String country{get;set;}


    public  CynoAddress(String flAddress,String slAddress,String city,String postcode,String state,String country){
        
       this.firstLineOfAddress=flAddress;
        this.secondLineOfAddress=slAddress;
        this.city=city;
        this.postCode=postCode;
        this.state=state;
        this.country=country;
        
    }
    

}