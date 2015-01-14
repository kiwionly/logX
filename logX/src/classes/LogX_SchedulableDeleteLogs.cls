/*
*   LogX_DeleteLogs delete record everyday, you may use run this exp in anonymous code.
*
*   System.schedule('LogX_DeleteLogs', '0 0 13 * * ?', new LogX_SchedulableDeleteLogs());
*
*   Date       Person   Responsible Details 
*   10/11/2014    kiwi    created.
*
*/
global class LogX_SchedulableDeleteLogs implements Schedulable 
{
    global void execute(SchedulableContext SC) 
    {
        Database.executeBatch(new LogX_BatchDeleteLogs());
    }
}