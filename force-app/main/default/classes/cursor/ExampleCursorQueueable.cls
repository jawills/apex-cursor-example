public class ExampleCursorQueueable implements Queueable, Database.AllowsCallouts {
  private Database.Cursor locator;
  private Integer position;
  private static final Integer CURSOR_SIZE = 10;

  public ExampleCursorQueueable() {
    this.locator = Database.getCursor('SELECT Id FROM Account ');
    position = 0;
  }

  public void execute(QueueableContext context) {
    if (this.locator.getNumRecords() == 0) {
      // If no records are found an error will be thrown
      return;
    }
    List<Account> scope = this.locator.fetch(position, CURSOR_SIZE);
    position += scope.size();

    for (Account acc : scope) {
      // Process scope one at a time
    }
    // If there are more records, enqueue another job
    if (position < locator.getNumRecords()) {
      System.enqueueJob(this);
    }
  }
}

