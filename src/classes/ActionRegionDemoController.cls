public class ActionRegionDemoController {
    public Account acc {get;set;}
    public String accountName {get;set;}
    public String accountIndustry {get;set;}
    
    public ActionRegionDemoController () {
        acc = new Account();
    }
    
    public PageReference saveAccount() {
        accountName = acc.Name;
        accountIndustry = acc.Industry;
        
        return null;
    }
}