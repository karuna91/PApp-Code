public class CreateMenu {
    public Menu__c mList{get;set;}
    //public boolean display{get; set;}
    public list<myfirstcontapp__Menu__c> menus;
    public CreateMenu(){
        mList= new myfirstcontapp__Menu__c	();
        //display = false;
    }
    /*public list<myfirstcontapp__Menu__c> GetRecordFetching() {
        menus= new list<myfirstcontapp__Menu__c>();
        List<myfirstcontapp__Menu__c> listitem = [Select Id, Name,Item_Name__c,Item_Category__c From myfirstcontapp__Menu__c	];
        
        if(listitem.size() > 0){
            menus.addall(listitem);        
        }    
        return menus;
    }*/
    Public List<myfirstcontapp__Menu__c> getmenus(){
        if(menus==Null){
            menus=[SELECT name, myfirstcontapp__Item_Name__c,myfirstcontapp__Item_Category__c,myfirstcontapp__Item_Type__c,
                   myfirstcontapp__Price__c FROM myfirstcontapp__Menu__c LIMIT 10];
        }
        return menus;
    }
    /*public PageReference create(){
        try{
            upsert mList;
        }catch(System.DmlException ex){
            ApexPages.addMessages(ex);
            return null;
        }
        //display = true;
        //GetRecordFetching();
        //PageReference pg= new PageReference();
        PageReference pg= Page.MainMenu;
        return pg;
       // return null;
    }*/
    public PageReference NewMenu(){
        PageReference p1= Page.menuform;
        return p1;
    }
}