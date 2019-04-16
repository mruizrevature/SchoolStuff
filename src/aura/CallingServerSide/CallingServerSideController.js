({
	doInit : function(component, event, helper) {
		var getAccounts = component.get("c.getAccounts");
        
        /*getAccounts.setParams({
            paramName : "value",
            paramTwo : "value2"
        });*/
        
        getAccounts.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
                component.set("v.accounts", response.getReturnValue());
            } else {
                console.log('error with state: ' + state);
            }
        });
        
        $A.enqueueAction(getAccounts);
	},
})