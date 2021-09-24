import 'package:flutter/foundation.dart' show protected;
import 'package:flutter/material.dart'
    show FocusScope, State, StatefulWidget, debugPrint;

import '../di/get_it_config.dart' show injector;

abstract class BaseStateWithController<T extends StatefulWidget,
    L extends Object> extends BaseState<T> {
  @protected
  L controller = injector.get<L>();

  @override
  void dispose() {
    super.dispose();
    injector.resetLazySingleton(instance: controller);
    debugPrint("Disposed $L");
  }
}

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  // bool _loading = false;

  // List<ReactionDisposer>? reactionsDisposers;

  // AppNavigation appNavigation = GetIt.I.get<AppNavigation>();

  @protected
  void removeFocus() {
    FocusScope.of(context).unfocus();
  }

  // @protected
  // void showSuccessSnackbar(String message) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(Snackbars.successSnackbar(message));
  // }

  // @protected
  // void showAlertSnackbar(String message) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(Snackbars.errorSnackbar(message));
  // }

  // @protected
  // void showErrorMessage(Failure? error) {
  //   ScaffoldMessenger.of(context).showSnackBar(Snackbars.errorSnackbar(
  //       kDebugMode
  //           ? error?.message ?? S.current.genericError
  //           : S.current.genericError));

  // }

  // @protected
  // void showLoading(bool show) {
  //   if (!_loading && show) {
  //     Navigator.of(appNavigation.fullPageContext!).push(PageRouteBuilder(
  //         opaque: false,
  //         barrierColor: Colors.black26,
  //         barrierDismissible: false,
  //         fullscreenDialog: true,
  //         transitionDuration: const Duration(milliseconds: 100),
  //         pageBuilder: (context, _, __) => FullLoading()));
  //     _loading = true;
  //   } else if (_loading && !show) {
  //     Navigator.of(appNavigation.fullPageContext!).pop();
  //     _loading = false;
  //   }
  // }

  // @override
  // void dispose() {
  //   reactionsDisposers?.forEach((dispose) {
  //     dispose();
  //   });
  //   super.dispose();
  // }
}
