import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/model/budget.dart';
import '../../../shared/model/category.dart';
import '../../../shared/model/generic/data_state.dart';
import '../../../shared/usecases/budgets_usecase.dart';
import '../../../shared/usecases/categories_usecase.dart';

part 'budget_controller.g.dart';

@lazySingleton
class BudgetController = _BudgetControllerBase with _$BudgetController;

abstract class _BudgetControllerBase with Store {
  final CategoriesUsecase _categoriesUsecase;
  final BudgetsUsecase _budgetsUsecase;

  _BudgetControllerBase(this._categoriesUsecase, this._budgetsUsecase);

  final DataState<List<Budget>> budgetsState = DataState();

  DateTime currentDate = DateTime.now();

  void fetchBudgets() async {
    final listResult =
        await _budgetsUsecase.getBudgets(currentDate.year, currentDate.month);

    if (listResult.isError) {
      budgetsState.setError(listResult.error);
      return;
    }

    final categoriesResult = await _categoriesUsecase.getCategories();

    if (categoriesResult.isError) {
      budgetsState.setError(categoriesResult.error);
      return;
    }

    final budgets = listResult.data ?? [];

    categoriesResult.data!.forEach((category) {
      if (!budgets.any((e) => e.categoryId == category.id)) {
        budgets.add(Budget(
            year: currentDate.year,
            month: currentDate.month,
            categoryId: category.id!,
            budgetValue: 0,
            amountSpent: 0));
      }
    });

    budgetsState.setData(budgets);
  }

  Category? getCategoryModel(String id) =>
      _categoriesUsecase.getCategoryModel(id);
}
