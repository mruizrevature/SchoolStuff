({
    saveCase : function(component, event, helper) {
        var newCase = component.get("v.newCase");
        var contactId = component.get("v.recordId");
        
        // Step 1 - create reference to server-side method
        var createNewCase = component.get("c.newCaseDBReturnAccount");
        
        // Step 2 (Optional) - Set parameters
        createNewCase.setParams({
            "caseObj" : newCase,
            "contactId" : contactId
        });
        
        // Step 3 - Set callback
        createNewCase.setCallback(this, function(response) {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                
                var caseCreatedEvent = $A.get("e.c:CaseCreatedEvent");
                
                caseCreatedEvent.setParams({
                    "accountId" : response.getReturnValue()
                });
  
                caseCreatedEvent.fire();
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
        $A.enqueueAction(createNewCase);
    }, 
})