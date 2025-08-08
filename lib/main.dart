import 'package:flutter/material.dart';
import 'package:ova_furniture_ui/screens/layout.dart';
import 'package:ova_furniture_ui/screens/welcome_screen.dart';
import 'package:ova_furniture_ui/theme/app_theme.dart';
import 'package:ova_furniture_ui/utils/screen_size.dart';

void main() {
  runApp(const MyApp());
}

// Main app widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Ova Furniture Ui',
        debugShowCheckedModeBanner: false,
         theme: AppTheme.light,
        home: WelcomeScreen(), // Replace with your first screen
      ),
    );
  }
}
