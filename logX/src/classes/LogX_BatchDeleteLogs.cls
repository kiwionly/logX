/*
*   LogX_BatchDeleteLogs is a batch job to delete all logs.
*
*   Date       Person   Responsible Details 
*   7/11/2014    kiwi    created.
*
*/
global class LogX_BatchDeleteLogs implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
         return Database.getQueryLocator('select id from LogX__c where store__c = false');
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope)
    {
        delete scope;
    }        
 
    global void finish(Database.BatchableContext BC)
    {
       
    }
}