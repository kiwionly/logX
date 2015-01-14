/*
*   LogX_EmailLogger test method.
*
*   Date       Person   Responsible Details 
*   7/11/2014    kiwi    created.
*
*/
@isTest
public class LogX_EmailLogger_TestMethod
{
    private static LogX_EmailLogger logger = new LogX_EmailLogger();
    
    @isTest
    public static void testDebugObject()
    {
        logger.addEmailAddress('gheewooi.ong@seagate.com');
        
        logger.setSubject('Error occurs');
        
        logger.debug(new LogX_UnsupportedOperationException('this is a log'));  
        
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