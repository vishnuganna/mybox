Public class wrapperclass{

    public list<wrapaccount> wrapaccountlist{get; set;}
    Public List<Account>     acc{get; set;} 
   Public wrapperclass(){
    If(wrapaccountlist == Null){
        wrapaccountlist = new List<wrapaccount>(); 
         for(Account a: [select Id, Name, BillingState, Website, Phone from Account limit 10])
         
            wrapaccountlist.add(new wrapaccount(a));
            }
      }
 
 
 public void processSelected() {
    acc = new List<Account>();
 
        for(wrapaccount wrapAccountObj : wrapaccountlist) {
            if(wrapAccountObj.selected == true) {
                acc.add(wrapAccountObj.acc);
            }
        }
    }
  public class wrapAccount {
        public Account acc {get; set;}
        public Boolean selected {get; set;}
 
        public wrapAccount(Account a) {
            acc = a;
            selected = false;
        }
    }
}