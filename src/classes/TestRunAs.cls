@isTest
public class TestRunAs {
	@isTest(SeeAllData=true)
    static void viewClasses() {
        User u = [SELECT Id FROM User WHERE Id ='0051U000004V4sWQAS'];
        
        List<Class__c> classes = [SELECT Id, Name FROM Class__c];
        System.debug('Classes: ' + classes);
        System.runAs(u) {
            classes = [SELECT Id, Name FROM Class__c];
            System.debug('Classes: ' + classes);
        }
    }
}