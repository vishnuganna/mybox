trigger accountContactInsert on Account (After insert) {
  List<contact> contactInsert = new list<contact>();
    
    for(Account a:Trigger.new){
        contact con = new contact();
        con.FirstName = a.Name;
        con.LastName = 'test';
        con.AccountId = a.id;
        contactInsert.add(con);
    }
    insert contactInsert;
}