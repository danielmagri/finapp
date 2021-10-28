import 'package:injectable/injectable.dart';

import '../base/base_usecase.dart';
import '../di/get_it_config.dart';
import '../model/budget.dart';
import '../model/generic/result.dart';
import '../repositories/budgets_api.dart';

@usecase
@injectable
class BudgetsUsecase extends BaseUsecase {
  final IBudgetsApi _budgetsApi;

  BudgetsUsecase(this._budgetsApi);

  Future<Result<void>> updateBudget(Budget data) => safeCall(() async {
        await _budgetsApi.updateBudget(data);
      });

  Future<Result<List<Budget>>> getBudgets(int year, int month) =>
      safeCall(() async {
        return await _budgetsApi.getBudgetsByMonth(year, month);
      });
}
