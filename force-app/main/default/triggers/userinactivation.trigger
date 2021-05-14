trigger userinactivation on User (After update) {

    set<id> userids = new set<id>();
    for(User u:trigger.new)
    {
        if(!u.IsActive)
        userids.add(u.id);
        System.debug('userids'+userids);
    }
        System.debug('userids'+userids);
        List<User> userlist =New List<User>(); 
        userlist = [select Id,Firstname,LastName,email,manager.email from User where Id IN:userids]; 
        List<Account> acctlist = new List<Account>();
     for(User u:userlist)
     {
          acctlist = [Select Id,Name,type,Owner.Name,owner.manager.email from Account where OwnerId=:u.Id];
     }

        string header = 'Account Id, Name , Type,current User, New Owner \n';
        String finalstrg=header ;
        for(Account acc:acctlist)
        {
            String recordstrg = acc.id+','+acc.Name+','+acc.type+','+acc.Owner.name+','+' '+'\n';
            finalstrg = finalstrg+recordstrg ;
        }
            System.debug('finalstrg'+finalstrg);
        if(acctlist.size()>0)
        {
            String owneraddress =acctlist[0].owner.manager.email;
            System.debug('yogesh'+owneraddress );
            Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
            blob csvBlob = Blob.valueOf(finalstrg);
            string csvname= 'Account Unassigned.csv';
            csvAttc.setFileName(csvname);
            csvAttc.setBody(csvBlob);
            Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
            String[] toAddresses = new list<string> {owneraddress };
            String[] CCEmails = new String[]{'vishnusree550@gmail.com'};
            email.setCCAddresses(CCEmails);
            String subject ='Unassigned Accounts which needed to be reassigned';
            email.setSubject(subject);
            email.setPlainTextBody('UnassignedAccounts');
            email.setToAddresses( toAddresses );    
            email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
            String emailBody = '';
            for(User usr :userlist)
//SEND LINKS TO REPORTS SHOWING ACCOUNTS, OPPORTUNITIES, CASES, ACTIVITES OWNED BY LEAVER
            emailBody += 'Your subordinate :<b> ' + usr.FirstName + ' ' + usr.LastName + ' </b>has left the organization.<p>' +
         'To view the Accounts owner by this User <a href=' +  System.Url.getSalesforceBaseURL().toExternalForm() + '/'+usr.Id+'>click here.</a> <p>';

            email.setHtmlBody(emailBody);
            system.debug('output'+emailBody);
            Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
}
}