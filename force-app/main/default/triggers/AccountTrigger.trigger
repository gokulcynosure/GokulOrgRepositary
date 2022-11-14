trigger AccountTrigger on Account (after Update) {
   new AccountTriggerHandler().run();
}