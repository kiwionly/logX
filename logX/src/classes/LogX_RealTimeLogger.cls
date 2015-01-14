/*
*   This is Logger that log message real time using streaming api which base on cometd 2.0. Developers should see log messages in LogX_Console VF Page.
*
*
*   Date       Person   Responsible Details 
*   11/11/2014    kiwi    created.
*
*/
public class LogX_RealTimeLogger implements LogX_Logger
{
    private final String className;
    private final String application;
    
    private boolean store = false;
    
    public LogX_RealTimeLogger(System.Type clazz, String application)
    {
        this.className = clazz.getName();
        this.application = application;
    }
    
    public LogX__c createGlobalLog()
    {
        LogX__c log = new LogX__c();
        
        log.class__c = this.className;
        log.name = this.application;
        log.LogLevel__c = 'DEBUG';
        log.store__c = this.store;
        
        return log;
    }
    
    public void debug(Object obj) 
    {
        LogX__c log = createGlobalLog();
        log.message__c = obj + '';
        
        insert log;
    }

    public void debug(LoggingLevel logLevel, String message)
    {
        LogX__c log = createGlobalLog();
        log.LogLevel__c = logLevel + '';
        log.message__c = message;
        
        insert log;
    }
    
    public void debug(String tag, String message)
    {
        LogX__c log = createGlobalLog();
        log.message__c = message;
        log.tag__c = tag;
        
        insert log;
    }
    
    @Future
    public static void debugAysnc(String className, String application, String tag, String message, boolean store)
    {
        LogX__c log = new LogX__c();
        
        log.class__c = className;
        log.name = application;
        log.LogLevel__c = 'DEBUG';
        log.store__c = store;
        log.message__c = message;
        log.tag__c = tag;
        
        insert log;
    }
    
    public static LogX__c createLog(String className, String application, String tag, String message, boolean store)
    {
        LogX__c log = new LogX__c();
        
        log.class__c = className;
        log.name = application;
        log.LogLevel__c = 'DEBUG';
        log.store__c = store;
        log.message__c = message;
        log.tag__c = tag;
        
        return log;
    }
    
    public static void test()
    {
        List<LogX__c> logs = new List<LogX__c>();
        
        for(integer i=0; i<10; i++)
        {
            LogX__c log = createLog('class', 'application', 'tag', i+'', false);
            
            logs.add(log);
        }
        
        insert logs;
        
    }

    public void debug(String tag, String logLevel, String message) 
    {
        LogX__c log = createGlobalLog();
        log.LogLevel__c = logLevel;
        log.message__c = message;
        log.tag__c = tag;
        
        insert log;
    }
    
    public void setStore(boolean store)
    {
        this.store = store;
    }
    
    public static void createPushTopic()
    {
        PushTopic pushTopic = new PushTopic();
        pushTopic.Name = 'LogX';
        pushTopic.Query = 'select Id,name,Class__c,CreatedDate,LogLevel__c,message__c,tag__c from LogX__c';
        pushTopic.ApiVersion = 32.0;
        pushTopic.NotifyForOperationCreate = true;
        pushTopic.NotifyForOperationUpdate = false;
        pushTopic.NotifyForOperationUndelete = false;
        pushTopic.NotifyForOperationDelete = false;
        pushTopic.NotifyForFields = 'Referenced';
        
        insert pushTopic;
    }
    
}