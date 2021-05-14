({
	receiveData : function(component, event, helper) {
		
        var msg = event.getParam('message');
        component.set('v.finalmessage', msg);
        
        console.log('🚗' +msg);
	}
})