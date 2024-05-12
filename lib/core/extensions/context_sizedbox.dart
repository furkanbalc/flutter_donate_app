import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';

/// Uygulamada kullanilan SizedBox Widgeti her defasinde elle degerler girmek yerine
/// sabit degelerler ile tanimlanarak extension ile context uzerinden erisilebilir hale getirildi
extension CustomSizedBoxExtension on BuildContext {
  /// -- WIDTH --
  SizedBox get sizedBoxWidthMin => SizedBox(width: AppSizes.min.value);
  SizedBox get sizedBoxWidthLow => SizedBox(width: AppSizes.low.value);
  SizedBox get sizedBoxWidthNormal => SizedBox(width: AppSizes.normal.value);
  SizedBox get sizedBoxWidthMedium => SizedBox(width: AppSizes.medium.value);
  SizedBox get sizedBoxWidthHigh => SizedBox(width: AppSizes.high.value);
  SizedBox get sizedBoxWidthUltra => SizedBox(width: AppSizes.ultra.value);

  /// -- HEIGHT --
  SizedBox get sizedBoxHeightMin => SizedBox(height: AppSizes.min.value);
  SizedBox get sizedBoxHeightLow => SizedBox(height: AppSizes.low.value);
  SizedBox get sizedBoxHeightNormal => SizedBox(height: AppSizes.normal.value);
  SizedBox get sizedBoxHeightMedium => SizedBox(height: AppSizes.medium.value);
  SizedBox get sizedBoxHeightHigh => SizedBox(height: AppSizes.high.value);
  SizedBox get sizedBoxHeightUltra => SizedBox(height: AppSizes.ultra.value);
  SizedBox get sizedBoxHeightCustom => SizedBox(height: AppSizes.custom.value);
  SizedBox get sizedBoxShrink => const SizedBox.shrink();
}
