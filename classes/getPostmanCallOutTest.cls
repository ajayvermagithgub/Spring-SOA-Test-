/***********************************************************************************************************************
	@Author : Ajay Verma
	@Created Date : 27/04/2023
	@Modify Date : 
	@Description : testing for getPostmanCallOut
************************************************************************************************************************/
@isTest
private class getPostmanCallOutTest {
 
    @isTest static void testPostCallout() {
    // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new getPostmanCallOutMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    String expectedValue = getPostmanCallOut.getPostmanCalloutResultByEndPoint();
    System.debug('expectedValue=' + expectedValue);
    System.assertNotEquals(0, expectedValue.length());    
  }
}