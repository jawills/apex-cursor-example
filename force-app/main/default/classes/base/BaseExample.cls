public class BaseExample {
  public static void getAccounts() {
    List<Account> accs = [SELECT Id, Name FROM Account];

    for (Account a : accs) {
      // Process linear with fake callout
      QBCallout.createCustomer(a);
    }

    update accs;
  }
}

