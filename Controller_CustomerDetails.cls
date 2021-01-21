public class Controller_CustomerDetails {
    public Controller_CustomerDetails(){}
    public PageReference newcustomer(){
        PageReference pg= Page.customerform;
        return pg;
    }
    public PageReference viewcustomers(){
        PageReference pg1= Page.viewcustomers;
        return pg1;
    }
    /*public PageReference search(){}*/
}