public class PaginationExtension {
    public ApexPages.StandardSetController setController {get;set;}
    
    public List<Account> displayedAccounts {
        get {
            return setController.getRecords();
        }
        set;
    }
    
    public PaginationExtension(ApexPages.StandardSetController ctrl) {
        setController = new ApexPages.StandardSetController([SELECT Id,
                                                             Name,
                                                             BillingStreet,
                                                             Type FROM Account]);
        setController.setPageSize(5);
    }
    
}