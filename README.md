# InterviewExcersice

/******************************************************************************** 
Company:            Ksquare Group
Author:             Paulo Rodriguez
Customer:           Ksquare Group
Descripción:        Create an Apex class called "OpportunityUtils" with a static method that calculates the average 
                    amount of all closed-won opportunities in Salesforce.

Information about changes (versions)
===============================================================================
No.    		Date             		Author                 Description
1.0         06-20-2023   	      	Paulo Rodriguez        Creation
******************************************************************************* */

public class OpportunityUtils {
    
 static Decimal calculateAverageOpportunityAmount() {
 
 List<AggregateResult> totalAmountList = [SELECT SUM(Amount) FROM Opportunity WHERE StageName = 'Planificación' ];
 Decimal totlaAmount = Integer.valueOf(totalAmountList[0].get('expr0')) == null ? 0 : Integer.valueOf(totalAmountList[0].get('expr0'));
 system.debug(totlaAmount);     
     

 List<AggregateResult> totalOppList = [SELECT COUNT(id) FROM Opportunity WHERE StageName = 'Closed Won'];
 Decimal totalOpp = Integer.valueOf(totalOppList[0].get('expr0')) == null ? 0 : Integer.valueOf(totalOppList[0].get('expr0'));
 system.debug(totalOpp);

 
 Decimal averageAmount = totalOpp != 0  ?  totlaAmount / totalOpp : 0 ;   
 
 return averageAmount;
 }
