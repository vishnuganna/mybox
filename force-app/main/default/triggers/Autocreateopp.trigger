trigger Autocreateopp on Account (After Insert) {

for(Account a : trigger.new)
{
if(a.type == 'Prospect'){
Opportunity o = New Opportunity();
o.name = 'Syntel';
o.Stagename = 'Qualify';
o.CloseDate = Date.today().addDays(30);
o.AccountId = a.Id;

If(a.Industry == 'Technology'){
o.Amount = 500000;
}
else if (a.Industry == 'NoProfit'){
o.Amount = 2000;
}
else{
o.Amount = 100;
}
Integer multiplier = 2;
if(a.NumberOfEmployees > 1000){
o.Amount = o.Amount * multiplier;
}
Insert o;
}
}
}