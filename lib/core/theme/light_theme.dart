import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/theme/custom_theme/index.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'InterFontFamily',
  primaryColor: AppColors.electricViolet,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.whiteColor,
  inputDecorationTheme: CustomInputDecorationTheme.lightInputDecorationTheme,
  elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
  appBarTheme: CustomAppBarTheme.lightAppBarTheme,
  bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
  iconButtonTheme: CustomIconButtonTheme.lightIconButtonTheme,
  textButtonTheme: CustomTextButtonThemeData.lightTextButtonTheme,
  cardTheme: CustomCardTheme.lightCardTheme,
);
