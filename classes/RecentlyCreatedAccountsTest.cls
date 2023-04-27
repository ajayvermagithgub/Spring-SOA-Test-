/***********************************************************************************************************************
	@Author : Ajay Verma
	@Created Date : 27/04/2023
	@Modify Date : 
	@Description : This test class showing 10 recently created account in lighting component.
************************************************************************************************************************/
@isTest
private class RecentlyCreatedAccountsTest {
 
    @isTest static void testRecentlyCreatedReocrds() {
        
        List<Account>CreateAccList = new List<Account>();
        For(Integer i=1; i<=10; i++){
           Account newAcc = new Account();
           newAcc.Name = 'Test Account '+i;
           CreateAccList.add(newAcc);
        }
        insert CreateAccList;
       system.debug('@@CreateAccList : '+CreateAccList);
        Test.startTest();
        List<Account>ReclentlyAcc = RecentlyCreatedAccounts.getAllAccounts();
        Test.stopTest();
        
        System.AssertEquals(10, +ReclentlyAcc.size()); 
    }
}