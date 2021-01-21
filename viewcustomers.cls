public with sharing class viewcustomers {
public myfirstcontapp__customer__c cus{get;set;}
public list<myfirstcontapp__customer__c > customers;
    public viewcustomers(ApexPages.StandardSetController std) {
        cus=new myfirstcontapp__customer__c();
        cus=(myfirstcontapp__customer__c)std.getRecord();
    }
    
    public list<myfirstcontapp__customer__c> getcustomers(){
        if(customers == null){
            customers = [SELECT Id,Name, myfirstcontapp__Address__c,myfirstcontapp__Email_Address__c,myfirstcontapp__Mobile__c
                         FROM myfirstcontapp__customer__c];
        }
        return customers;
    }
}