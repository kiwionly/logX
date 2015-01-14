/*
*   LogX_PostLogger received the log from LogX_ExternalPostLogger.
*
*   Date       Person   Responsible Details 
*   24/11/2014    kiwi    created.
*
*/
@RestResource(urlMapping='/log')
global class LogX_PostLoggerRestPoint
{
    private static LogX_RealTimeLogger rtLogger = LogX_Utils.getRealTimeLogger(LogX_ExternalPostLogger.class);
 
    @HttpPost
    global static void doPost(List<LogX__c> logs)
    {
        for(LogX__c log:logs)
        {
            rtLogger.debug(log.tag__c, log.Message__c);
        }
    }
}