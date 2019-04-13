({
	handleClick : function(component, event, helper) {
		var symptomList = [];
        var conditionList = [];
        
        var age = component.get("v.age");
        var sex = component.get("v.sex");
        
        var checkboxes = component.find("symptomform");
        
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].get("v.checked")) {
                symptomList.push(checkboxes[i].get("v.value"));
            }
        }
        
        console.log('symptomList: ' + symptomList);
        
        var calloutAction = component.get("c.getConditions");
        
        calloutAction.setParams({
            "age" : age,
            "sex" : sex,
            "symptoms" : symptomList
        });
        
        calloutAction.setCallback(this, function(response) {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                var data = response.getReturnValue();
                console.log('data: ' + data);
                
                for (var i = 0; i < data.length; i++) {
                    conditionList.push(data[i]);
                }
            }
            component.set("v.listOfPossibleConditions", conditionList);
        });
        
        $A.enqueueAction(calloutAction);
	},
})