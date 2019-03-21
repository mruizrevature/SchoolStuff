@isTest(SeeAllData=true)
public class LClass {  
    @isTest static void methodOne() {
        
        List<Account> accList = new List<Account>();
        for(Integer i = 0; i < 5; i++) {
            Account a = new Account(Name='Test' + 1);
            accList.add(a);
        }
        insert accList;
        
        System.debug('Number of DML Statements used in methodOne: ' + Limits.getDMLStatements());
        System.debug('Number of DML Statements allowed: ' + Limits.getLimitDMLStatements());
        
        System.debug('Amount of the heap currently being used in methodOne: ' + Limits.getHeapSize());
        System.debug('Total amount of the heap available: ' + Limits.getLimitHeapSize());
        
    }
    
    @isTest static void methodTwo() {
        List<Account> accList = new List<Account>();
        for(Integer i = 0; i < 5; i++) {
            Account a = new Account(Name='Test' + 1);
            insert a;
        }
        
        System.debug('Number of DML Statements used in methodTwo: ' + Limits.getDMLStatements());
        System.debug('Number of DML Statements allowed: ' + Limits.getLimitDMLStatements());
        
        System.debug('Amount of the heap currently being used in methodTwo: ' + Limits.getHeapSize());
        System.debug('Total amount of the heap available: ' + Limits.getLimitHeapSize());
    }
    
    @isTest static void methodThree() {
        List<Class__c> classes = [SELECT ID FROM Class__c LIMIT 5];
        List<Id> classIds = new List<Id>();
        SYstem.debug('Classes: ' + classes);
        for(Class__c c : classes) {
            classIds.add(c.Id);
        }
        
        for(ClassEnrollment__c ce : [SELECT Id FROM ClassEnrollment__c WHERE Class__c IN :classIds]) {
            
        }
        
        System.debug('Number of Queries used in methodThree: ' + Limits.getQueries());
        System.debug('Number of Queries allowed: ' + Limits.getLimitQueries());
    }
    
    @isTest static void methodFour() {
        List<Class__c> classes = [SELECT ID FROM Class__c LIMIT 5];
        SYstem.debug('Classes: ' + classes);
        for(Class__c c : classes) {
            List<ClassEnrollment__c> ces = [SELECT Id FROM CLassENrollment__c WHERE Class__c = :c.Id];
        }
        
        System.debug('Number of Queries used in methodFour: ' + Limits.getQueries());
        System.debug('Number of Queries allowed : ' + Limits.getLimitQueries());
    }
    
}