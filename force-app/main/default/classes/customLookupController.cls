public with sharing class customLookupController {
public customLookupController() {
}
@AuraEnabled(cacheable = true)
public static List<SObject> findRecords(String searchKey, String objectName, String searchField)
{
String key = '%'+searchKey+'%';
String QUERY = 'Select Id,Title, MailingState, MailingCountry, '+searchField+' From '+objectName +' Where '+searchField +' LIKE :key LIMIT 10';
//String QUERY = 'Select Id, '+searchField+' From '+objectName +' Where '+searchField +' LIKE :key LIMIT 7';
System.debug(System.LoggingLevel.DEBUG, QUERY);
List<SObject> sObjectList = Database.query(QUERY);
return sObjectList;
}
}