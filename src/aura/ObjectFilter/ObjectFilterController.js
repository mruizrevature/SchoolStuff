({
	doInit : function(component, event, helper) {
        
		var typeOfObjectToList = component.get("v.typeOfObjectToList");
        
        var getObjectAction = component.get("c.getObjects");
        
        getObjectAction.setParams({
            "sobjectType" : typeOfObjectToList
        });
        
        getObjectAction.setCallback(this, function(response) {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                console.log(typeOfObjectToList + ' objects successfully retrieved.');
                component.set("v.options", response.getReturnValue());
                console.log('options: ' + JSON.stringify(response.getReturnValue()));
            } else {
                console.log(typeOfObjectToList + ' objects were not successfully retrieved.');
            }
        });
        $A.enqueueAction(getObjectAction);
	},
    
    addObject : function(component, event, helper) {
        console.log('addObject started');
        
        var objectToBeAdded = component.get("v.selectedObject");
        console.log('objectToBeAdded: ' + objectToBeAdded);
        
        var objectAddedEvent = $A.get("e.c:ObjectAddedEvent");
        
        objectAddedEvent.setParams({
            "objectAdded" : objectToBeAdded
        });
        
        console.log('About to fire objectAddedEvent');
        
        objectAddedEvent.fire();
        console.log('objectAddedEvent fired');
    },
})