/*
*   This is an example show how to create a logger static factory in your application, 
*   all logger should get from the static factory, this way make you code more flexible 
*   because your just need to change the implementation of this class.
*
*
*   LogX_Logger logger = LogX_Utils.getLogger(YourClassToLog.class);  
*   logger.debug();
*
*   Note: This method cannot use in contrutor due to construtor not support DML operation.
*
*   Date       Person   Responsible Details 
*   10/11/2014    kiwi    created.
*
*/
public class LogX_Utils
{
    private static LogX_SystemLogger logger = new LogX_SystemLogger();
    private static LogX_RealTimeLogger rtLogger;
    
    private static final String app = 'application';
    
    private LogX_Utils(){}
    
    public static LogX_Logger getLogger(System.type classType)
    {
        if(isStaging())
            return getRealTimeLogger(classType);
            
        // return logger impl base on conditional
        String name = classType.getName();
        
        if(name.startsWith('SRS_'))
            return logger;
        
        return logger;
    }
    
    public static LogX_RealTimeLogger getRealTimeLogger(System.type classType)
    {
        if(rtLogger == null)
            rtLogger = new LogX_RealTimeLogger(classType, app);
        
        return rtLogger;
    }
    
    public static boolean isStaging()
    {
        return true;
    }
}