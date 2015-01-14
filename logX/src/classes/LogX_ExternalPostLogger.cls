/*
*   This logger send the log to external site for process with logging. 
*
*   By default, It will add all the log to queue, and auto flush the log by specific batch size (default 10).
*   you should set a batch size more then you debug call page and call send() to flush all logs to save callout.
*
*   You can set the batch size via setBatchsize(n).
*
*   The format of Log file post to the url is like below:
*    
*   {"logs": [ ...] } 
*    
*   where ... is an array of serialize of LogX.


    The sample code for calling this class as below:
    
    Map<String, String> header = new Map<String, String>();
    header.put('Authorization', 'Bearer ' + UserInfo.getSessionId());
    header.put('Content-Type', 'application/json'); // important !
    
    LogX_ExternalPostLogger logger = new LogX_ExternalPostLogger(LogX_ExternalPostLogger.class, 'application', 
        'https://seagate--dev.cs3.my.salesforce.com/services/apexrest/log', header);
    
    logger.debug('tag', 'log 1');
    logger.debug('tag', 'log 2');
    logger.send();
*
*
*   Date       Person   Responsible Details 
*   17/11/2014    kiwi    created.
*
*/
public class LogX_ExternalPostLogger implements LogX_Logger
{
    private final String className;
    private final String application;
    
    private boolean store = false;
    private Integer batchSize = 10;
    
    private HttpPost poster = new HttpPost('http://37.139.5.121:8080/tool/log.do');
    
    private List<LogX__c> logList;
    
    public LogX_ExternalPostLogger(System.Type clazz, String application, String url)
    {
        this(clazz, application, url, null);
    }
    
    public LogX_ExternalPostLogger(System.Type clazz, String application, String url, Map<String, String> header)
    {
        this.className = clazz.getName();
        this.application = application;
        
        if(url != null)
            poster = new HttpPost(url);
            
        if(header != null)
        {
            Set<String> keySet = header.keySet();
            
            for(String k:keySet)
            {
                poster.addHeader(k, header.get(k));
            }
        }
        
        logList = new List<LogX__c>();
    }
    
    public LogX__c createGlobalLog()
    {
        LogX__c log = new LogX__c();
        
        log.class__c = this.className;
        log.name = this.application;
        log.LogLevel__c = 'DEBUG';
        log.store__c = this.store;
        //log.createdAt__c = system.now();
        
        return log;
    }
    
    public void debug(Object obj) 
    {
        LogX__c log = createGlobalLog();
        log.message__c = obj + '';
        
        post(log);
    }

    public void debug(LoggingLevel logLevel, String message)
    {
        LogX__c log = createGlobalLog();
        log.LogLevel__c = logLevel + '';
        log.message__c = message;
        
        post(log);
    }
    
    public void debug(String tag, String message)
    {
        LogX__c log = createGlobalLog();
        log.message__c = message;
        log.tag__c = tag;
        
        post(log);
    }
   
    public void debug(String tag, String logLevel, String message) 
    {
        LogX__c log = createGlobalLog();
        log.LogLevel__c = logLevel;
        log.message__c = message;
        log.tag__c = tag;
        
        post(log);
    }
    
    public void setStore(boolean store)
    {
        this.store = store;
    }
    
    public void setBatchSize(integer size)
    {
        batchSize = size;
    }
    
    private void post(LogX__c log)
    {
        logList.add(log);
        
        if(logList.size() >= batchSize)
        {
            send();
        }
    }
    
    public void send()
    {
        String jsonString = JSON.serialize(logList);
        
        send('{"logs":' + jsonString + ' }');
        
        logList.clear();
    }
    
    private void send(String logs)
    {
        poster.postLog(logs);        
    }
    
    private class HttpPost
    {   
        private Http http = new Http();
        private HttpRequest req = new HttpRequest();
        
        private String url;
        
        public HttpPost(String url)
        {
            this.url = url;
        }
        
        public void addHeader(String name, String value)
        {
            req.setHeader(name, value);
        }

        public void postLog(String logs)
        {                    
            req.setEndpoint(url);
            req.setMethod('POST');
            
            String body = logs;
            
            req.setBody(body);
            req.setTimeout(15000); 
            
            http.send(req);        
        }
    }
    
}