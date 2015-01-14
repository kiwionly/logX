# logX
LogX is a logging library for Salesforce. 

LogX
-----
LogX is a logging library for salesforce.


Why you want logX ?
---------------------------
Let say you want to turn on System.debug() only in staging, but want to turn it off in production because it hurt performance or security reason.

Or maybe you want to doing email notification as your logging behaviour on certain class only.

Basically, your want a flexible way to doing logging.

Let say your using System.debug() in your application, and later you want to remove it when deploy to production, remove every line of code is not flexible way, imaging you got 100 classes and 1000 line of system.debug.

Or you just create your own logging mechasinm and you want to interchange your customize logging with System.debug(), modify every line of code also is not a flexible way.

Good Software enginneer practices is you not code on implementation, but code on interface instead.

LogX_* abstract your logging implementation, so your can easy configure logging on your classes just by few line of code, no matters you using System.debug() or your own customization logging.

Instead of using System.debug() for all your code, you use :

	LogX_Logger logger = LogX_Utils.getLogger(YourClassToLog.class);  
		
	logger.debug(objectToLog);
	
Your logger behaviour now is depend on the logger instance return by LogX_Utils, your may want to return a logger instance which doing System.debug in staging, but doing nothing in production.

	public class LogX_Utils {

		public static LogX_Logger getLogger(System.type classType)
		{
			if(ClassStype.getName().startsWith('PREFIX_')) // log only certain classes in your application, but not all classes.
				return getYourOwnCustomizeLogger();
		
			if(isStaging()) 
				return getSystemLogger(); // call System.debug when call logger.debug()
				
			return getNoOperationLogger(); // do nothing when call logger.debug()
		}
	}


How to start using LogX_* ?
---------------------------------
That is only 2 steps to use the LogX_* :

1) Obtain the LogX_Logger from your own static factory, you can return difference implementation class base on class name or your configuration. (see LogX_Utils), you may create this for your own application.

2) Add a line on top of your class

	LogX_Logger logger = LogX_Utils.getLogger(YourClassToLog.class);  
	
3) Replace all your System.debug(...) to logger.debug(...).

because of the logger parameters name is same like System.debug(), you just need to replace the System to logger, and that is it.


We do provided some built in logging, but you can create your own logging by just implements LogX_Logger interface.


Built-in Logger implementation
------------------------------
We had provided difference implementations for LogX_Logger:


LogX_SystemLogger(System.Type classToLog)
-----------------------------------------------
- call of debug() delegate to System.debug(...)


LogX_NoOperationLogger()
------------------------------
- call of debug() do nothing.


LogX_RealTimeLogger(System.Type clazz, String applicationName)
--------------------------------------------------------------------
- application Name is the value your want to use for filter in "LogX_Console" page.

- call of debug() is log to a table LogX, and you can see the log real time in http://your-instance/apex/LogX_Console

- If need to run 2 line of code before enabled the real time log.

	LogX_RealTimeLogger.createPushTopic(); //create a topic "LogX" for subscribe.

	System.schedule('LogX_DeleteLogs', '0 0 13 * * ?', new LogX_SchedulableDeleteLogs()); //run a schedule log for clear LogX table.
	
- call setStore(true) if you want the log not delete from table, for log with true flag, you need to delete manually.

- that is additional 2 method for real time logger :

	debug(String tag, String message); //tag parameter is the tag you want to add to your log for filter in "LogX_Console" page.
	
    debug(String tag, String logLevel, String message);
	
*some limitation of real time logger:
	- not work in contructor and getter method for apex controller. 
	- log may out of sequence if you call multiple log in single transaction. 

This is because of system contraint in salesforce, your may want to use LogX_ExternalPostLogger to overcome this limitation instead.


LogX_ExternalPostLogger(System.Type clazz, String applicationName, String url)
------------------------------------------------------------------------------------
- call of debug post the log to the url specific in constructor, this give your the flexible way of logging to external system. 

- call debug() add your log to a list, you need to call logger.send() to flush your log to the specific url, see "LogX_ExternalPostLogger" comment.

- note send() is not part of LogX_Logger interface method, you need to using "LogX_ExternalPostLogger" type to call send().


LogX_WebLogger()
----------------------
- enabled you to log in javascript, see "LogX_SamplePage" for demo and usage. Typical scenario is you want to log a value for a page before it redirect to other page.


LogX_ChainLogger()
------------------------
- your call add(LogX_Logger logger) to chain all the logger implemetation, when debug() call, it call all the implementation debug().



Demo
----
see LogX_HelloSample for simple logging demo.









	
	
