/*
*   LogX_SystemLogger test method.
*
*   Date       Person   Responsible Details 
*   14/1/2015    kiwi    created.
*
*/
@isTest
public class LogX_SystemLogger_TestMethod
{
    private static LogX_SystemLogger logger = new LogX_SystemLogger();
    
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
        logger.debug('', 'this is a log');
    }
    
    @isTest
    public static void testDebugTagLevelMessage()
    {
        logger.debug('', 'ERROR', 'this is a log');
        logger.debug('', 'WARN', 'this is a log');
        logger.debug('', 'INFO', 'this is a log');
        logger.debug('', 'DEBUG', 'this is a log');
        logger.debug('', 'FINE', 'this is a log');
        logger.debug('', 'FINER', 'this is a log');
        logger.debug('', 'FINEST', 'this is a log');
        
        logger.debug('', 'xxx', 'this is a log');
        
    }
}