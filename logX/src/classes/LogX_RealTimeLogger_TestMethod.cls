/*
*   LogX_RealTimeLogger test method.
*
*   Date       Person   Responsible Details 
*   11/11/2014    kiwi    created.
*
*/
@isTest
public class LogX_RealTimeLogger_TestMethod
{
    private static LogX_RealTimeLogger logger = new LogX_RealTimeLogger(LogX_RealTimeLogger.class, 'app');
    
    @isTest
    public static void testDebugObject()
    {
        logger.debug(new Account());  
        
         System.assert(true);
    }
    
    @isTest
    public static void testDebugObjectLoggingLevel()
    {
        logger.debug(LoggingLevel.INFO, 'this is a log');  
        
        System.assert(true);
    }
    
    @isTest
    public static void testDebugTagMessage()
    {
        logger.debug('tag', 'this is a log'); 
        
        System.assert(true);
    }
    
    @isTest
    public static void testDebugTagLevelMessage()
    {
        logger.setStore(false);
        logger.debug('tag', 'INFO', 'this is a log');
        
        System.assert(true);
    }
    
    @isTest
    public static void testCreatePushTopic()
    {
        //LogX_RealTimeLogger.createPushTopic();
        
        System.assert(true);
    }
}