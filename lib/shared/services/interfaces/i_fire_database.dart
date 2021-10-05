import '../../model/payee.dart';
import '../../model/transaction.dart';

abstract class IFireDatabase {
  Future<String> addTransaction(Transaction data);
  Future<List<Transaction>> list();

  Future<String> createPayee(Payee data);
  Future<List<Payee>> listPayee();
}
