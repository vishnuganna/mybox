({
	SendToVf : function(component, event, helper) {

		var v = component.get('v.message');

		var msgObj = {
			'greeting' :message
		}

		var baseDomain = 'https://' + component.get('v.baseDomain');

		var vfWindow = component.find('vframe').getElement().contentWindow;

		vfWindow.postMessage(msgObj, baseDomain)
		
	}
})