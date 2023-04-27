/***********************************************************************************************************************
	@Author : Ajay Verma
	@Created Date : 27/04/2023
	@Modify Date : 
	@Description : This class showing 10 recently created account in lighting component.
************************************************************************************************************************/
public with sharing class RecentlyCreatedAccounts {

    @AuraEnabled(cacheable = true)
    public static List<Account> getAllAccounts(){
        List<Account> accList =[Select Id,Name,Industry,Number_of_Contacts__c,Rating,Phone,createdDate  
                                FROM Account order by createdDate DESC limit 10];
        return accList;
    }
}