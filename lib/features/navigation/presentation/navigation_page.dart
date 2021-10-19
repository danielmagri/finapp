import 'package:animations/animations.dart'
    show FadeThroughTransition, PageTransitionSwitcher;
import 'package:flutter/material.dart'
    show
        CircularNotchedRectangle,
        Colors,
        FloatingActionButton,
        FloatingActionButtonLocation,
        GlobalKey,
        Icon,
        Icons,
        Key,
        NavigatorState,
        Scaffold,
        StatefulWidget,
        UniqueKey,
        Widget;
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/base/base_page.dart';
import '../../../shared/model/transaction.dart';
import '../../../shared/routes/core/model/tab_navigator.dart';
import '../../../shared/routes/core/root_bottom_navigation.dart';
import '../../../shared/widgets/focus_fixer.dart';
import '../../budget/presentation/budget_page.dart';
import '../../transaction/presentation/add/add_transaction_page.dart';
import '../../transaction/presentation/list/transaction_page.dart';
import '../widgets/fab_bottom_bar.dart';
import 'navigation_controller.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState
    extends BaseStateWithController<NavigationPage, NavigationController> {
  List<TabNavigator> pageListTab = [
    TabNavigator(
        key: UniqueKey(),
        navigatorKey: GlobalKey<NavigatorState>(),
        tabPage: TransactionPage()),
    TabNavigator(
        key: UniqueKey(),
        navigatorKey: GlobalKey<NavigatorState>(),
        tabPage: BudgetPage()),
  ];

  void addButtonAction() {
    appNavigation.push(AddTransactionPage(), isFullPage: true).then((value) {
      if (value is Transaction) {
        controller.updateTransactions();
      }
    });
  }

  @override
  Widget build(context) {
    return FocusFixer(
      child: RootBottomNavigation(
        pages: pageListTab,
        initialPage: controller.pageIndex,
        child: Scaffold(
          body: Observer(
            builder: (_) => PageTransitionSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation, secondaryAnimation) =>
                  FadeThroughTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      child: child),
              child: pageListTab[controller.pageIndex],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: addButtonAction,
            child: Icon(Icons.add),
            elevation: 4.0,
          ),
          bottomNavigationBar: FABBottomBar(
            initialPage: controller.pageIndex,
            onTabSelected: controller.switchPage,
            items: const [
              FABBottomBarItem(
                  iconData: Icons.monetization_on, text: 'Transactions'),
              FABBottomBarItem(iconData: Icons.money, text: 'Budget'),
            ],
            backgroundColor: Colors.white,
            color: Colors.red,
            selectedColor: Colors.blue,
            notchedShape: CircularNotchedRectangle(),
          ),
        ),
      ),
    );
  }
}
