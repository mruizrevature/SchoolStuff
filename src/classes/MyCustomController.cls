public class MyCustomController {
	
    public Class__c myClass {get;set;}
    
    public MyCustomController() {
        // Put Id into URL
        ApexPages.currentPage().getParameters().put('id', 'a001U000006KukxQAC');
        // Grab class Id from URL
        Id classId = ApexPages.currentPage().getParameters().get('id');
        myClass = [SELECT Id, Name FROM Class__c WHERE Id = :classId];
    }
    
    public PageReference save() {
        update myClass;
        return null;
    }
}