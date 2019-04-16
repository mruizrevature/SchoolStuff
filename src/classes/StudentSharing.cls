public class StudentSharing {
    public static Boolean manualShareRead(Id recordId, Id userOrGroupId) {
        // Step 1: Create share object
        Class__Share classShr = new Class__Share();
        
        // Step 2: Set the Id of the record being shared.
        classShr.ParentId = recordId;
        
        // Step 3: Set the Id of user or group being granted access.
        classShr.UserOrGroupId = userOrGroupId;
        
        // Step 4: Set the access level.
        classShr.AccessLevel = 'Read';
        
		// Step 5: Set rowCause
		// Note: 'manual' is the default value 
		classShr.RowCause = Schema.Class__Share.RowCause.Manual;
        
        // Step 6: Insert the sharing record and capture the save result.
        Database.SaveResult sr = Database.insert(classShr,false);
        
        if(sr.isSuccess()) {
            System.debug('Class__Share record with ID: (' + classShr.Id + ') has been successfully shared.' );
            return true;
        } else {
            return false;
        }
        
    }
}