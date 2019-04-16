/*
 * Notes:
 * 			- Batch Apex is asynchronous, with all the benefits and downsides that may have.
 * 			- To monitor all existing batch jobs, you can go to:
 * 						Setup -> Monitoring -> Apex Jobs or Jobs -> Apex Jobs
 * */

global class NewBatchClass implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
    	// Get all of the accounts we will be operating on.
    	String query = 'SELECT Id, Name FROM Account';
        return database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        for (Account acc : accList) {
            acc.Name = acc.Name + ' Batch';
        }
        update accList;
    }
    
    global void finish(Database.BatchableContext BC) {
        // Do some post execution logic.
    }
    
    /*
     * To execute the batch process simply instantiate and execute as so:
     * 
     * 			NewBatchClass nbc = new NewBatchClass();
     * 			database.executeBatch(nbc);
     * 
     * 			NewBatchClass nbc = new NewBatchClass();
     * 			database.executeBatch(nbc, 150);
     * 		We will only operate on a batch of that size,
     * 			by default it operates on 200.
     * 			
     * */
    
    
}