import 'package:flutter/material.dart'
    show Container, Key, StatefulWidget, Widget;

import '../../../shared/base/base_page.dart';
import '../../navigation/presentation/navigation_page.dart';
import 'initial_controller.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState
    extends BaseStateWithController<InitialPage, InitialController> {
  @override
  void initState() {
    super.initState();
    controller.loadData().whenComplete(
        () => appNavigation.push(NavigationPage(), isFullPage: true));
  }

  @override
  Widget build(context) {
    return Container();
  }
}
