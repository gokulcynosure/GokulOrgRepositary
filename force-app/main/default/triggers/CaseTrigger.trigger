trigger CaseTrigger on Case (after Update){
		new CaseTriggerHandler().run();
   }