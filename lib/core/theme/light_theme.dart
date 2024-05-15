import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/theme/custom_theme/elevated_button_theme.dart';
import 'package:flutter_donate_app/core/theme/custom_theme/input_decoration_theme.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'InterFontFamily',
  primaryColor: AppColors.electricViolet,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.whiteColor,
  inputDecorationTheme: CustomInputDecorationTheme.lightInputDecorationTheme,
  elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
);
