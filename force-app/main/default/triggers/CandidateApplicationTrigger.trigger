trigger CandidateApplicationTrigger on Candidate_Application__c (after insert) {
	new CandidateApplicationTriggerHandler().run();
}