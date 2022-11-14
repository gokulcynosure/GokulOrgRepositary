trigger PersonTrigger on Person__c (after insert) {
	new PersonTriggerHandler().run();
}