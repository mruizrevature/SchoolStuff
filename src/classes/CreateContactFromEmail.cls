global class CreateContactFromEmail implements Messaging.InboundEmailHandler {
    global static Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        
        String subToCompare = 'Create Contact';
        
        if(email.subject.equalsIgnoreCase(subToCompare)) {
            Contact c = new Contact();
            c.LastName = email.plainTextBody;
            
            try { 
                insert c;
                result.success = true;
            } catch (Exception e) {
                System.debug('Error: ' + e);
            }
        }
        
        return result;
    }
}