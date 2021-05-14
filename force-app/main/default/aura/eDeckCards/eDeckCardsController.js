({
	getAccountList : function(component, event, helper) {
		        var action = component.get("c.eAccountsDeck");
       
        
        action.setCallback(this, function(data) {
                       
                component.set("v.accountList", data.getReturnValue());
            
        });
        // Adding the action variable to the global action queue
        $A.enqueueAction(action);
        }    

	
})