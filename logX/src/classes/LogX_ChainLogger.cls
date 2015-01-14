/*
*   Use LogX_ChainLogger to chain add the logger so you call debug() all object will be called.
*
*   Date       Person   Responsible Details 
*   7/11/2014    kiwi    created.
*
*/
public class LogX_ChainLogger implements LogX_Logger
{
    private final List<LogX_Logger> loggers = new List<LogX_Logger>();
    
    public LogX_ChainLogger add(LogX_Logger logger)
    {
        loggers.add(logger);
        
        return this;
    }
    
    public void debug(Object obj) 
    {
        for(LogX_Logger logger: loggers)
        {
            logger.debug(obj);
        }
    }
    
    public void debug(LoggingLevel level, String message)
    {
        for(LogX_Logger logger: loggers)
        {
            logger.debug(level, message);
        }
    }

    public void debug(String tag, String message) 
    {
        for(LogX_Logger logger: loggers)
        {
            logger.debug(tag, message);
        }
    }

    public void debug(String tag, String logLevel, String message) 
    {
        for(LogX_Logger logger: loggers)
        {
            logger.debug(tag, logLevel, message);
        }
    }
    
}