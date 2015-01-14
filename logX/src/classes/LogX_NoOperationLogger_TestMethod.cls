/*
*   LogX_NoOperationLogger test method.
*
*   Date       Person   Responsible Details 
*   7/11/2014    kiwi    created.
*
*/
@isTest
public class LogX_NoOperationLogger_TestMethod
{
    private static LogX_NoOperationLogger logger = new LogX_NoOperationLogger();
    
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
        logger.debug('tag', 'INFO', 'this is a log');
        
        System.assert(true);
    }
}