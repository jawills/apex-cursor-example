public with sharing class StartCursorQueueable {
    public static void executeQueueable() {
      System.enqueueJob(new ExampleCursorQueueable());
    }
}  