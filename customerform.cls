public class customerform {
public myfirstcontapp__customer__c cus{get;set;}
//public ApexPages.StandardSetController stdCntrlr {get; set;}
  //public list<myfirstcontapp__customer__c> customers;
   public customerform(ApexPages.StandardController std){
        //stdCntrlr = std;
        cus=new myfirstcontapp__customer__c();
        cus=(myfirstcontapp__customer__c)std.getRecord();
    }
    public PageReference create(){
        try{
        insert cus;
        }catch(DMLException ex){
            ApexPages.addMessages(ex);
            return null;
        }
        //PageReference pg= new ApexPages.StandardController(orders).view();
        //PageReference pg=Page.OrderdetailPage;
        return null;
        
        //PageReference OpenNewPage = Page.OrderdetailPage;
        //OpenNewPage.setRedirect(false);
        //return OpenNewPage;
    }
}