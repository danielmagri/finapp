import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/routes/app_navigation.dart';

part 'navigation_controller.g.dart';

@lazySingleton
class NavigationController = _NavigationControllerBase with _$NavigationController;

abstract class _NavigationControllerBase with Store {
  final AppNavigation _appNavigation;

  _NavigationControllerBase(this._appNavigation);

  void switchPage(int value) {
    _appNavigation.currentPage = value;
  }
}