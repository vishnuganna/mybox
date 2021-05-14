global class LeadProcessor implements 
    Database.Batchable<sObject>, Database.Stateful {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id,Name,Email,LeadSource From Lead');
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
       List<Lead> Le = New List<Lead>();
        for(Lead l :scope){
            l.LeadSource = 'Dreamforce' ;
            
            le.add(l);
           }
           update le; 
    }
    global void finish(Database.BatchableContext bc){
       
    }
    
}