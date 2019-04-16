({
    saveContact : function(component, event, helper) {
        console.log('SaveContact is has started');
        var newContact = component.get("v.newContact");
        //var contactId = component.get("v.recordId");
        
        // Step 1 - create reference to server-side method
        var createNewContact = component.get("c.createContactDB");
        
        // Step 2 (Optional) - Set parameters
        createNewContact.setParams({
            "newContact" : newContact,
            //"contactId" : contactId
        });
        
        // Step 3 - Set callback
        createNewContact.setCallback(this, function(response) {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
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
        $A.enqueueAction(createNewContact);
    }
})