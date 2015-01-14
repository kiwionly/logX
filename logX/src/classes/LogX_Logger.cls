/*
*   Implement this interface for your custom logging behaviour.
*
*   Date       Person   Responsible Details 
*   14/1/2015    kiwi    created.
*
*/
public interface LogX_Logger
{
    void debug(Object obj);

    void debug(LoggingLevel level, String message);
    
    void debug(String tag, String message);

    void debug(String tag, String logLevel, String message);
}