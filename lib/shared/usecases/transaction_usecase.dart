import 'package:injectable/injectable.dart';

import '../base/base_usecase.dart';
import '../di/get_it_config.dart';
import '../model/generic/result.dart';
import '../model/transaction.dart';
import '../services/interfaces/i_fire_database.dart';
import '../services/memory.dart';

@usecase
@injectable
class TransactionUsecase extends BaseUsecase {
  final IFireDatabase _fireDatabase;
  final Memory _memory;

  TransactionUsecase(this._fireDatabase, this._memory);

  Future<Result<Transaction>> addTransaction(Transaction data) =>
      safeCall(() async {
        final id = await _fireDatabase.addTransaction(data);
        final newModel = Transaction(
            id: id,
            value: data.value,
            payeeId: data.payeeId,
            categoryId: data.categoryId);
        _memory.transactions?.add(newModel);
        return newModel;
      });

  Future<Result<List<Transaction>>> getTransactions(
          {bool fromServer = false}) =>
      safeCall(() async {
        if (_memory.transactions == null || fromServer) {
          final list = await _fireDatabase.getTransactions();
          _memory.transactions = list;
          return list;
        } else {
          return Future.value(_memory.transactions);
        }
      });
}
