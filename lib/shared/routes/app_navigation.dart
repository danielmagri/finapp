import 'package:flutter/material.dart'
    show BuildContext, Navigator, Route, Widget;
import 'package:injectable/injectable.dart';
import 'core/app_navigation_handler.dart';

@lazySingleton
class AppNavigation extends AppNavigationHandler {
  Future<T?> push<T>(Widget page, {bool isFullPage = false}) {
    return Navigator.of(getContext(isFullPage))
        .push(getRoute(page, isFullPage));
  }

  Future<T?> pushReplacement<T>(Widget page, {bool isFullPage = false}) {
    return Navigator.of(getContext(isFullPage))
        .pushReplacement(getRoute(page, isFullPage));
  }

  void pop<T>(BuildContext context, [T? result]) {
    Navigator.of(context).pop(result);
  }

  void popUntil(BuildContext context, bool Function(Route<dynamic>) predicate) {
    Navigator.of(context).popUntil(predicate);
  }

  bool canPop(bool isFullPage) => Navigator.of(getContext(isFullPage)).canPop();
}
