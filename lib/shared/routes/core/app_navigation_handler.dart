import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        GlobalKey,
        MaterialPageRoute,
        NavigatorState,
        Route,
        Widget,
        protected;

import 'model/tab_navigator.dart';

abstract class AppNavigationHandler {
  /// Set on MaterialApp navigatorKey
  final GlobalKey<NavigatorState> rootNavigator = GlobalKey<NavigatorState>();

  void setNavigationKeys(List<TabNavigator> pages, int initialPage) {
    _navigatorkeys = pages.map((e) => e.navigatorKey).toList();
    currentPage = initialPage;
  }

  List<GlobalKey<NavigatorState>> _navigatorkeys = [];
  int? currentPage;

  BuildContext? get navigationContext =>
      _navigatorkeys[currentPage!].currentContext;

  BuildContext? get fullPageContext => rootNavigator.currentContext;

  @protected
  BuildContext getContext(bool isFullPage) {
    if (isFullPage) {
      return fullPageContext!;
    } else {
      return navigationContext ?? fullPageContext!;
    }
  }

  @protected
  Route<T> getRoute<T>(Widget page, bool isFullPage) {
    if (isFullPage) {
      return MaterialPageRoute(builder: (_) => page, settings: RouteSettings(name: page.toString()));
    } else {
      return CupertinoPageRoute(builder: (_) => page);
    }
  }
}
