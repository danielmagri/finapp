import 'package:injectable/injectable.dart';

import '../../di/get_it_config.dart';
import '../../model/transaction.dart';
import '../../services/interfaces/i_fire_database.dart';

abstract class ITransactionsApi {
  Future<String> addTransaction(Transaction data);
  Future<List<Transaction>> getTransactions();
}

@repository
@Injectable(as: ITransactionsApi)
class TransactionsApi implements ITransactionsApi {
  final IFireDatabase _fireDatabase;

  TransactionsApi(this._fireDatabase);

  @override
  Future<String> addTransaction(Transaction data) async {
    return (await _fireDatabase.transactions.add(data.toJson())).id;
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    return _fireDatabase.transactions.get().then((value) => value.docs
        .map(
            (e) => Transaction.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList());
  }
}
