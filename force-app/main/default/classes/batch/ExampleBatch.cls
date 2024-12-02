public class ExampleBatch implements Database.Batchable<sobject>, Database.AllowsCallouts {
  public Database.QueryLocator start(Database.BatchableContext BC) {
    return Database.getQueryLocator([SELECT Id, Name FROM Account]);
  }

  public void Execute(Database.BatchableContext BC, List<Account> accList) {
    for (Account a : accList) {
      // Process group with fake callout
      QBCallout.createCustomer(a);
    }
    update accs;
  }

  public void finish(Database.BatchableContext BC) {
    System.debug('Finished');
  }
}

