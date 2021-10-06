import '../../model/payee.dart';
import '../../model/transaction.dart';

abstract class IFireDatabase {
  Future<String> addTransaction(Transaction data);
  Future<List<Transaction>> getTransactions();

  Future<String> createPayee(Payee data);
  Future<List<Payee>> getPayees();
}
