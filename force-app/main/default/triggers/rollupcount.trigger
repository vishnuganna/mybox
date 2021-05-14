trigger rollupcount on Contact (after insert,after Delete,after update,after undelete) {

    set<Id> AccountId = new set<Id>();
    
    if(trigger.isinsert || trigger.Isundelete||trigger.isupdate)
    {
        for(contact Stud:trigger.new)
        {
            AccountId.add(Stud.accountid);
        }
    }
    if(trigger.isdelete)
    {
        for(contact Stud:trigger.old)
        {
            AccountId .add(Stud.accountid);
        }
    }
    
List<Account> SportsList =[select Id,Name,child_count__c,(Select Id,name from contacts) from Account where Id In:AccountId ];
for(Account Sports:SportsList )
{
    Sports.child_count__c = Sports.contacts.Size();
}
    update SportsList ;    
}