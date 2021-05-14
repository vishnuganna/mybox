public class campinglight {

      @AuraEnabled public static Camping_Item__c saveCamping(Camping_Item__c camping){
          
         insert camping;
        return camping;
    }   
    }