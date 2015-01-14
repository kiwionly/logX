/*
*   LogX_EmailLogger test method.
*
*   Date       Person   Responsible Details 
*   7/11/2014    kiwi    created.
*
*/
@isTest
public class LogX_ExternalPostLogger_TestMethod
{
    private static LogX_ExternalPostLogger logger;
    
    static {
        Map<String, String> header = new Map<String, String>();
        header.put('Authorization', 'Bearer ' + UserInfo.getSessionId());
        header.put('Content-Type', 'application/json'); // important !
    
        logger = new LogX_ExternalPostLogger(LogX_ExternalPostLogger.class, 'application', 
        'https://seagate--dev.cs3.my.salesforce.com/services/apexrest/logs', header);
    }
    
    @isTest
    public static void testDebugObject()
    {
        Test.setMock(HttpCalloutMock.class, new MockOKHttpResponse());
        
        logger.setStore(false);
        logger.setBatchSize(10);
        
        logger.debug(new LogX_UnsupportedOperationException('this is a log'));  
        
        logger.send();
        
        System.assert(true);
    }
    
    @isTest
    public static void testDebugObjectLoggingLevel()
    {
        Test.setMock(HttpCalloutMock.class, new MockOKHttpResponse());
        
        logger.debug(LoggingLevel.INFO, 'this is a log');
        
        System.assert(true);
    }
    
    @isTest
    public static void testDebugTagMessage()
    {
        Test.setMock(HttpCalloutMock.class, new MockOKHttpResponse());
        
        logger.debug('tag', 'this is a log');
        
        System.assert(true);
    }
    
    @isTest
    public static void testDebugTagLevelMessage()
    {
        Test.setMock(HttpCalloutMock.class, new MockOKHttpResponse());
        
        logger.debug('tag', 'INFO', 'this is a log');
        
        System.assert(true);
    }
    
    
    class MockOKHttpResponse implements HttpCalloutMock {
     
        public HTTPResponse respond(HTTPRequest req) {
            
            HttpResponse res = new HttpResponse();
            res.setBody('');
            res.setStatusCode(200);
            return res;
        }
    }
}