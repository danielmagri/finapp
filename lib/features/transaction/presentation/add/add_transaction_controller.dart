import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:tuple/tuple.dart';

import '../../../../shared/inputs/formatters/currency_text_input_formatter.dart';
import '../../../../shared/model/category.dart';
import '../../../../shared/model/generic/data_state.dart';
import '../../../../shared/model/generic/result.dart';
import '../../../../shared/model/transaction.dart';
import '../../../../shared/usecases/categories_usecase.dart';
import '../../../../shared/usecases/transaction_usecase.dart';

part 'add_transaction_controller.g.dart';

@lazySingleton
class AddTransactionController = _AddTransactionControllerBase
    with _$AddTransactionController;

abstract class _AddTransactionControllerBase with Store {
  final TransactionUsecase _transactionUsecase;
  final CategoriesUsecase _categoriesUsecase;

  _AddTransactionControllerBase(
      this._transactionUsecase, this._categoriesUsecase);

  final CurrencyTextInputFormatter currencyTextInput =
      CurrencyTextInputFormatter();

  @observable
  int dateSelected = 0;

  final List<Tuple2<String, DateTime?>> dates = [
    Tuple2('Hoje', DateTime.now()),
    Tuple2('Ontem', DateTime.now().subtract(Duration(days: 1))),
    Tuple2('Outro', null)
  ];

  Category? categorySelected;

  final DataState<Transaction> addState = DataState();
  final DataState<List<Category>> listCategoriesState = DataState();

  void initialize() {
    _categoriesUsecase.getCategories().resultCompleteSet(listCategoriesState);
  }

  @action
  void selectDate(int index) {
    dateSelected = index;
  }

  @action
  void setCustomDate(DateTime? data) {
    if (data == null && dates[2].item2 != null) return;
    dates[2] = dates[2].withItem2(data);
    dateSelected = data == null ? 0 : 2;
  }

  void addTransaction() async {
    _transactionUsecase
        .addTransaction(Transaction(
            value: currencyTextInput.getUnformattedValue().toDouble(),
            categoryId: categorySelected!.id ?? '',
            datetime: dates[dateSelected].item2!))
        .resultCompleteSet(addState);
  }
}
