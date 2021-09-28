public with sharing class TestSomeClass {
    public TestSomeClass() {

    }
    public static void createInvoiceLineItem() {
        System.debug('Hello');
    }
    public void createInvoiceLineItem1() {
        Invoice__c myInvoice = new Invoice__c();
        myInvoice.Name = 'MultiName1' ;
        myInvoice.Description__c = 'Instruction to use  here' ;
        insert myInvoice;
        Invoice__c newInvoice = new Invoice__c();
        newInvoice.Name = 'SomeName';
        newInvoice.Description__c = 'Im changed description ' ;
        insert newInvoice;
        Invoice__c currentInvoice = new Invoice__c();
        currentInvoice.Name = 'Motherfucker))';
        currentInvoice.Description__c = 'Description is false';
        insert currentInvoice;
        
        List<Invoice__c> invoiceList = [SELECT Name, Description__c FROM Invoice__c];
        for (Invoice__c invoiceListItem : invoiceList) {
            invoiceListItem.Description__c = 'Nikita balabol';
        }
        update invoiceList;
    }
}