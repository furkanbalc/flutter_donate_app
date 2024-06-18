import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';


class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  /// Light
  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shadowColor: AppColors.transparentColor,
      splashFactory: NoSplash.splashFactory,
      foregroundColor: AppColors.whiteColor,
      backgroundColor: AppColors.electricViolet,
      disabledBackgroundColor: AppColors.greyLight,
      disabledForegroundColor: AppColors.cascadingWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.high3.value)),
      textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.whiteColor),
    ),
  );

  /// Dark
}
