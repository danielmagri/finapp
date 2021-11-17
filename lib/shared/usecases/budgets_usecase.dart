import 'package:injectable/injectable.dart';

import '../base/base_usecase.dart';
import '../di/get_it_config.dart';
import '../model/budget_category.dart';
import '../model/generic/result.dart';
import '../repositories/budgets_api.dart';

@usecase
@injectable
class BudgetsUsecase extends BaseUsecase {
  final IBudgetsApi _budgetsApi;

  BudgetsUsecase(this._budgetsApi);

  Future<Result<void>> updateBudget(int year, int month, BudgetCategory data) =>
      safeCall(() async {
        await _budgetsApi.updateBudget(year, month, data);
      });

  Future<Result<List<BudgetCategory>>> getBudgets(int year, int month) =>
      safeCall(() async {
        return await _budgetsApi.getBudgetsByMonth(year, month);
      });
}
