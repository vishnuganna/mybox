public class c2{
list<opportunity> opp =[select id,name,StageName from opportunity where StageName ='Closed Won'];
List<opportunity> opp1=[select id,name,StageName from opportunity where StageName ='Closed Lost'];

public list<opportunity> getopp(){
return opp;
}
public list<opportunity> getopp1(){
return opp1;
}
}