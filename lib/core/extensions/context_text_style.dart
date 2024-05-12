import 'package:flutter/material.dart';

/// Flutterin theme uzerinden erisim sagladigi textStyle lara uzun kullanim yerine
/// extension ile dogrudan context uzerinden erisim saglandi
extension CustomTextStyleExtension on BuildContext {
  CustomTextStyle get textStyles => CustomTextStyle(this);
}

class CustomTextStyle {
  final BuildContext context;
  CustomTextStyle(this.context);

  /// -- DISPLAY --
  TextStyle get displayLarge => Theme.of(context).textTheme.displayLarge!;
  TextStyle get displayMedium => Theme.of(context).textTheme.displayMedium!;
  TextStyle get displaySmall => Theme.of(context).textTheme.displaySmall!;

  /// -- HEADLINE --
  TextStyle get headlineLarge => Theme.of(context).textTheme.headlineLarge!;
  TextStyle get headlineMedium => Theme.of(context).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(context).textTheme.headlineSmall!;

  /// -- TITLE --
  TextStyle get titleLarge => Theme.of(context).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(context).textTheme.titleMedium!;
  TextStyle get titleSmall => Theme.of(context).textTheme.titleSmall!;

  /// -- BODY --
  TextStyle get bodyLarge => Theme.of(context).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(context).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(context).textTheme.bodySmall!;

  /// -- LABEL --
  TextStyle get labelLarge => Theme.of(context).textTheme.labelLarge!;
  TextStyle get labelMedium => Theme.of(context).textTheme.labelMedium!;
  TextStyle get labelSmall => Theme.of(context).textTheme.labelSmall!;
}
