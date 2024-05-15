import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';

class CustomInputDecorationTheme {
  CustomInputDecorationTheme._();
  static const double _kTextFieldFontSizes = 14;
  /// Light
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.greyLight.withOpacity(.1),
    labelStyle: const TextStyle().copyWith(fontSize: _kTextFieldFontSizes, color: AppColors.greyPrimary),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle(fontSize: _kTextFieldFontSizes).copyWith(
      color: AppColors.electricViolet,
      fontWeight: FontWeight.bold,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.medium.value),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(AppSizes.medium.value),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 0.5, color: AppColors.electricViolet),
      borderRadius: BorderRadius.circular(AppSizes.medium.value),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 0.5, color: AppColors.error),
      borderRadius: BorderRadius.circular(AppSizes.medium.value),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 0.5, color: AppColors.error),
      borderRadius: BorderRadius.circular(AppSizes.medium.value),
    ),
  );

/// Dark
}
