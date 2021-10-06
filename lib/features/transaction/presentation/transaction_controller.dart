import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/model/generic/data_state.dart';
import '../../../shared/model/generic/result.dart';
import '../../../shared/model/payee.dart';
import '../../../shared/model/transaction.dart';
import '../../../shared/usecases/payees_usecase.dart';
import '../../../shared/usecases/transaction_usecase.dart';

part 'transaction_controller.g.dart';

@lazySingleton
class TransactionController = _TransactionControllerBase
    with _$TransactionController;

abstract class _TransactionControllerBase with Store {
  final TransactionUsecase _transactionUsecase;
  final PayeesUsecase _payeesUsecase;

  _TransactionControllerBase(this._transactionUsecase, this._payeesUsecase);

  DataState<List<Transaction>> listTransactions = DataState();

  ReactionDisposer? listTransactionsReaction;

  void getTransactions() {
    _transactionUsecase.getTransactions().resultCompleteSet(listTransactions);
  }

  Payee? getPayeeModel(String id) => _payeesUsecase.getPayeeModel(id);
}
