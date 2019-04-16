({
    doInit : function(component, event, help) {
        // grab the value of the attribute where name="numberOne"
        var numberOne = component.get("v.numberOne");
        // grab the value of the attribute where name="numberTwo"
        var numberTwo = component.get("v.numberTwo");
        
        // Check if undefined
        if (numberOne === undefined)
            console.log('numberOne is undefined');
        if (numberTwo === undefined)
            console.log('numberTwo is undefined');
    },
    
    addNumbers : function(component, event, helper) {
        var numberOne = component.get("v.numberOne");
        var numberTwo = component.get("v.numberTwo");
        
        var sum = numberOne + numberTwo;
        component.set("v.sum", sum);
    },
    
    sumChanged : function(component, event, helper) {
        helper.helperMethod1(component);
    },
})