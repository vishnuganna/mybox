({
	save : function(component, Event, helper) {
        console.log('save:1');
       	var action = component.get("c.saveCamping");
     	var camping = component.set("v.camping","Camping_Item__c");
        //action.setParams({ "Camping_Item__c": camping  });
        action.setCallback(this, function() {  console.log('SAVED.');  } );
        $A.enqueueAction(action);
        console.log('save:end');
    },
    
    /*
    save : function (component, event, helper) {
    var createRecordEvent = $A.get("e.force:createRecord");
    createRecordEvent.setParams({
        "Camping_Item__c": "Camping"
    });
    createRecordEvent.fire();
  }*/
    
    
})