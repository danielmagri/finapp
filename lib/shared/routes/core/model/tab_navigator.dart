import 'package:flutter/material.dart'
    show
        GlobalKey,
        Key,
        MaterialPageRoute,
        Navigator,
        NavigatorState,
        StatelessWidget,
        Widget;

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget tabPage;

  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabPage})
      : super(key: key);

  @override
  Widget build(context) {
    return Navigator(
        key: navigatorKey,
        
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(builder: (context) => tabPage);
        });
  }
}
