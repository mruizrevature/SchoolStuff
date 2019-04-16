public class MyController {
    public MyController(ApexPages.StandardController ctrl){}
    
    public void message() {
        ApexPages.Message m = new ApexPages.Message(ApexPages.Severity.ERROR, 'an error has occurred');
		ApexPages.addMessage(m);
    }
}