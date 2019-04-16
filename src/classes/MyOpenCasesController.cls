public class MyOpenCasesController {
	@AuraEnabled
    public static List<Case> getMyOpenCases() {
        
        // Check if user has access to view Case object
        if (!Schema.SObjectType.Case.isAccessible()) {
            // Pass the error to the client
            throw new AuraHandledException('You cannot access the Case object');
        }
        
        // Check if user access fields
        String [] caseFields = new String [] {
            'Id', 'CaseNumber', 'Status', 'Subject'
        };
        
        Map<String, Schema.SObjectField> caseMap = 
            Schema.SObjectType.Case.fields.getMap();
        
        for (String field : caseFields) {
            if(!caseMap.get(field).getDescribe().isAccessible()) {
                System.debug('Handled on the server-side');
                return new List<Case>();
            }
        }
        
        return [
            SELECT
            	Id, CaseNumber, Subject, Status
            FROM
            	Case
            WHERE
            	Status != 'Closed'
        ];
    }
}