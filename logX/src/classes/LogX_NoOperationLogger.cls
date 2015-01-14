/*
*   This is custom Exception for operation not supported call.
*
*   Date       Person   Responsible Details 
*   14/1/2015    kiwi    created.
*
*/
public class LogX_NoOperationLogger implements LogX_Logger
{
    public void debug(Object obj) {}
    
    public void debug(LoggingLevel level, String message){}

    public void debug(String tag, String message) {}

    public void debug(String tag, String logLevel, String message) {}
}