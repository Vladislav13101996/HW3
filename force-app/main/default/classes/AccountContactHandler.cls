public with sharing class AccountContactHandler {
    public static void isAccountContactInsertFirstTime(List<AccountContact__c> insertedList) {
        Id contactId ;
        for(AccountContact__c accountContactItem : insertedList) {
            contactId = accountContactItem.Contact__c;
        }
        if(contactId != null) {
            List<AccountContact__c> createdAccountContactList = [SELECT Contact__c FROM AccountContact__c WHERE Contact__c =: contactId];
            if(createdAccountContactList.isEmpty()){
                for(AccountContact__c accountContactItem : insertedList) {
                    accountContactItem.isPrimary__c = true;
                }
            }
        }
    }

    public static void isAccountContactChangeCheckboxForFalse(List<AccountContact__c> updatedList) {
        Id contactId ;
        for(AccountContact__c accountContactItem : updatedList) {
            contactId = accountContactItem.Contact__c;
        }
        if(contactId != null) {
            AccountContact__c createdAccountContact = [SELECT isPrimary__c
                                                       FROM AccountContact__c 
                                                       WHERE  Contact__c =: contactId 
                                                       AND isPrimary__c = false 
                                                       ORDER BY CreatedDate DESC 
                                                       LIMIT 1];
            if(createdAccountContact != null) {
                createdAccountContact.isPrimary__c = true;
            }
        }
}


    public static void isAccountContactChangeCheckboxForTrue(List<AccountContact__c> updatedList) {
        Id contactId ;
        for(AccountContact__c accountContactItem : updatedList) {
            contactId = accountContactItem.Contact__c;
        }
        if(contactId != null) {
            AccountContact__c createdAccountContact = [SELECT isPrimary__c
                                                       FROM AccountContact__c 
                                                       WHERE  Contact__c =: contactId 
                                                       AND isPrimary__c = true 
                                                       ORDER BY CreatedDate DESC 
                                                       LIMIT 1];
            if(createdAccountContact != null) {
                createdAccountContact.isPrimary__c = false;
            }
        }
    }
}
