import 'package:ova_furniture_ui/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); 

  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.first,
        brightness: Brightness.light
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        )
    ),
    useMaterial3: true,
  );

  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.first,
      brightness: Brightness.dark
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
      )
    ),
    useMaterial3: true
  );
}
