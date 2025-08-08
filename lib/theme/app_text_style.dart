import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._(); // private constructor

  /// Base text style factory with customizable options
  static TextStyle _baseStyle({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) {
    return GoogleFonts.mulish(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle xxl({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      _baseStyle(fontSize: 50, fontWeight: fontWeight, color: color);

  static TextStyle xl({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      _baseStyle(fontSize: 32, fontWeight: fontWeight, color: color);

  static TextStyle large({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      _baseStyle(fontSize: 26, fontWeight: fontWeight, color: color);

  static TextStyle medium({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      _baseStyle(fontSize: 20, fontWeight: fontWeight, color: color);

  static TextStyle small({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      _baseStyle(fontSize: 16, fontWeight: fontWeight, color: color);
}
