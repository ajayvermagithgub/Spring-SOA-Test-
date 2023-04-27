/***********************************************************************************************************************
	@Author : Ajay Verma
	@Created Date : 27/04/2023
	@Modify Date : 
	@Description : Task 3 Make a basic http callout and print the result useing system.debug().
************************************************************************************************************************/
public class getPostmanCallOut {
    
    public static String getPostmanCalloutResultByEndPoint()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String result = response.getBody();
        system.debug('## Result: '+result);
        return result;
    }
}