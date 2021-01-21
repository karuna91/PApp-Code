public class Controller_orderform {
	public myfirstcontapp__Order__c orders{get;set;}
    public Controller_orderform(){
        orders=new myfirstcontapp__Order__c();
        //orders=[select id,myfirstcontapp__product__c,myfirstcontapp__Quantity__c,myfirstcontapp__Price__c,myfirstcontapp__Menu__c, myfirstcontapp__Amount__c from myfirstcontapp__Order__c];
    }
    
    public PageReference create(){
        try{
        insert orders;
        }catch(DMLException ex){
            ApexPages.addMessages(ex);
            return null;
        }
        PageReference pg= new ApexPages.StandardController(orders).view();
        //PageReference pg=new PageReference();
        return pg;
    }
}