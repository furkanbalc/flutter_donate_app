import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';

/// Padding degerlerini her defasinda uzun uzun yazmak yerine
/// sabit degerler tanimlanarak extension ile context uzerinden kolay erisim saglandi
extension CustomPaddingsExtension on BuildContext {
  CustomPaddings get paddings => CustomPaddings(this);
}

class CustomPaddings {
  final BuildContext context;

  CustomPaddings(this.context);

  /// -- ZERO PADDING --
  ///
  ///  EdgeInsets.zero
  EdgeInsets get zero => EdgeInsets.zero;

  /// -- ALL PADDING --
  ///
  ///  EdgeInsets.all(4.0)
  EdgeInsets get allMin => EdgeInsets.all(AppSizes.low1.value);

  ///  EdgeInsets.all(8.0)
  EdgeInsets get allLow => EdgeInsets.all(AppSizes.low2.value);

  ///  EdgeInsets.all(12.0)
  EdgeInsets get allNormal => EdgeInsets.all(AppSizes.low3.value);

  ///  EdgeInsets.all(16.0)
  EdgeInsets get allMedium => EdgeInsets.all(AppSizes.medium1.value);

  ///  EdgeInsets.all(20.0)
  EdgeInsets get allHigh => EdgeInsets.all(AppSizes.medium2.value);

  ///  EdgeInsets.all(24.0)
  EdgeInsets get allUltra => EdgeInsets.all(AppSizes.medium3.value);

  ///  EdgeInsets.all(36.0)
  EdgeInsets get allCustom => EdgeInsets.all(AppSizes.high3.value);

  /// -- ONLY TOP PADDING --
  ///
  ///  EdgeInsets.only(top: 8.0)
  EdgeInsets get onlyTopLow => EdgeInsets.only(top: AppSizes.low2.value);

  ///  EdgeInsets.only(top: 12.0)
  EdgeInsets get onlyTopNormal => EdgeInsets.only(top: AppSizes.low3.value);

  ///  EdgeInsets.only(top: 16.0)
  EdgeInsets get onlyTopMedium => EdgeInsets.only(top: AppSizes.medium1.value);

  ///  EdgeInsets.only(top: 20.0)
  EdgeInsets get onlyTopHigh => EdgeInsets.only(top: AppSizes.medium2.value);

  ///  EdgeInsets.only(top: 24.0)
  EdgeInsets get onlyTopUltra => EdgeInsets.only(top: AppSizes.medium3.value);

  /// -- ONLY BOTTOM PADDING --
  ///
  ///  EdgeInsets.only(bottom: 8.0)
  EdgeInsets get onlyBottomLow => EdgeInsets.only(bottom: AppSizes.low2.value);

  ///  EdgeInsets.only(bottom: 12.0)
  EdgeInsets get onlyBottomNormal => EdgeInsets.only(bottom: AppSizes.low3.value);

  ///  EdgeInsets.only(bottom: 16.0)
  EdgeInsets get onlyBottomMedium => EdgeInsets.only(bottom: AppSizes.medium1.value);

  ///  EdgeInsets.only(bottom: 20.0)
  EdgeInsets get onlyBottomHigh => EdgeInsets.only(bottom: AppSizes.medium2.value);

  ///  EdgeInsets.only(bottom: 24.0)
  EdgeInsets get onlyBottomUltra => EdgeInsets.only(bottom: AppSizes.medium3.value);

  /// -- ONLY RIGHT PADDING --
  ///
  ///  EdgeInsets.only(right: 8.0)
  EdgeInsets get onlyRightLow => EdgeInsets.only(right: AppSizes.low2.value);

  ///  EdgeInsets.only(right: 8.0)
  EdgeInsets get onlyRightNormal => EdgeInsets.only(right: AppSizes.low3.value);

  ///  EdgeInsets.only(right: 8.0)
  EdgeInsets get onlyRightMedium => EdgeInsets.only(right: AppSizes.medium1.value);

  ///  EdgeInsets.only(right: 8.0)
  EdgeInsets get onlyRightHigh => EdgeInsets.only(right: AppSizes.medium2.value);

  ///  EdgeInsets.only(right: 8.0)
  EdgeInsets get onlyRightUltra => EdgeInsets.only(right: AppSizes.medium3.value);

  /// -- ONLY LEFT PADDING --
  ///
  ///  EdgeInsets.only(left: 8.0)
  EdgeInsets get onlyLeftLow => EdgeInsets.only(left: AppSizes.low2.value);

  ///  EdgeInsets.only(left: 8.0)
  EdgeInsets get onlyLeftNormal => EdgeInsets.only(left: AppSizes.low3.value);

  ///  EdgeInsets.only(left: 8.0)
  EdgeInsets get onlyLeftMedium => EdgeInsets.only(left: AppSizes.medium1.value);

  ///  EdgeInsets.only(left: 8.0)
  EdgeInsets get onlyLeftHigh => EdgeInsets.only(left: AppSizes.medium2.value);

  ///  EdgeInsets.only(left: 8.0)
  EdgeInsets get onlyLeftUltra => EdgeInsets.only(left: AppSizes.medium3.value);

  /// -- VERTICAL PADDING --
  ///
  ///  EdgeInsets.symmetric(vertical: 8.0)
  EdgeInsets get verticalLow => EdgeInsets.symmetric(vertical: AppSizes.low2.value);

  ///  EdgeInsets.symmetric(vertical: 12.0)
  EdgeInsets get verticalNormal => EdgeInsets.symmetric(vertical: AppSizes.low3.value);

  ///  EdgeInsets.symmetric(vertical: 16.0)
  EdgeInsets get verticalMedium => EdgeInsets.symmetric(vertical: AppSizes.medium1.value);

  ///  EdgeInsets.symmetric(vertical: 20.0)
  EdgeInsets get verticalHigh => EdgeInsets.symmetric(vertical: AppSizes.medium2.value);

  ///  EdgeInsets.symmetric(vertical: 24.0)
  EdgeInsets get verticalUltra => EdgeInsets.symmetric(vertical: AppSizes.medium3.value);

  /// -- HORIZONTAL PADDING --
  ///
  ///  EdgeInsets.symmetric(horizontal: 8.0)
  EdgeInsets get horizontalLow => EdgeInsets.symmetric(horizontal: AppSizes.low2.value);

  ///  EdgeInsets.symmetric(horizontal: 12.0)
  EdgeInsets get horizontalNormal => EdgeInsets.symmetric(horizontal: AppSizes.low3.value);

  ///  EdgeInsets.symmetric(horizontal: 16.0)
  EdgeInsets get horizontalMedium => EdgeInsets.symmetric(horizontal: AppSizes.medium1.value);

  ///  EdgeInsets.symmetric(horizontal: 20.0)
  EdgeInsets get horizontalHigh => EdgeInsets.symmetric(horizontal: AppSizes.medium2.value);

  ///  EdgeInsets.symmetric(horizontal: 24.0)
  EdgeInsets get horizontalUltra => EdgeInsets.symmetric(horizontal: AppSizes.medium3.value);
}
