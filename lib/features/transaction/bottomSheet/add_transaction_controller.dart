import 'package:flutter/material.dart' show TextEditingController;
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/model/generic/data_state.dart';
import '../../../shared/model/generic/result.dart';
import '../../../shared/model/payee.dart';
import '../../../shared/model/transaction.dart';
import '../../../shared/usecases/payees_usecase.dart';
import '../../../shared/usecases/transaction_usecase.dart';

part 'add_transaction_controller.g.dart';

@lazySingleton
class AddTransationController = _AddTransationControllerBase
    with _$AddTransationController;

abstract class _AddTransationControllerBase with Store {
  final TransactionUsecase _transactionUsecase;
  final PayeesUsecase _payeesUsecase;

  _AddTransationControllerBase(this._transactionUsecase, this._payeesUsecase);

  final TextEditingController valueController = TextEditingController();
  final TextEditingController payeeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  final DataState<Transaction> addState = DataState();
  final DataState<List<Payee>> listPayeesState = DataState();

  void initialize() {
    _payeesUsecase.getPayees().resultCompleteSet(listPayeesState);
  }

  void addTransaction() async {
    String payeeId;
    final payee = _payeesUsecase.getPayeeExist(payeeController.text);
    if (payee.isError) {
      final newPayeeId =
          await _payeesUsecase.createPayee(Payee(title: payeeController.text));
      if (newPayeeId.isError) {
        addState.setError(newPayeeId.error);
        return;
      }
      payeeId = newPayeeId.data!;
    } else {
      payeeId = payee.data!.id!;
    }

    _transactionUsecase
        .addTransaction(Transaction(
            value: double.tryParse(valueController.text) ?? 0,
            payeeId: payeeId,
            categoryId: categoryController.text))
        .resultCompleteSet(addState);
  }
}
