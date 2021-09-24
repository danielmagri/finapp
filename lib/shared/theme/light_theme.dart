import 'package:flutter/material.dart' show Brightness, Colors, ThemeData;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'interface/app_theme_interface.dart';

class LightTheme implements IAppTheme {
  @override
  final ThemeData materialTheme = ThemeData();

  @override
  SystemUiOverlayStyle get defaultSystemOverlayStyle => SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      // systemNavigationBarColor: AppColors.colorLightBackground,
      systemNavigationBarIconBrightness: Brightness.dark);
}
