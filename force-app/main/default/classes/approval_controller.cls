public class approval_controller {
    public class item_wrapper {
        public item_wrapper(id id,string name) {
            this.id = id;
            this.name = name;
        }
        public id id { get; set; }
        public string name { get; set; }
    }
    
    public list<item_wrapper> items_to_approve { get; set; }
    
    public approval_controller() {
        items_to_approve = new list<item_wrapper>();
        for(ProcessInstanceWorkItem item:[select processinstance.targetobjectid,processinstance.targetobject.name from processinstanceworkitem where actorid = :userinfo.getuserid()]) {
            items_to_approve.add(new item_wrapper(item.processinstance.targetobjectid,item.processinstance.targetobject.name));
        }
    }
}