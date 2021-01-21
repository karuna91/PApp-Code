public class menuext {
public menu__c mn;
//public Boolean bool {get;set;}
//public Boolean option {get;set;}
//public List<menu__c> mnList{get;set;}
    public menuext(ApexPages.StandardController std){
        this.mn=(menu__c)std.getRecord();
        //bool = false;
    }
    //Redirect to creation page
    /*Public pageReference save(){
        pageReference pp= page.createnupdateext;
        return pp;
    }*/
    // showing created record on the basis of id(id passed in url)
    public pageReference create(){
        try{
        insert mn;
        }catch(DMLException ex){
            ApexPages.addMessages(ex);
            return null;
        }
        //PageReference pg=new PageReference();
        //pageReference pg=Page.CreatenUpdateMenus;
        return null;   
}
       Public pageReference showorder(){
       pageReference pg1=Page.validatecustomer;
       return pg1;
       }

}