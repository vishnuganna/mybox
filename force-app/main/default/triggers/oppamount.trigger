trigger oppamount on Opportunity (before Insert) {

        for(opportunity opp1:Trigger.new)
        {
            if(opp1.amount<1000)
             {
              Insert opp1;
             }
         }    
                    
}