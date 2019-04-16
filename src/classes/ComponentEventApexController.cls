public class ComponentEventApexController {
	@AuraEnabled
    public static List<Case> getCasesWithPriority(String priority) {
        return [
            SELECT 
            	Id, CaseNumber, Subject, Status, Priority
            FROM
            	Case
            WHERE 
            	Priority = :priority
        ];
    }
}