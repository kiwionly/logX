/*
*   sample
*
*   Date       Person   Responsible Details 
*   19/11/2014    kiwi    created.
*
*/

public class LogX_HelloController 
{
    private LogX_Logger logger = LogX_Utils.getLogger(LogX_HelloController.class);

	private string value = 'hello world';
	
	public void process()
	{
	    logger.debug('tag', value);
	   
	    // do something ...
	}

	public String getMessage()
	{
		return value;
	}
}