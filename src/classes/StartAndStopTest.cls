@isTest
public class StartAndStopTest {
    @isTest static void methodOne() {
        for(Integer i = 0; i < 100; i++) {
            List<Lead> l = [SELECT Id FROM Lead LIMIT 1];
        }
        
        System.debug('Number of Queries used: ' + Limits.getQueries());
        System.debug('Number of Queries allowed : ' + Limits.getLimitQueries());
        
        Test.startTest();
        System.debug('Number of Queries used: ' + Limits.getQueries());
        Test.stopTest();
    }
}