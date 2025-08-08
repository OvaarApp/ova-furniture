import 'package:flutter/material.dart';

class ScreenSize {
  static double width = 0;
  static double height = 0;
  static bool isPortrait = true;

  // Prevents the instantiation of the class
  ScreenSize._();

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    isPortrait = mediaQuery.orientation == Orientation.portrait;
    width = mediaQuery.size.width;
    height = mediaQuery.size.height;
    if (!isPortrait) {
      width *= 1;
      height *= 2.4;
    }
  }
}
