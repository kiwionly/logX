/*
*   This is Logger will send email to owner when debug() being called.
*
*   Date       Person   Responsible Details 
*   7/11/2014    kiwi    created.
*
*/
public class LogX_EmailLogger implements LogX_Logger
{
    private final List<String> emailList = new List<String>();
    private String subject = 'Exception (from email logger) ';
    
    public void addEmailAddress(String email)
    {
        emailList.add(email);
    }
    
    public void setSubject(String subject)
    {
        this.subject = subject;
    }
    
    public void debug(Object obj) 
    {
        sendEmail(obj);
    }

    public void debug(LoggingLevel logLevel, String message)
    {
        sendEmail(logLevel + ' - ' + message);
    }
    
    public void debug(String tag, String message)
    {
        sendEmail(tag + ' - ' + message);
    }

    public void debug(String tag, String logLevel, String message) 
    {
        sendEmail(logLevel + ' - ' + logLevel + ' - ' + message);
    }
    
    private void sendEmail(Object obj)
    {   
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        emailList.add(UserInfo.getUserEmail());
        
        mail.setToAddresses(emailList);
        mail.setReplyTo('no@reply.com');
        mail.setSenderDisplayName('Salesforce Support');
        mail.setSubject(subject);
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setPlainTextBody(obj + '');
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
}