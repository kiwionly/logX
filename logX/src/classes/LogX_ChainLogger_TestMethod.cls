/*
*   LogX_ChainLogger test method.
*
*   Date       Person   Responsible Details 
*   7/11/2014    kiwi    created.
*
*/
@isTest
public class LogX_ChainLogger_TestMethod
{
    private static LogX_ChainLogger logger = new LogX_ChainLogger();
    
    @isTest
    public static void testDebugObject()
    {
        init();
        
        logger.debug(new Account());  
        
         System.assert(true);
    }
    
    @isTest
    public static void testDebugObjectLoggingLevel()
    {
        init();
        
        logger.debug(LoggingLevel.INFO, 'this is a log');  
        
        System.assert(true);
    }
    
    @isTest
    public static void testDebugTagMessage()
    {
        init();
        
        logger.debug('tag', 'this is a log'); 
        
        System.assert(true);
    }
    
    @isTest
    public static void testDebugTagLevelMessage()
    {
        init();
        
        logger.debug('tag', 'INFO', 'this is a log');
        
        System.assert(true);
    }
    
    private static void init()
    {
        logger.add(new LogX_NoOperationLogger())
            .add(new LogX_SystemLogger());
    }
}