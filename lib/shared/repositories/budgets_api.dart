import 'package:injectable/injectable.dart';

import '../di/get_it_config.dart';
import '../model/budget_category.dart';
import '../services/interfaces/i_fire_database.dart';

abstract class IBudgetsApi {
  Future<void> updateBudget(int year, int month, BudgetCategory data);
  Future<List<BudgetCategory>> getBudgetsByMonth(int year, int month);
}

@repository
@Injectable(as: IBudgetsApi)
class BudgetsApi implements IBudgetsApi {
  final IFireDatabase _fireDatabase;

  BudgetsApi(this._fireDatabase);

  @override
  Future<void> updateBudget(int year, int month, BudgetCategory data) async {
    return (await _fireDatabase
        .budgetsCategories('$year$month')
        .doc(data.categoryId)
        .update(data.toJson()));
  }

  @override
  Future<List<BudgetCategory>> getBudgetsByMonth(int year, int month) {
    return _fireDatabase.budgetsCategories('$year$month').get().then((value) =>
        value.docs
            .map((e) =>
                BudgetCategory.fromJson(e.data() as Map<String, dynamic>, e.id))
            .toList());
  }
}
