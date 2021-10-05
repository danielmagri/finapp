import 'package:flutter/material.dart'
    show
        Colors,
        Container,
        EdgeInsets,
        GlobalKey,
        Icon,
        Icons,
        Key,
        MediaQuery,
        NavigatorState,
        NeverScrollableScrollPhysics,
        Scaffold,
        SingleTickerProviderStateMixin,
        StatefulWidget,
        Tab,
        TabBar,
        TabBarView,
        TabController,
        Text,
        TextAlign,
        TextStyle,
        Widget;

import '../../../shared/base/base_page.dart';
import '../../../shared/routes/core/model/tab_navigator.dart';
import '../../../shared/routes/core/root_bottom_navigation.dart';
import '../../../shared/widgets/focus_fixer.dart';
import '../../transaction/presentation/transaction_page.dart';
import 'navigation_controller.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState
    extends BaseStateWithController<NavigationPage, NavigationController>
    with SingleTickerProviderStateMixin {
  static const INITIAL_PAGE = 0;

  TabController? tabController;

  List<TabNavigator> pageListTab = [
    TabNavigator(
        navigatorKey: GlobalKey<NavigatorState>(), tabPage: TransactionPage()),
  ];

  @override
  void initState() {
    tabController = TabController(
        length: pageListTab.length, vsync: this, initialIndex: INITIAL_PAGE);

    tabController?.addListener(() {
      if (tabController?.indexIsChanging == true &&
          tabController?.index != null) {
        controller.switchPage(tabController!.index);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    var bottomSpace = MediaQuery.of(context).padding.bottom;
    return FocusFixer(
      child: RootBottomNavigation(
        pages: pageListTab,
        initialPage: INITIAL_PAGE,
        child: Scaffold(
          body: TabBarView(
            controller: tabController,
            children: pageListTab,
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: bottomSpace),
            color: Colors.green,
            height: 80 + bottomSpace,
            child: TabBar(
              indicatorWeight: 3,
              labelColor: Colors.black,
              controller: tabController,
              tabs: [
                tabItem(
                    // Image.asset(Images.IC_WALL, width: 24, color: Colors.white),
                    Icon(Icons.wallet_giftcard),
                    'Transações'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabItem(Widget icon, String text) => Tab(
        icon: icon,
        iconMargin: const EdgeInsets.only(bottom: 8),
        child: Text(text,
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      );
}
