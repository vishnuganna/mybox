trigger AccountAddressTrigger on Account (Before Insert) {
    List<Account> Acc1 = New List<Account>();
    list<Account> Acc = new List<Account>([Select Id,Match_Billing_Address__c,BillingPostalCode,ShippingPostalCode FROM Account]);
    
    For(Account a: Trigger.New) {
    
        if(a.Match_Billing_Address__c == TRUE && a.BillingPostalCode != NULL)
            {
                a.ShippingPostalCode = a.BillingPostalCode;
             }
             Acc1.add(a);
    }    
}