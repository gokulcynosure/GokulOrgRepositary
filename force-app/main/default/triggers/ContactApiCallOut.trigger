trigger ContactApiCallOut on Contact (after insert) {
	
    new ContactHelper().run();

}