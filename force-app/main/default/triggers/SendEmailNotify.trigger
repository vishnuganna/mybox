trigger SendEmailNotify on Account (After Update) {

  List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
  List<ID>ownerids=new List<ID>();
  
  List<String> sendTo = new List<String>();
  List<User>users=new List<User>();
  
     
    for(Account a: Trigger.New){
    ID oldOwnerID=Trigger.oldMap.get(a.Id).ownerID;
        If(a.ownerID!=oldOwnerID)
        
        {
         ownerids.add(a.ownerID);
         //ownerids.add(a.oldOwnerID);
                }
                
} 
if(ownerids.size()>0 ){
   users=[select name,id,email from user where id in:ownerids];
    system.debug('-------------users------'+users);
    if(users.size()>0){
     for(User u:users){
      sendTo.add(u.Email);  
      }
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      mail.setSenderDisplayName('Email alert');
      mail.setSubject('Owner change');
      String body = 'Dear User Owner changed';      
      mail.setToAddresses(sendTo);
      mail.setHtmlBody(body);
      mails.add(mail);
      }
}
}