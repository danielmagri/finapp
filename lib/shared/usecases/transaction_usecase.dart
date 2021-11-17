import 'package:injectable/injectable.dart';

import '../base/base_usecase.dart';
import '../di/get_it_config.dart';
import '../model/generic/result.dart';
import '../model/transaction.dart';
import '../repositories/transactions_api.dart';
import '../services/memory.dart';

@usecase
@injectable
class TransactionUsecase extends BaseUsecase {
  final ITransactionsApi _transactionsApi;
  final Memory _memory;

  TransactionUsecase(this._transactionsApi, this._memory);

  Future<Result<Transaction>> addTransaction(Transaction data) =>
      safeCall(() async {
        final id = await _transactionsApi.addTransaction(data);
        final newModel = Transaction(
            id: id,
            type: data.type,
            value: data.value,
            categoryId: data.categoryId,
            datetime: data.datetime);
        _memory.transactions?.add(newModel);
        return newModel;
      });

  Future<Result<List<Transaction>>> getTransactions(
          {bool fromServer = false}) =>
      safeCall(() async {
        if (_memory.transactions == null || fromServer) {
          final list = await _transactionsApi.getTransactions();
          _memory.transactions = list;
          return list;
        } else {
          return Future.value(_memory.transactions);
        }
      });
}
