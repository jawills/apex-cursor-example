public with sharing class StartQueueable {
  public StartQueueable() {
    List<Account> accs = [SELECT Id, Name FROM Account];
    System.enqueueJob(new ExampleQueueable(accs));
  }
}

