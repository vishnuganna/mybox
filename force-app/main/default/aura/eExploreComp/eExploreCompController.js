({
	clickMe : function(component, event, helper) {
        
        var v = $A.get('e.c:eEventApp');
        
        v.setParams({
            'message' : 'HEY !! This is vishnu'
        });
        
        v.fire();
		
	}
})