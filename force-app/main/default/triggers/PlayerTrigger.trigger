trigger PlayerTrigger on Player__c (after insert) {
	new PlayerTriggerHandler().run();
}