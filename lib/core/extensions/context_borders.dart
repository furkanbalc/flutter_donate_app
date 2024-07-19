import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';

/// Uygulamada siklikla kullanilan  borderRadius degerlerini tekrar tekrar yazmamak icin
/// sabit degerler ile tanimlayip extension kullanilarak context uzerinden erisim saglandi
extension CustomBordersExtension on BuildContext {
  CustomBorders get borders => CustomBorders(this);
}

class CustomBorders {
  final BuildContext context;

  CustomBorders(this.context);

  /// -- radius
  ///
  ///  Radius.circular(4.0)
  Radius get radiusMin => Radius.circular(AppSizes.low1.value);

  ///  Radius.circular(8.0)
  Radius get radiusLow => Radius.circular(AppSizes.low2.value);

  ///  Radius.circular(12.0)
  Radius get radiusNormal => Radius.circular(AppSizes.low3.value);

  ///  Radius.circular(16.0)
  Radius get radiusMedium => Radius.circular(AppSizes.medium1.value);

  ///  Radius.circular(20.0)
  Radius get radiusHigh => Radius.circular(AppSizes.medium2.value);

  /// -- border radius
  ///
  /// BorderRadius.circular(4.0)
  BorderRadius get circularBorderRadiusMin => BorderRadius.circular(AppSizes.low1.value);

  /// BorderRadius.circular(8.0)
  BorderRadius get circularBorderRadiusLow => BorderRadius.circular(AppSizes.low2.value);

  /// BorderRadius.circular(12.0)
  BorderRadius get circularBorderRadiusNormal => BorderRadius.circular(AppSizes.low3.value);

  /// BorderRadius.circular(16.0)
  BorderRadius get circularBorderRadiusMedium => BorderRadius.circular(AppSizes.medium1.value);

  /// BorderRadius.circular(20.0)
  BorderRadius get circularBorderRadiusHigh => BorderRadius.circular(AppSizes.medium2.value);
}
