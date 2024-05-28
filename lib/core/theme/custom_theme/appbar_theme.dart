import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_constants.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  /// Light
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    titleTextStyle: const TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: kToolbarHeight,
      fontWeight: FontWeight.w600,
      color: AppColors.blackPrimary,
    ),
    iconTheme: IconThemeData(color: AppColors.blackPrimary, size: AppSizes.ultra.value),
    actionsIconTheme: IconThemeData(color: AppColors.blackPrimary, size: AppSizes.ultra.value),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.electricViolet,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  /// Dark
}
