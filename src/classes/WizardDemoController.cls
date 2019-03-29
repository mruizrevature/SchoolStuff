public class WizardDemoController {

    public String name {get;set;}
    public String email {get;set;}
    public String phone {get;set;}
    
    public PageReference pageOneNext() {
        return Page.Page2;
    }
    
    public PageReference pageTwoPrevious() {
        return Page.Page1;
    }
    
    public PageReference pageTwoNext() {
        return Page.Page3;
    }
    
    public PageReference pageThreePrevious() {
        return Page.Page2;
    }
    
    public PageReference pageThreeNext() {
        return Page.Page4;
    }
    
    public PageReference pageFourPrevious() {
        return Page.Page3;
    }
    
    public PageReference saveContact() {
        Contact c = new Contact();
        c.lastName = name;
        c.email = email;
        c.phone = phone;
        insert c;
        
        return (new ApexPages.StandardController(c)).view();
            
    }
    
}