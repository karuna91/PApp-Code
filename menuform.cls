public class menuform {
    public Menu__c mList{get;set;}
    //public boolean display{get; set;}
    //public list<myfirstcontapp__Menu__c> menus;
    public menuform(){
        mList= new myfirstcontapp__Menu__c  ();
        
    }

    public PageReference create(){
        try{
            upsert mList;
        }catch(System.DmlException ex){
            ApexPages.addMessages(ex);
            return null;
        }
        PageReference pg= Page.CreatenUpdateMenus;
        return pg;

    }
}