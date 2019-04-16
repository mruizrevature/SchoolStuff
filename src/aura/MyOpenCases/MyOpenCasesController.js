({
	doInit : function(component, event, helper) {
		console.log('doInit is starting');
        
        // Step 1 - Open reference to controller method
        var getMyOpenCases = component.get("c.getMyOpenCases");
        
        // Step 2 (Optional) - set parameters
        //getMyOpenCases.setParams();
        
        // Step 3 - Set callback
        getMyOpenCases.setCallback(this, function(response) {
            var state = response.getState();
            
            if(component.isValid() && state === "SUCCESS") {
                console.log('Getting Cases');
                console.log('Cases: ' + JSON.stringify(response.getReturnValue()));
                
                component.set("v.cases", response.getReturnValue());
            } else if (state === "Error") {
                var errors = response.getError();
                
                if (errors) {
                    for(var i = 0; i < errors.size(); i++) {
                        if(errors[i] && errors[i].message) {
                            console.log('Error message: ' + errors[i].message); 
                        }
                    }
                }
            } else {
                console.log('Unknown error');
            }
        });
        
        // Step 4 - enqueue action
        $A.enqueueAction(getMyOpenCases);
        
        console.log('doInit has finished');
	},
})