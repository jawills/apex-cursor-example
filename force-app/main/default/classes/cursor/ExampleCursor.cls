public with sharing class ExampleCursor {
  public static void getAccounts() {
    Database.Cursor locator = Database.getCursor(
      'SELECT Id, Name FROM Account'
    );
    position = 0;
    List<Account> scope = locator.fetch(position, 10);
    position += scope.size();

    for (Account acc : scope) {
      // Process scope one at a time
    }
  }
}
