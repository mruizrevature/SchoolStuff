public class FindMyClasses {
    
    public String className {get;set;}
    public List<Class__c> classes {get;set;}
    public boolean classesFound {get;set;}
    
    public FindMyClasses() {
        classesFound = false;
    }
    
    public void findEnglishClasses() {
        classes = [SELECT Id, Name, Capacity__c FROM Class__c WHERE Name LIKE '%ENG%'];
        System.debug('english classes: ' + classes);
        if(classes != null)
            classesFound = true;
    }
    
    public void findClasses() {
        String searchCriteria = '%' + className + '%';
        classes = [SELECT Id, Name, Capacity__c FROM Class__c WHERE Name LIKE :searchCriteria];
        if(classes != null)
            classesFound = true;
    }
    
    
}