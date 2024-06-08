import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';

class CustomTextButtonThemeData {
  CustomTextButtonThemeData._();

  /// Light
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      shadowColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      foregroundColor: AppColors.electricViolet,
    ),
  );

  /// Dark
}
