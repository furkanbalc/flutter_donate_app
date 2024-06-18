import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';

/// Uygulamada kullanilan SizedBox Widgeti her defasinde elle degerler girmek yerine
/// sabit degelerler ile tanimlanarak extension ile context uzerinden erisilebilir hale getirildi
extension CustomSizedBoxExtension on BuildContext {
  /// -- WIDTH --
  SizedBox get sizedBoxWidthMin => SizedBox(width: AppSizes.low1.value);
  SizedBox get sizedBoxWidthLow => SizedBox(width: AppSizes.low2.value);
  SizedBox get sizedBoxWidthNormal => SizedBox(width: AppSizes.low3.value);
  SizedBox get sizedBoxWidthMedium => SizedBox(width: AppSizes.medium1.value);
  SizedBox get sizedBoxWidthHigh => SizedBox(width: AppSizes.medium2.value);
  SizedBox get sizedBoxWidthUltra => SizedBox(width: AppSizes.medium3.value);

  /// -- HEIGHT --
  SizedBox get sizedBoxHeightMin => SizedBox(height: AppSizes.low1.value);
  SizedBox get sizedBoxHeightLow => SizedBox(height: AppSizes.low2.value);
  SizedBox get sizedBoxHeightNormal => SizedBox(height: AppSizes.low3.value);
  SizedBox get sizedBoxHeightMedium => SizedBox(height: AppSizes.medium1.value);
  SizedBox get sizedBoxHeightHigh => SizedBox(height: AppSizes.medium2.value);
  SizedBox get sizedBoxHeightUltra => SizedBox(height: AppSizes.medium3.value);
  SizedBox get sizedBoxHeightCustom => SizedBox(height: AppSizes.high3.value);
  SizedBox get sizedBoxShrink => const SizedBox.shrink();
}
