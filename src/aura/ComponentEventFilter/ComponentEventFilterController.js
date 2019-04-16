({
	priorityChanged : function(component, event, helper) {
		console.log('Firing Priority Change Event');
        
        var newPriority = component.get("v.priority");
        
        var priorityChangeEvent = component.getEvent("priorityChangeEvent");
        
        priorityChangeEvent.setParams({
            "priority" : newPriority
        });
        
        priorityChangeEvent.fire();
	},
})