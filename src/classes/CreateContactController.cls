public class CreateContactController {
    @AuraEnabled
    public static void createContactDB(Contact newContact) {
        // Check if user can create Case object
        if (!Schema.SObjectType.Contact.isCreateable()) {
            // Pass error to the client
            throw new AuraHandledException('You cannot create Contacts');
        }
        
        //caseObj.contactId = contactId;
        
        try {
            insert newContact;
        } catch (Exception e) {
            System.debug('An error has occurred: ' + e.getMessage());
        }
        
        //return newContact.Id;
        
    }
}