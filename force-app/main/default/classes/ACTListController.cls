public with sharing class ACTListController {


    public String renderProcess { get; set; }

    private Id currentUser;


    public final Integer MAX_DISPLAY_RESULTS = 5;
      
    //public Schema.SObjectType objType {get;set;}

    Public string objType {get;set;}


    Public lIST<string> Type {get;set;}

    Public ID PrcocessID{get;set;} 
 
    //public List<ProcessInstance> process {get; set;}

    public List<processinstanceworkitem> process {get;set;}

   
    public ACTListController() {

        currentUser = UserInfo.getUserId();

 

                  //Process=[select id, actorid ,ProcessInstanceId, processinstance.targetobjectid,processinstance.targetobject.name ,CreatedDate from processinstanceworkitem where actorid = :userinfo.getuserid() LIMIT :MAX_DISPLAY_RESULTS];

                Process=[select ProcessInstanceId, ProcessInstance.TargetObjectId,ProcessInstance.TargetObject.Name,ProcessInstance.TargetObject.Type,ProcessInstance.CreatedBy.Name,
ProcessInstance.CreatedDate,CreatedDate from ProcessInstanceWorkitem  where isDeleted=false and ActorId=:userinfo.getuserid() and ProcessInstance.status='Pending' order by ProcessInstance.TargetObject.Type, SystemModstamp desc];

                  /*for( processinstanceworkitem p:process){
 
                 
                  objType=P.processinstance.targetobjectid.getSObjectType().getDescribe().getName();               

                                   
                  

                  } */
              
                            
                  
            }
           /* public PageReference processLinkClick() {        
        // now process the variable by doing something...

          PageReference pageRef =new PageReference('p/process/ProcessInstanceWorkitemWizardStageManager?id=' + Process.id);         //Id id = System.currentPageReference().getParameters().get('id');
           
        // pageRef.getParameters().put('id',id);
         pageRef.setRedirect(true);
         return pageRef;
 
           }*/
           }