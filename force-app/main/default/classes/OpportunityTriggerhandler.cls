public class OpportunityTriggerhandler {
    public static void insertOpportunity(List<Opportunity> opp){
        
        for(Opportunity newRecord1  : opp){
            if(newRecord1.Amount == NULL){
               
                newRecord1.Amount = 0;
                }
            
           }
        }
 
    public static void updateOppOnce(Map<id,Opportunity> oldMap,Map<id,Opportunity> newMap){
        
        Opportunity oldOne = new Opportunity();
        Opportunity newOne = new Opportunity();
        oldOne = oldMap.values();
        newOne = newMap.values();
        
        Set<id> oppId = new Set<id>();
        Set<id> newId = new Set<id>();
        oppId = oldMap.keySet();
        newId = newMap.keySet();
        system.debug('old'+  oppId);
        system.debug('old'+ newId);
        system.debug(oldOne.StageName);
        system.debug(newOne.StageName);
        
        
        if(oppId == newId){
            if(oldOne.StageName != newOne.StageName){
            newOne.Amount = newOne.Amount + 1000;
        }
        }
        }
    
    
  public static void updateOppTwice(List<Opportunity> opp,Map<id,Opportunity> newMap){
          Opportunity newOne = new Opportunity();
        newOne = newMap.values();
       Set<id> newId = newMap.Keyset();
        SYSTEM.debug(newId);
       for(id id1: newId){  
         for(Opportunity newRecord : opp){
             if(newRecord.Id == id1){
                 system.debug(newRecord.StageName);
                 system.debug( newOne.StageName);
                 if(newRecord.StageName != newOne.StageName){
                     newRecord.Amount = newRecord.Amount + 2000;
                 }
                 
             }
         }
            
       }
    
     
     }
    public static void updateAmount(List<Opportunity> oldList,Map<id,Opportunity> newMap){
       List<Opportunity> amountChanged = new List<Opportunity>();
        for(Opportunity opp : oldList){
            Opportunity newOpp = newMap.get(opp.id);
            if(opp.Amount != newOpp.Amount ){
                amountChanged.add(newOpp);
            }
        }
        List <OpportunityChildren__c> optyIncrement = new List <OpportunityChildren__c>();
        for(Opportunity op :[Select id,(Select id,Name,Amount__c from OpportunityChildren__r)From Opportunity where id In :amountChanged]){
           List<OpportunityChildren__c> children = op.OpportunityChildren__r; 
            optyIncrement.addAll(children);
            }
        
        
        for(OpportunityChildren__c opty : optyIncrement){
            if(opty.Amount__c == NULL){
            opty.Amount__c =  200;
            }ELSE{
              opty.Amount__c =  opty.Amount__c +200;  
            }
        }
        update  optyIncrement;
        
    }
    
    
}