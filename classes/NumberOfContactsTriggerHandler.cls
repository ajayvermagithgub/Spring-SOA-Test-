/***********************************************************************************************************************
@Author : Ajay Verma
@Created Date : 27/04/2023
@Modify Date : 
@Description : Trigger handler class to count the Contacts related to any account 
************************************************************************************************************************/
public class NumberOfContactsTriggerHandler {
    
    public static void CountNumberOfContacts(Set<Id> accountIds){
        
        //check the account Id's is not empty 
        if(!accountIds.isEmpty()){
            List<Account> updateAccList = new List<Account>();
            for(Account acc: [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) 
                              FROM Account WHERE Id IN : accountIds]){
                Account objAcc = new Account(Id = acc.Id, Number_of_Contacts__c = acc.Contacts.size());
                updateAccList.add(objAcc);
            }
            // Update the value in the list of records
            if(!updateAccList.isEmpty()){
                update updateAccList;
            }
        } 
    }
}