@isTest
public class StudentSharingTest {
    @isTest static void testManualShareRead() {
        List<Id> userIds = new List<Id>{'0051U000004UnYbQAK', '0051U000004V4sWQAS'};
        List<User> users = [SELECT Id FROM User WHERE Id IN :userIds];
        System.debug('Users: ' + users);
        
        Id user1Id = users[0].Id;
        Id user2Id = users[1].Id;
        
        // Create a new Class
        Class__c c = new Class__c();
        c.Name = 'PHY450';
        c.OwnerId = user1Id;
        insert c;
        
        System.debug('c: ' + c);
        
        // Insert manual share for user who is not record owner.
        System.assertEquals(true, StudentSharing.manualShareRead(c.Id, user2Id));
        
    }
}