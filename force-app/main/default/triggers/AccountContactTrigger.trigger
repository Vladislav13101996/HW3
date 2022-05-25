trigger AccountContactTrigger on AccountContact__c (before insert, before update , after update) {
    if(Trigger.isInsert) {
        if(Trigger.isBefore) {
            AccountContactHandler.isAccountContactInsertFirstTime(Trigger.new);
        }
    }
    else if(Trigger.isUpdate) {
            if (Trigger.isAfter) {
                AccountContactHandler.isAccountContactChangeCheckboxForFalse(Trigger.new);
                AccountContactHandler.isAccountContactChangeCheckboxForTrue(Trigger.new);
                 }
    }
}