/***********************************************************************************************************************
@Author : Ajay Verma
@Created Date : 27/04/2023
@Modify Date : 
@Description : Trigger to count the Contacts related to any account whenever any attachment is 
created, Updated, deleted or restored from Recyclebin
************************************************************************************************************************/
trigger NumberOfContactsTrigger on Contact (after insert, after update, after delete, after undelete) {
    
    //List of Parent account Id's 
    Set<Id> accountIds = new Set<Id>();
    
    //when contacts are created, updated and restored from Recyclebin 
    if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
        //for bulkify
        for(Contact con:trigger.new){
            if(con.AccountId != null){
                accountIds.add(con.AccountId);
            }
        }
    }
    //when contacts are deleted and restored from Recyclebin 
    if(trigger.isUpdate || trigger.isDelete){
        //for bulkify
        for(Contact con:trigger.old){
            if(con.AccountId != null){
                accountIds.add(con.AccountId);
            }
        }
    }
    system.debug('@@ accountIds :'+accountIds);
    //call the handler class
    NumberOfContactsTriggerHandler.CountNumberOfContacts(accountIds);
}