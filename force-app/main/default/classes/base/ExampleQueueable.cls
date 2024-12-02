public class ExampleQueueable implements Queueable, Database.AllowsCallouts {
  public List<Account> accs;
  public ExampleQueueable(List<Account> accs) {
    this.accs = accs;
  }

  public void execute(QueueableContext context) {
    Account acc = this.accs.remove(0);
    // Process one at a time with fake callout
    QBCallout.createCustomer(acc);
    
    update acc;
    
    if (accs.size() > 0) {
      System.enqueueJob(new ExampleQueueable(accs), 1);
    }
  }
}

