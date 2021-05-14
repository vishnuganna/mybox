({
	sendDataToParent : function(component, event, helper) {
        
        var t = component.getEvent('cmpEvent');
        
        var greeting = component.get(' v.greeting ');
        
        t.setParams({
            'message' : greeting,
        });
        
        t.fire();
		
	}
})