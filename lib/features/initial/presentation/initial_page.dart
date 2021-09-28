import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      appNavigation.push(NavigationPage(), isFullPage: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
