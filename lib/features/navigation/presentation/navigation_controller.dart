import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/di/get_it_config.dart';
import '../../../shared/routes/app_navigation.dart';
import '../../transaction/presentation/transaction_controller.dart';

part 'navigation_controller.g.dart';

@lazySingleton
class NavigationController = _NavigationControllerBase
    with _$NavigationController;

abstract class _NavigationControllerBase with Store {
  final AppNavigation _appNavigation;

  _NavigationControllerBase(this._appNavigation);

  @observable
  int pageIndex = 0;

  @action
  void switchPage(int value) {
    pageIndex = value;
    _appNavigation.currentPage = value;
  }

  void updateTransactions() {
    injector.get<TransactionController>().getTransactions();
  }
}
