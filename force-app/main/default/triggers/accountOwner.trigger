trigger accountOwner on Account (after insert,after update) {

    set<id> setAccountid = new set<id>();
    if(trigger.isAfter && trigger.isupdate){
        for(Account acc: trigger.new){
            if(acc.OwnerId != trigger.oldmap.get(acc.id).ownerId){
                    setAccountId.add(acc.Id) ;

            }
        }
    }
            if(!setAccountId.isEmpty()){
            list<Account> listAccount = [Select Id, OwnerId, (Select Id, OwnerId from Contacts) from Account Where Id IN: setAccountId] ;
            if(listAccount != null && !listAccount.isEmpty()){
                list<Contact> listContact = new list<Contact>() ;
                for(Account acc : listAccount){
                    for(Contact con : acc.Contacts){
                        con.OwnerId = acc.OwnerId ;
                        listContact.add(con) ;
                    }
                }
                if(!listContact.isEmpty()) update listContact ;
            }
            }
}