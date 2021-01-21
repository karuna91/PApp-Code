public with sharing class vieworders1 {
Public  Integer seconds{get;set;}
public myfirstcontapp__Order__c ord{get;set;}
public list<myfirstcontapp__Order__c> orders;
    public vieworders1(ApexPages.StandardSetController std) {
        ord=new myfirstcontapp__Order__c();
        ord=(myfirstcontapp__Order__c)std.getRecord();
    }
    
    public list<myfirstcontapp__Order__c> getorders(){
        if(orders== null){
            orders= [SELECT Id,Name, myfirstcontapp__Amount__c,myfirstcontapp__customer__c,myfirstcontapp__Invoice__c,
            myfirstcontapp__Menu__c,myfirstcontapp__Price__c,myfirstcontapp__Quantity__c FROM myfirstcontapp__Order__c];
        }
        return orders;
    }
    
    Public void CounterMethod(){
    seconds = seconds + 5;
  }
}