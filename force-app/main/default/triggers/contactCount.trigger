trigger contactCount on Contact (After insert,After update,After Delete,After undelete) {
    
    set<id> Accountid = new set<id>();
    list<Account> Acc = new List<Account>();
    
    if(trigger.isinsert && trigger.isdelete && trigger.isundelete){
        for(contact c:trigger.new){
            accountid.add(c.accountid);
        }
    }
    
    if(trigger.isupdate){
        for(contact c:trigger.old){
            accountid.add(c.AccountId);
        }
    }
    
    List<Account> a = new list<account>([select id,name,contact_count__c,(select id,name from contacts) from account where id IN:accountid ]);
   // a = [select id,name,(select id,name from contacts) from account where id : Accountid ];
    
    for(account ac : a){
        list<contact> con = ac.contacts;
        ac.contact_count__c = con.size();
        acc.add(ac);
    }
    update acc;

}