public class CreateCaseController {
    @AuraEnabled
    public static Id newCaseDB(Case caseObj, Id contactId) {
        
        // Check if user can create Case object
        if (!Schema.SObjectType.Case.isCreateable()) {
            // Pass error to the client
            throw new AuraHandledException('You cannot create Cases');
        }
        
        caseObj.contactId = contactId;
        
        try {
            insert caseObj;
        } catch (Exception e) {
            System.debug('An error has occurred: ' + e.getMessage());
        }
        
        return caseObj.Id;
    }
    
    @AuraEnabled
    public static Id newCaseDBReturnAccount(Case caseObj, Id contactId) {
        
        // Check if user can create Case object
        if (!Schema.SObjectType.Case.isCreateable()) {
            // Pass error to the client
            throw new AuraHandledException('You cannot create Cases');
        }
        
        caseObj.contactId = contactId;
        
        try {
            insert caseObj;
        } catch (Exception e) {
            System.debug('An error has occurred: ' + e.getMessage());
        }
        
        Contact c = [SELECT AccountId FROM Contact WHERE Id =: caseObj.contactId];
        
        return c.AccountId;
    }
}