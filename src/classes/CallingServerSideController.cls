public class CallingServerSideController {
	@AuraEnabled
    public static List<Account> getAccounts() {
        return [SELECT Name FROM Account];
    }
}