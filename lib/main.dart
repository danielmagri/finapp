import 'package:flutter/material.dart' show Key, MaterialApp, StatelessWidget, Widget, WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;

import 'features/initial/initial_page.dart';
import 'shared/di/get_it_config.dart';
import 'shared/sharedPref/shared_pref.dart';
import 'shared/theme/app_theme.dart';
import 'shared/theme/dark_theme.dart';
import 'shared/theme/enum/theme_type.dart';
import 'shared/theme/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    
    return AppTheme(
        initialTheme: getThemeType(injector.get<SharedPref>().theme).toThemeMode,
        themeChanged: (theme) {
          // injector.get<AppLogic>().setDefaultStyle(theme.defaultSystemOverlayStyle);
        },
        builder: (mode) => MaterialApp(
              themeMode: mode,
              theme: LightTheme().materialTheme,
              darkTheme: DarkTheme().materialTheme,
              debugShowCheckedModeBanner: false,
              home: InitialPage(),
              // navigatorObservers: [FirebaseAnalyticsObserver(analytics: getIt.get<IFireAnalytics>().analytics)],
              // onGenerateRoute: Router.generateRoute,
            ));
  }
}
