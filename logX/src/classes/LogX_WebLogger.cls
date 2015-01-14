/*
*   LogX_WebLogger use to log javascript value at realtime.
*
*   Date       Person   Responsible Details 
*   12/11/2014    kiwi    created.
*
*/
public class LogX_WebLogger
{
    private static LogX_RealTimeLogger rtLogger = LogX_Utils.getRealTimeLogger(LogX_WebLogger.class);
    
    @RemoteAction
    public static void debug(String input)
    {
        Map<String, Object> param = (Map<String, Object>)JSON.deserializeUntyped(input);
        
        String tag = (String)param.get('tag');
        String message = (String)param.get('message');
        
        rtLogger.debug(tag, message);
    }
   
}