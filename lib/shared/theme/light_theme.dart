import 'package:flutter/material.dart'
    show Brightness, Color, Colors, ThemeData;
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

  @override
  Color get shimmerBase => Color.fromARGB(255, 224, 224, 224);

  @override
  Color get shimmerHighlight => Color.fromARGB(255, 245, 245, 245);
}
