public class ActionSupportController {
	private Integer count = 0;
    
    public Integer getCount() {
        return count;
    }
    
    public PageReference incrementCounter() {
        count++;
        return null;
    }
}