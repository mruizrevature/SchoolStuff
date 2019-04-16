public class CreateOpportunityController {
    @AuraEnabled
    public static void createOpportunityDB(Opportunity newOpportunity) {
        // Check if user can create Case object
        if (!Schema.SObjectType.Opportunity.isCreateable()) {
            // Pass error to the client
            throw new AuraHandledException('You cannot create Opportunity');
        }
        
        //caseObj.contactId = contactId;
        
        try {
            insert newOpportunity;
        } catch (Exception e) {
            System.debug('An error has occurred: ' + e.getMessage());
        }
        
        //return newContact.Id;
        
    }
}