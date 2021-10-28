import 'package:injectable/injectable.dart';

import '../di/get_it_config.dart';
import '../model/budget.dart';
import '../services/interfaces/i_fire_database.dart';

abstract class IBudgetsApi {
  Future<void> updateBudget(Budget data);
  Future<List<Budget>> getBudgetsByMonth(int year, int month);
}

@repository
@Injectable(as: IBudgetsApi)
class BudgetsApi implements IBudgetsApi {
  final IFireDatabase _fireDatabase;

  BudgetsApi(this._fireDatabase);

  @override
  Future<void> updateBudget(Budget data) async {
    return (await _fireDatabase.budgets.doc(data.id).set(data.toJson()));
  }

  @override
  Future<List<Budget>> getBudgetsByMonth(int year, int month) {
    return _fireDatabase.budgets
        .where(Budget.YEAR, isEqualTo: year)
        .where(Budget.MONTH, isEqualTo: month)
        .get()
        .then((value) => value.docs
            .map((e) => Budget.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }
}
