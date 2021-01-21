public class createcustomer {    
public myfirstcontapp__customer__c cus{get;set;}
   public list<myfirstcontapp__customer__c> customers;
    public createcustomer(ApexPages.StandardController std){
        cus=new myfirstcontapp__customer__c();
        cus=(myfirstcontapp__customer__c)std.getRecord();
    }
    public list<myfirstcontapp__customer__c> getcustomers(){
        if(customers == null){
            customers = [SELECT name, myfirstcontapp__Address__c,myfirstcontapp__Email_Address__c,myfirstcontapp__Mobile__c
                         FROM myfirstcontapp__customer__c LIMIT 10];
        }
        return customers;
    }
    public pageReference create(){
        try{
        insert cus;
        }Catch(Exception e) {
           ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.Error,e.getMessage()));
        }
        //pageReference pgg=Page.OrderdetailPage;
        //return pgg;
        return null;
        }
    /*Public PageReference NewCustomer(){
        try{
            upsert cus;
        }catch(System.DmlException ex){
            ApexPages.addMessages(ex);
            return null;
        }
        return null;
    }*/
    
    Public PageReference orderpage(){
        PageReference pg1=Page.OrderdetailPage;
        return pg1;
    }
}