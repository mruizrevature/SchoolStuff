({
    saveOpportunity : function(component, event, helper) {
        console.log('SaveOpportunity is has started');
        var newOpportunity = component.get("v.newOpportunity");
        //var contactId = component.get("v.recordId");
        
        // Step 1 - create reference to server-side method
        var createNewOpportunity = component.get("c.createOpportunityDB");
        
        // Step 2 (Optional) - Set parameters
        createNewOpportunity.setParams({
            "newOpportunity" : newOpportunity,
            //"contactId" : contactId
        });
        
        // Step 3 - Set callback
        createNewOpportunity.setCallback(this, function(response) {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                console.log('Success');
                /*var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": response.getReturnValue()
                });
                navEvt.fire();*/
            } else if (state === "ERROR") {
                var errors = response.getError();
                
                if (errors) {
                    for(var i = 0; i < errors.size(); i++) {
                        if(errors[i] && errors[i].message) {
                            console.log('Error message: ' + errors[i].message); 
                        }
                    }
                } 
            } else {
                console.log('Unknown problem, response state: ' + state);
            }
        });
        
        // Step 4 - enqueue action
        $A.enqueueAction(createNewOpportunity);
    }
})