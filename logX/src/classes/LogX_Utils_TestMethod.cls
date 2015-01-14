/*
*   LogX_Utils test method.
*
*   Date       Person   Responsible Details 
*   7/11/2014    kiwi    created.
*
*/
@isTest
public class LogX_Utils_TestMethod
{
    @isTest
    public static void testGetLogger()
    {
        LogX_Logger logger = LogX_Utils.getLogger(LogX_Logger.class);
        logger.debug(new Account());  
        
        System.assert(true);
    }
    
    @isTest
    public static void testGetRealTimeLogger()
    {
        LogX_RealTimeLogger logger = LogX_Utils.getRealTimeLogger(LogX_Logger.class);
        logger.debug(new Account());  
        
        System.assert(true);
    }
    
    
   
}