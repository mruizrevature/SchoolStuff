({
	changeText : function(component, event, helper) {
		// Retrieve text component using local ID
		var text = component.find("myText");
        console.log('text component: ' + text);
        
        // Set the value attribute of the component
        text.set("v.value", "Hello");
        
        // Set the title attribute
        text.set("v.title", "Look at me!");
	}
})