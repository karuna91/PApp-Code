public class pizzastoremainpage {
public String imageURL{get;set;}
    public myfirstcontapp__customer__c cus{get;set;}
    //public Boolean showdetails{get;set;}
    public Boolean option {get;set;}
    public Boolean bool {get;set;}
    //public Integer txt{get;set;}
    public pizzastoremainpage(){
        imageURL='/servlet/servlet.FileDownload?file=';
        List< document > documentList=[select name from document];
        if(documentList.size()>0){
            imageURL=imageURL+documentList[3].id;
            bool = false;
        }
    }
    public void change(){
        if(option == true){
            bool = true;
        }
        else{
            bool = false;
        }
    }
    public PageReference NewCustomer(){
        pageReference pg= Page.createcustomer;
        return pg;
        
    }
    
}