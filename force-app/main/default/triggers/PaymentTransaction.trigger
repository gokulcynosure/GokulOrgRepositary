trigger PaymentTransaction on Payment_Transaction__c (after insert) {

    new PaymentTransactionHandler().run();
}