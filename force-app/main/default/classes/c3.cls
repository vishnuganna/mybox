Public class c3{

    public List<opportunity> opp;
    public List<account> acc;
    
    public List<account> getacc(){
    return acc;
    }
    
    public  List<opportunity> getopp(){
     return opp;
      }
    Public pageReference closedwon(){
    opp = [select Name, Type, StageName from opportunity where StageName = 'closed Won'];
    Return null;  
     }
    Public pageReference closedlost(){
    opp = [select Name, Type, StageName from opportunity  where StageName = 'closed lost'];
    Return null;
    }
    Public pageReference NeedsAnalysis(){
    opp = [select Name, Type, StageName from opportunity  where StageName = 'Needs Analysis'];
    Return null;
     }
}