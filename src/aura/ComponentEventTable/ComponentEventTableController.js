({
    doInit : function(component, event, helper) {
        component.set("v.columns", [
            {label: "Case Number", fieldName: "CaseNumber", type: "text"},
            {label: "Subject", fieldName: "Subject", type: "text"},
            {label: "Status", fieldName: "Status", type: "text"},
            {label: "Priority", fieldName: "Priority", type: "text"}
        ]);
        
        helper.getCases(component);
    },
    
    handlePriorityChangeEvent : function(component, event, helper) {
        console.log('Handling Priority Change Event');
        
        var newPriority = event.getParam("priority");
        component.set("v.priority", newPriority);
        
        helper.getCases(component);
    },
})