/***********************************************************************************************************************
	@Author : Ajay Verma
	@Created Date : 27/04/2023
	@Modify Date : 
	@Description : This class useing Create a fake response for callout 
************************************************************************************************************************/
@isTest
global class getPostmanCallOutMock implements HttpCalloutMock {
  // Implement this interface method
  global HTTPResponse respond(HTTPRequest request) {
    // Create a fake response
    HttpResponse response = new HttpResponse();
    response.setHeader('Content-Type', 'application/json');    
    response.setBody('{"args":{"foo1":"bar1","foo2":"bar2"},"headers":{"x-forwarded-proto":"https","x-forwarded-port":"443","host":"postman-echo.com","x-amzn-trace-id":"Root=1-644aae4f-7686ac4f7988f16c3f4dcae4","user-agent":"PostmanRuntime/7.32.2","accept":"*/*","postman-token":"0c0d29ff-64e9-441f-b68d-d603c4ce35e4","accept-encoding":"gzip, deflate, br"},"url":"https://postman-echo.com/get?foo1=bar1&foo2=bar2"}');
    response.setStatusCode(200);
    return response; 
  }
}