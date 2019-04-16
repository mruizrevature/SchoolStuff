({ 
    doInit : function(component, event, helper) {
        component.set("v.data", []);
        
        var typeOfSObjectToList = component.get("v.typeOfSObjectToList");
        
        switch (typeOfSObjectToList) {
            case "Case" :
                component.set('v.columns', [
                    {label: 'Case Number', fieldName: 'CaseNumber', type: 'text'},
                    {label: 'Status', fieldName: 'Status', type: 'text'},
                    {label: 'Priority', fieldName: 'Priority', type: 'text'}
                ]);
                break;
            case "Contact" : 
                component.set('v.columns', [
                    {label: 'Name', fieldName: 'Name', type: 'text'},
                    {label: 'Phone', fieldName: 'Phone', type: 'text'}
                ]);
                break;
            default :
                component.set('v.columns', [
                    {label: 'Case Number', fieldName: 'CaseNumber', type: 'text'}
                ]);  
                
        }
    },
    
    addObjectToTable : function(component, event, helper) {
        console.log('starting addObjectToTable');
        var objectToBeAdded = event.getParam("objectAdded");
        console.log('object to be added: ' + objectToBeAdded);
        
        var getCaseFromID = component.get("c.getCaseFromID");
        getCaseFromID.setParams({
            "caseId" : objectToBeAdded
        });
        
        getCaseFromID.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                console.log('case: ' + JSON.stringify(response.getReturnValue()));
                
                var data = component.get("v.data");
                data.push(JSON.stringify(response.getReturnValue()));
                
                component.set("v.data", data);
                console.log('data: ' + component.get("v.data"));
            } else {
                console.log('Failed with state: ' + state);
            }
        });
        
        $A.enqueueAction(getCaseFromID);
    },
})