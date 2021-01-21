public class Controller_serachcustomers {
    Public  Integer seconds{get;set;}
    string searchphone;
    List<myfirstcontapp__customer__c> results;
    public Controller_serachcustomers(){
        seconds = 0;
    } 
    Public void CounterMethod(){
    seconds = seconds + 5;
  }
   public string getsearchphone() {
        return searchphone;
    }
    
    public void setsearchphone(string s) {
        searchphone= s;
    }
    public  List<myfirstcontapp__customer__c> getresults(){
        return results;
    }
    public PageReference doSearch(){
        results = (List<myfirstcontapp__customer__c>)[FIND :searchphone 
           RETURNING myfirstcontapp__customer__c (Name,myfirstcontapp__Customer_Name__c, myfirstcontapp__Email_Address__c, 
                                    myfirstcontapp__Mobile__c,myfirstcontapp__Address__c)][0];
        return null;
    }
    Public PageReference orderplace(){
        PageReference pgr= Page.OrderdetailPage;
        return pgr;
    }
    public PageReference exsit(){
        PageReference pg= Page.Customersdata;
        return pg;
    }
}