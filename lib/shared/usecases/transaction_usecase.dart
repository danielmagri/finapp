import 'package:injectable/injectable.dart';

import '../base/base_usecase.dart';
import '../di/get_it_config.dart';
import '../model/generic/result.dart';
import '../model/transaction.dart';
import '../services/interfaces/i_fire_database.dart';

@usecase
@injectable
class TransactionUsecase extends BaseUsecase {
  final IFireDatabase _fireDatabase;

  TransactionUsecase(this._fireDatabase);

  Future<Result<Transaction>> addTransaction(Transaction data) =>
      safeCall(() async {
        final value = await _fireDatabase.addTransaction(data);
        return Transaction(
            id: value,
            value: data.value,
            payeeId: data.payeeId,
            categoryId: data.categoryId);
      });

  Future<Result<List<Transaction>>> getList() => safeCall(() {
        return _fireDatabase.list();
      });
}
