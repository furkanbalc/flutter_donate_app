import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';

class CustomIconButtonTheme {
  CustomIconButtonTheme._();

  /// Light
  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      shadowColor: AppColors.transparentColor,
      splashFactory: NoSplash.splashFactory,
    ),
  );

  /// Dark
}
