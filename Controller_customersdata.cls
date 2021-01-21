public class Controller_customersdata {
    public PageReference NewCustomer(){
        //insert cus;
    PageReference pg1= Page.Createcustomer;
    return pg1;
    }
    
    public PageReference Viewcustomers(){
        //insert cus;
    PageReference pg2= Page.customerpagin;
        //pg2.setRedirect(true);
    return pg2;
    }
    
}