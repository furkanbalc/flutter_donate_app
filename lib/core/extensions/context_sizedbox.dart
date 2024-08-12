import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';

/// Uygulamada kullanilan SizedBox Widgeti her defasinde elle degerler girmek yerine
/// sabit degelerler ile tanimlanarak extension ile context uzerinden erisilebilir hale getirildi
extension CustomSizedBoxExtension on BuildContext {
  /// -- WIDTH --
  ///
  /// SizedBox(width: 2.0)
  SizedBox get sizedBoxWidthMin => SizedBox(width: AppSizes.min.value);

  /// SizedBox(width: 4.0)
  SizedBox get sizedBoxWidthLow1 => SizedBox(width: AppSizes.low1.value);

  /// SizedBox(width: 8.0)
  SizedBox get sizedBoxWidthLow2 => SizedBox(width: AppSizes.low2.value);

  /// SizedBox(width: 12.0)
  SizedBox get sizedBoxWidthLow3 => SizedBox(width: AppSizes.low3.value);

  /// SizedBox(width: 16.0)
  SizedBox get sizedBoxWidthMedium1 => SizedBox(width: AppSizes.medium1.value);

  /// SizedBox(width: 20.0)
  SizedBox get sizedBoxWidthMedium2 => SizedBox(width: AppSizes.medium2.value);

  /// SizedBox(width: 24.0)
  SizedBox get sizedBoxWidthMedium3 => SizedBox(width: AppSizes.medium3.value);

  /// SizedBox(width: 28.0)
  SizedBox get sizedBoxWidthHigh1 => SizedBox(width: AppSizes.high1.value);

  /// SizedBox(width: 32.0)
  SizedBox get sizedBoxWidthHigh2 => SizedBox(width: AppSizes.high2.value);

  /// SizedBox(width: 36.0)
  SizedBox get sizedBoxWidthHigh3 => SizedBox(width: AppSizes.high3.value);

  /// -- HEIGHT --
  ///
  /// SizedBox(height: 2.0)
  SizedBox get sizedBoxHeightMin => SizedBox(height: AppSizes.min.value);

  /// SizedBox(height: 4.0)
  SizedBox get sizedBoxHeightLow1 => SizedBox(height: AppSizes.low1.value);

  /// SizedBox(height: 8.0)
  SizedBox get sizedBoxHeightLow2 => SizedBox(height: AppSizes.low2.value);

  /// SizedBox(height: 12.0)
  SizedBox get sizedBoxHeightLow3 => SizedBox(height: AppSizes.low3.value);

  /// SizedBox(height: 16.0)
  SizedBox get sizedBoxHeightMedium1 => SizedBox(height: AppSizes.medium1.value);

  /// SizedBox(height: 20.0)
  SizedBox get sizedBoxHeightMedium2 => SizedBox(height: AppSizes.medium2.value);

  /// SizedBox(height: 24.0)
  SizedBox get sizedBoxHeightMedium3 => SizedBox(height: AppSizes.medium3.value);

  /// SizedBox(height: 28.0)
  SizedBox get sizedBoxHeightHigh1 => SizedBox(height: AppSizes.high1.value);

  /// SizedBox(height: 32.0)
  SizedBox get sizedBoxHeightHigh2 => SizedBox(height: AppSizes.high2.value);

  /// SizedBox(height: 36.0)
  SizedBox get sizedBoxHeightHigh3 => SizedBox(height: AppSizes.high3.value);

  /// -- SHRINK --
  ///
  /// SizedBox.shrink()
  SizedBox get sizedBoxShrink => const SizedBox.shrink();
}
