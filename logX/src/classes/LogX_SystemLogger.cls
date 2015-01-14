/*
*   This Logger call System.debug() for it underlying method.
*
*   Date       Person   Responsible Details 
*   14/1/2015    kiwi    created.
*
*/
public class LogX_SystemLogger implements LogX_Logger
{
    public void debug(Object obj) 
    {
        system.debug(obj);
    }

    public void debug(LoggingLevel logLevel, String message)
    {
        System.debug(logLevel, message);
    }
    
    public void debug(String tag, String message)
    {
        system.debug(message);
    }

    public void debug(String tag, String logLevel, String message) 
    {
        System.LoggingLevel level = getLoggingLevel(logLevel);
        
        system.debug(level, message);
    }
    
    private LoggingLevel getLoggingLevel(String level)
    {
        if(level.equalsIgnoreCase('ERROR'))
            return LoggingLevel.ERROR;
            
        if(level.equalsIgnoreCase('WARN'))
            return LoggingLevel.WARN;
            
        if(level.equalsIgnoreCase('INFO'))
            return LoggingLevel.INFO;
            
        if(level.equalsIgnoreCase('DEBUG'))
            return LoggingLevel.DEBUG;
            
        if(level.equalsIgnoreCase('FINE'))
            return LoggingLevel.FINE;
            
        if(level.equalsIgnoreCase('FINER'))
            return LoggingLevel.FINER;
            
        if(level.equalsIgnoreCase('FINEST'))
            return LoggingLevel.FINEST;
        
        return LoggingLevel.DEBUG;
    }
}