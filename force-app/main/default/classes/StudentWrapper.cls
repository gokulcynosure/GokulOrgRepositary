public Class StudentWrapper {
    @AuraEnabled
    public String name {get;set;}
    @AuraEnabled
    public List<Marks> marksList {get;set;}

    public List<marks> StudentWrapper12(String nameParam, List<Marks> marksListParam) {
        this.name = nameParam;
        if(marksList == NULL) {
            marksList = new List<Marks>();
        }
        else {
            this.marksList = marksListParam;
        }
        return marksListParam;
    }


}