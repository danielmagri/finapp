import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/model/generic/data_state.dart';
import '../../../shared/model/generic/result.dart';
import '../../../shared/model/transaction.dart';
import '../../../shared/usecases/transaction_usecase.dart';

part 'transaction_controller.g.dart';

@lazySingleton
class TransactionController = _TransactionControllerBase
    with _$TransactionController;

abstract class _TransactionControllerBase with Store {
  final TransactionUsecase _transactionUsecase;

  _TransactionControllerBase(this._transactionUsecase);

  DataState<List<Transaction>> listTransactions = DataState();

  ReactionDisposer? listTransactionsReaction;

  void getTransactions() {
    _transactionUsecase.getTransactions().resultCompleteSet(listTransactions);
  }
}
