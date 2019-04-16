public class GetObjectsApexController {
    @AuraEnabled
    public static List<SObject> getObjects(String sobjectType) {
        if (sobjectType == 'Case') {
            return [SELECT CaseNumber, Status, Priority FROM Case];
        } else if (sobjectType == 'Contact') {
            return [SELECT Name, Phone FROM Contact];
        } else {
            return new List<SObject>();
        }
    }
}