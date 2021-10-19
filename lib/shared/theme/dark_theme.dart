import 'package:flutter/material.dart'
    show Brightness, Color, Colors, ThemeData;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

import 'interface/app_theme_interface.dart';

class DarkTheme implements IAppTheme {
  @override
  final ThemeData materialTheme = ThemeData();

  @override
  SystemUiOverlayStyle get defaultSystemOverlayStyle => SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      // systemNavigationBarColor: AppColors.colorDarkBackground,
      systemNavigationBarIconBrightness: Brightness.light);

  @override
  Color get shimmerBase => Color.fromARGB(255, 40, 40, 40);

  @override
  Color get shimmerHighlight => Color.fromARGB(255, 90, 90, 90);
}
