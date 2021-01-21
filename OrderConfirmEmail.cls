public class OrderConfirmEmail {
    Public String opId {get;set;}
    Public Opportunity op;
    Public Blob blb;
    Public string OppAccName;
    Public string ownerName;
    
    public Boolean getIsClassic() {
        return (UserInfo.getUiThemeDisplayed() == 'Theme3' && ApexPages.currentPage().getParameters().get('beLightning') == null);
    }
    
    public OrderConfirmEmail(ApexPages.StandardController stdController){
        opId = ApexPages.currentPage().getParameters().get('id');
        op =   [select id,name,Account.Name,Owner.Name,Anonymous__c from Opportunity where Id = :ApexPages.currentPage().getParameters().get('id')];
        system.debug('current opt'+ Op);
        OppAccName = op.Name;
        System.debug('Opportunity Account Name'+ OppAccName);
        ownerName = op.owner.name;
        System.debug('Opportunity Owner Name'+ ownerName);
    }
    
    List<Opportunity> OptList = [select id,name,Anonymous__c from Opportunity where ID =: ApexPages.currentPage().getParameters().get('id')];
    public void sendEmail() {
        /*if(OptList != null && OptList.size()>0 && OptList[0].Anonymous__c == True){
            Messaging.SingleEmailMessage  mail = new Messaging.SingleEmailMessage();
            PageReference pref = page.PDFGenerate;
            pref.getParameters().put('id',(String)op.id);
            pref.setRedirect(true);
            if(Test.isRunningTest()){
                blb = Blob.valueOf('test attach');
            }else{
                blb  = pref.getContent();
            }
            
            mail.setSubject('Opportunity order details');
            String emailValue = System.Label.Margento_Admin_Email;
            system.debug('custom label email'+ emailValue);
            String[] sendTo = new String[]{emailValue};
                mail.setToAddresses(sendTo);
            mail.setHtmlBody('Please find the attached OpportinityConfirmationPdf');
            
            String messageBody= '';
            messageBody += '<html></br> </br>' +
                +'Dear &nbsp;'+ OppAccName +',<br/></br>' +
                +'Thank you for your order. Please find attached details of the order to be processed. '+
                +'If you find any error, Please contact me immediately, you will shortly be receiving a '+
                +'performa along with shipping costs and payment instructions. <br/>'+
                +'We appreciate the opportunity and we look forward to your continued custom.<br/><br/>'+
                +'Kind Regards,<br/>'
                + ownerName;
            
            messageBody +=  '</body></html>';
            system.debug('message Body is'+ messageBody);
            mail.setHtmlBody(messageBody);
            
            Messaging.EmailFileAttachment pdfFile = new Messaging.EmailFileAttachment();
            pdfFile.setContentType('application/pdf');
            pdfFile.setFileName('OrderConfirmation.pdf');
            pdfFile.setInline(false);
            pdfFile.setBody(blb);
            mail.setFileAttachments(new Messaging.EmailFileAttachment[]{ pdfFile });
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.Confirm,'Order Confirmation has been sent successfully. Click OK to continue.'));
        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.error,'Please select OrderReady checkbox..');
            ApexPages.addMessage(myMsg);
        }*/
    }
}