public with sharing class accountDataTable {

        
            @AuraEnabled(cacheable=true)
            public static List<Account> getaccountDataTable(){
                return [Select id, name , Type ,rating, Phone, Website FROM Account];
            }
     
}