public class CustomerListViewController {
public CustomerListViewController(){
    RecordsPerPageslist=10;
}
list<myfirstcontapp__customer__c> cusList = [SELECT Name,myfirstcontapp__Customer_Name__c,myfirstcontapp__Email_Address__c,myfirstcontapp__Mobile__c,myfirstcontapp__Address__c FROM myfirstcontapp__customer__c]; 
public list<String> alphabet{
    get{     
      //To display a list of alphabets on vf page 
    alphabet = new list<string>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','Others','All'};
     return alphabet;         
    }
    set;
}
 public String alphaSearchConct{get;set;} // To get commandlink parameter for alphabet selected
public Pagereference getalphaSearch(){   //To update customer list as per the alphabet selected by the user

    if (alphaSearchConct=='All'){
        cusList = [SELECT Id,Name,myfirstcontapp__Customer_Name__c,myfirstcontapp__Email_Address__c,myfirstcontapp__Mobile__c,myfirstcontapp__Address__c FROM myfirstcontapp__customer__c];
    }
    else{
            cusList = [SELECT Id,Name,myfirstcontapp__Customer_Name__c,myfirstcontapp__Email_Address__c,myfirstcontapp__Mobile__c,myfirstcontapp__Address__c FROM myfirstcontapp__customer__c WHERE myfirstcontapp__Customer_Name__c Like: alphaSearchConct+'%'];
    }
    ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(cusList);
    stdSetController= ssc;
    return null;
}
    public Integer PageNumber{
    get{    
        //To get current page number
        this.PageNumber=stdSetController.getPageNumber();
        return this.PageNumber;
    }
    set{  // To navigate to the page number entered by the user
        stdSetController.setPageNumber(value);
    }
}
    public Integer TotalPages{   
        // Total number of pages as per user selection of Records per page
    get{
          if(stdSetController.getResultSize() <=10)
              this.TotalPages=1;
        if(Math.Mod(stdSetController.getResultSize() ,stdSetController.getPageSize()) == 0)
            this.TotalPages =(stdSetController.getResultSize()/stdSetController.getPageSize());
        else
            this.TotalPages = (stdSetController.getResultSize()/stdSetController.getPageSize())+1;
        System.Debug(this.TotalPages);
        return totalpages;
    }
    set;
}
public Integer MaxNumberOfRecords{  
    //Maximum number of records in a query list
    get{
          return stdSetController.getRecords().size();
    }
    set;
}
public list<SelectOption> getRecordsPerPageOptionList(){ //To display a drop down list on vf page  
        list<SelectOption>  options = new list<SelectOption>();
        options.add(new selectOption('10','10'));
        options.add(new selectOption('25','25'));
        options.add(new selectOption('50','50'));
        options.add(new selectOption('100','100'));
        options.add(new selectOption('200','200'));
        return options;
}
public Integer RecordsPerPageslist{ 
    get;
    set{  
       if(value!=null){
            this.RecordsPerPagesList=value;
        }
     }       
}
public void next(){
    this.stdSetController.next();
}
public ApexPages.StandardSetController stdSetController{
    //Instantiating a standard set controller
    get{
        if(stdSetController==null){
             stdSetController = new ApexPages.StandardSetController(cusList);
        }
          stdSetController.setPageSize(RecordsPerPageslist);
        //Limiting Number of records to be displayed per page 
           return stdSetController;   
    }
    set;
}
    public list<myfirstcontapp__customer__c> getCustomerList(){                               
        //to display records on vf page
   return (list<myfirstcontapp__customer__c>)stdSetController.getRecords();
}
}