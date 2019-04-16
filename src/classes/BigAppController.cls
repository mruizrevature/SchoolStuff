public class BigAppController {
    @AuraEnabled
    public static List<Case> getCases() {
        return [SELECT Id, CaseNumber, Status, Priority, Contact.Name FROM Case];
    }
    
    @AuraEnabled
    public static Case getCaseFromID(Id caseId) {
        Case c = [SELECT Id, CaseNumber, Status, Priority FROM Case WHERE Id =: caseId];
        
        System.debug('case: ' + c);
        return c;
    }
}