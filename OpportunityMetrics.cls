/******************************************************************************** 
Company:            Ksquare Group
Author:             Paulo Rodriguez
Customer:           Ksquare Group
Descripción:        Create an Apex class called "OpportunityMetrics" with a static method that calculates the win 
                    rate for each stage of opportunities in Salesforce

Information about changes (versions)
===============================================================================
No.    		Date             		Author                 Description
1.0         06-20-2023   	      	Paulo Rodriguez        Creation
******************************************************************************* */

public class OpportunityMetrics {

    
    public static Map<String, Decimal> calculateOpportunityWinRatesByStage() {
         
    Map<String, Decimal> winRatesByStage = new Map<String, Decimal>();
    AggregateResult totalOPPs   = [SELECT COUNT(id) cantidad FROM Opportunity];
    Decimal decimalOpp = Integer.valueOf(totalOPPs.get('cantidad'));
    
    for (AggregateResult result : [SELECT StageName, COUNT(id) cantidad FROM Opportunity GROUP BY StageName]){ 
            String stageName    = (String)result.get('StageName');
            Decimal amountCount = (Decimal)result.get('cantidad') ; 
        
            winRatesByStage.put(stageName, (amountCount / decimalOpp).setscale(2));
        }
    
     return winRatesByStage;
  }
}
