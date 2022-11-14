trigger playerFees on Player_Monthly_Fee__c (after update) {

    new playerFeesHandler().run();
    
}