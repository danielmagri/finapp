import 'package:flutter/material.dart'
    show BuildContext, Key, StatelessWidget, Widget, WillPopScope;
import 'package:get_it/get_it.dart';

import '../app_navigation.dart';
import 'model/tab_navigator.dart';

class RootBottomNavigation extends StatelessWidget {
  final AppNavigation _appNavigation = GetIt.I.get<AppNavigation>();

  final Widget child;
  final List<TabNavigator> pages;
  final int initialPage;

  RootBottomNavigation(
      {Key? key,
      required this.pages,
      required this.initialPage,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _appNavigation.setNavigationKeys(pages, initialPage);
    return WillPopScope(
        onWillPop: () async => _appNavigation.currentPage == null
            ? await Future.value(false)
            : !await (pages[_appNavigation.currentPage!]
                    .navigatorKey
                    .currentState
                    ?.maybePop() ??
                Future.value(false)),
        child: child);
  }
}
