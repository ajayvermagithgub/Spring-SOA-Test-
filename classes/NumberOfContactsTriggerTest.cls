/***********************************************************************************************************************
    @Author : Ajay Verma
	@Created Date : 27/04/2023
	@Modify Date : 
    @Description : Trigger test class to count the Contacts related to any account 
************************************************************************************************************************/
@isTest
private class NumberOfContactsTriggerTest {
    
    //this method when insert the contact with related account
    @isTest static void testWhenInsertedContacts(){
        
        Account newAcc = new Account(Name = 'Test Account');
        insert newAcc;
        
		Contact newContat = new Contact();
        newContat.LastName = 'test contact';
        newContat.AccountId = newAcc.Id;
        
        Test.startTest();
        try{
            insert newContat;
        }Catch(Exception e){
            System.debug('@@ Exception :'+e.getMessage());
        }
        Test.stopTest();
        
        Account numberOfConts = [SELECT Number_of_Contacts__c FROM Account WHERE Id = :newAcc.Id Limit 1];
        System.debug('Number after trigger: ' + numberOfConts.Number_of_Contacts__c);
        System.AssertEquals(1, +numberOfConts.Number_of_Contacts__c);
    }
    
    //this method when delete the contact with related account
    @isTest static void testWhenDeletedContacts(){
        
        Account newAcc = new Account(Name = 'Test Account');
        insert newAcc;
        
		Contact newContat = new Contact();
        newContat.LastName = 'test contact';
        newContat.AccountId = newAcc.Id;
        insert newContat;

        Test.startTest();
        try{
            delete newContat;
        }Catch(Exception e){
            System.debug('@@ Exception :'+e.getMessage());
        }
        Test.stopTest();
        
        Account numberOfConts = [SELECT Number_of_Contacts__c FROM Account WHERE Id = :newAcc.Id Limit 1];
        System.debug('Number after trigger: ' + numberOfConts.Number_of_Contacts__c);
        System.AssertEquals(0, +numberOfConts.Number_of_Contacts__c);
    }
    
    //this method when insert the contacts with related account and get any exception
    @isTest static void testWhenGetContactsException(){
        
        Account newAcc = new Account(Name = 'Test Account');
        insert newAcc;
        
		Contact newContat = new Contact();
        newContat.FirstName = 'test contact';
        newContat.AccountId = newAcc.Id;
        
        Test.startTest();
        try{
            insert newContat;
        }Catch(Exception e){
            System.debug('@@ Exception :'+e.getMessage());
            System.AssertEquals('Insert failed. First exception on row 0; first error: REQUIRED_FIELD_MISSING, Required fields are missing: [LastName]: [LastName]', +e.getMessage());
        }
        Test.stopTest();
        
        Account numberOfConts = [SELECT Number_of_Contacts__c FROM Account WHERE Id = :newAcc.Id Limit 1];
        System.debug('Number after trigger: ' + numberOfConts.Number_of_Contacts__c);
        System.AssertEquals(null, +numberOfConts.Number_of_Contacts__c);
    }

}