public class MyControllerExtension {

    private Account acct;
    
    // The extention constructor initializes the private member variable acct
    // by using the getRecrod method from the standard controller.
    public MyControllerExtension(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }
    
    public String getGreeting() {
        return 'Hello ' + acct.Name + ' ( ' + acct.Id + ' )';
    }
    
    public PageReference save() {
        upsert acct;
        return null;
    }
}