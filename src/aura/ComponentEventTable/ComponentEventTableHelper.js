({
	getCases : function(component) {
		// Step 1 - open reference to server-side controller
        var getCasesAction = component.get("c.getCasesWithPriority");
        
        // Step 2 (Optional) - Set parameters
        getCasesAction.setParams({ "priority" : component.get("v.priority") });
        
        // Step 3 - Set callback
        getCasesAction.setCallback(this, function(response) {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                console.log('Cases got got');
                
                console.log('Cases: ' + JSON.stringify(response.getReturnValue()));
                component.set("v.data", response.getReturnValue());
            } else {
                console.log('Getting cases failed with state: ' + state);
            }
        });
        
        // Step 4 - Enqueue Action
        $A.enqueueAction(getCasesAction);
	}
})