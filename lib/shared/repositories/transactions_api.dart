import 'package:cloud_firestore/cloud_firestore.dart'
    show SetOptions, FieldValue;
import 'package:injectable/injectable.dart';

import '../di/get_it_config.dart';
import '../model/budget.dart';
import '../model/transaction.dart';
import '../services/interfaces/i_fire_database.dart';

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
    final batch = _fireDatabase.batch;

    batch.set(
        _fireDatabase.budgets.doc(
            '${data.categoryId}${data.datetime.year}${data.datetime.month}'),
        {
          Budget.YEAR: data.datetime.year,
          Budget.MONTH: data.datetime.month,
          Budget.CATEGORY_ID: data.categoryId,
          Budget.AMOUNT_SPENT: FieldValue.increment(data.value)
        },
        SetOptions(merge: true));
    final doc = _fireDatabase.transactions.doc();
    batch.set(doc, data.toJson());

    return batch.commit().then((value) => doc.id);
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    return _fireDatabase.transactions.get().then((value) => value.docs
        .map(
            (e) => Transaction.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList());
  }
}
