public with sharing class accountDataTable {
/* testing github*/
        
            @AuraEnabled(cacheable=true)
            public static List<Account> getaccountDataTable(){
                return [Select id, name , Type ,rating, Phone, Website FROM Account];
            }
     
}