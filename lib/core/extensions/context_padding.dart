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
  ///  EdgeInsets.all(2.0)
  EdgeInsets get allMin => EdgeInsets.all(AppSizes.min.value);

  ///  EdgeInsets.all(4.0)
  EdgeInsets get allLow1 => EdgeInsets.all(AppSizes.low1.value);

  ///  EdgeInsets.all(8.0)
  EdgeInsets get allLow2 => EdgeInsets.all(AppSizes.low2.value);

  ///  EdgeInsets.all(12.0)
  EdgeInsets get allLow3 => EdgeInsets.all(AppSizes.low3.value);

  ///  EdgeInsets.all(16.0)
  EdgeInsets get allMedium1 => EdgeInsets.all(AppSizes.medium1.value);

  ///  EdgeInsets.all(20.0)
  EdgeInsets get allMedium2 => EdgeInsets.all(AppSizes.medium2.value);

  ///  EdgeInsets.all(24.0)
  EdgeInsets get allMedium3 => EdgeInsets.all(AppSizes.medium3.value);

  ///  EdgeInsets.all(28.0)
  EdgeInsets get allHigh1 => EdgeInsets.all(AppSizes.high1.value);

  ///  EdgeInsets.all(32.0)
  EdgeInsets get allHigh2 => EdgeInsets.all(AppSizes.high2.value);

  ///  EdgeInsets.all(36.0)
  EdgeInsets get allHigh3 => EdgeInsets.all(AppSizes.high3.value);

  /// -- ONLY TOP PADDING --
  ///
  ///  EdgeInsets.only(top: 2.0)
  EdgeInsets get onlyTopMin => EdgeInsets.only(top: AppSizes.min.value);

  ///  EdgeInsets.only(top: 4.0)
  EdgeInsets get onlyTopLow1 => EdgeInsets.only(top: AppSizes.low1.value);

  ///  EdgeInsets.only(top: 8.0)
  EdgeInsets get onlyTopLow2 => EdgeInsets.only(top: AppSizes.low2.value);

  ///  EdgeInsets.only(top: 12.0)
  EdgeInsets get onlyTopLow3 => EdgeInsets.only(top: AppSizes.low3.value);

  ///  EdgeInsets.only(top: 16.0)
  EdgeInsets get onlyTopMedium1 => EdgeInsets.only(top: AppSizes.medium1.value);

  ///  EdgeInsets.only(top: 20.0)
  EdgeInsets get onlyTopMedium2 => EdgeInsets.only(top: AppSizes.medium2.value);

  ///  EdgeInsets.only(top: 24.0)
  EdgeInsets get onlyTopMedium3 => EdgeInsets.only(top: AppSizes.medium3.value);

  ///  EdgeInsets.only(top: 28.0)
  EdgeInsets get onlyTopHigh1 => EdgeInsets.only(top: AppSizes.high1.value);

  ///  EdgeInsets.only(top: 32.0)
  EdgeInsets get onlyTopHigh2 => EdgeInsets.only(top: AppSizes.high2.value);

  ///  EdgeInsets.only(top: 36.0)
  EdgeInsets get onlyTopHigh3 => EdgeInsets.only(top: AppSizes.high3.value);

  /// -- ONLY BOTTOM PADDING --
  ///
  ///  EdgeInsets.only(bottom: 2.0)
  EdgeInsets get onlyBottomMin => EdgeInsets.only(bottom: AppSizes.min.value);

  ///  EdgeInsets.only(bottom: 4.0)
  EdgeInsets get onlyBottomLow1 => EdgeInsets.only(bottom: AppSizes.low1.value);

  ///  EdgeInsets.only(bottom: 8.0)
  EdgeInsets get onlyBottomLow2 => EdgeInsets.only(bottom: AppSizes.low2.value);

  ///  EdgeInsets.only(bottom: 12.0)
  EdgeInsets get onlyBottomLow3 => EdgeInsets.only(bottom: AppSizes.low3.value);

  ///  EdgeInsets.only(bottom: 16.0)
  EdgeInsets get onlyBottomMedium1 => EdgeInsets.only(bottom: AppSizes.medium1.value);

  ///  EdgeInsets.only(bottom: 20.0)
  EdgeInsets get onlyBottomMedium2 => EdgeInsets.only(bottom: AppSizes.medium2.value);

  ///  EdgeInsets.only(bottom: 24.0)
  EdgeInsets get onlyBottomMedium3 => EdgeInsets.only(bottom: AppSizes.medium3.value);

  ///  EdgeInsets.only(bottom: 28.0)
  EdgeInsets get onlyBottomHigh1 => EdgeInsets.only(bottom: AppSizes.high1.value);

  ///  EdgeInsets.only(bottom: 32.0)
  EdgeInsets get onlyBottomHigh2 => EdgeInsets.only(bottom: AppSizes.high2.value);

  ///  EdgeInsets.only(bottom: 36.0)
  EdgeInsets get onlyBottomHigh3 => EdgeInsets.only(bottom: AppSizes.high3.value);

  /// -- ONLY RIGHT PADDING --
  ///
  ///  EdgeInsets.only(right: 2.0)
  EdgeInsets get onlyRightMin => EdgeInsets.only(right: AppSizes.min.value);

  ///  EdgeInsets.only(right: 4.0)
  EdgeInsets get onlyRightLow1 => EdgeInsets.only(right: AppSizes.low1.value);

  ///  EdgeInsets.only(right: 8.0)
  EdgeInsets get onlyRightLow2 => EdgeInsets.only(right: AppSizes.low2.value);

  ///  EdgeInsets.only(right: 12.0)
  EdgeInsets get onlyRightLow3 => EdgeInsets.only(right: AppSizes.low3.value);

  ///  EdgeInsets.only(right: 16.0)
  EdgeInsets get onlyRightMedium1 => EdgeInsets.only(right: AppSizes.medium1.value);

  ///  EdgeInsets.only(right: 20.0)
  EdgeInsets get onlyRightMedium2 => EdgeInsets.only(right: AppSizes.medium2.value);

  ///  EdgeInsets.only(right: 24.0)
  EdgeInsets get onlyRightMedium3 => EdgeInsets.only(right: AppSizes.medium3.value);

  ///  EdgeInsets.only(right: 28.0)
  EdgeInsets get onlyRightHigh1 => EdgeInsets.only(right: AppSizes.high1.value);

  ///  EdgeInsets.only(right: 32.0)
  EdgeInsets get onlyRightHigh2 => EdgeInsets.only(right: AppSizes.high2.value);

  ///  EdgeInsets.only(right: 36.0)
  EdgeInsets get onlyRightHigh3 => EdgeInsets.only(right: AppSizes.high3.value);

  /// -- ONLY LEFT PADDING --
  ///
  ///  EdgeInsets.only(left: 2.0)
  EdgeInsets get onlyLeftMin => EdgeInsets.only(left: AppSizes.min.value);

  ///  EdgeInsets.only(left: 4.0)
  EdgeInsets get onlyLeftLow1 => EdgeInsets.only(left: AppSizes.low1.value);

  ///  EdgeInsets.only(left: 8.0)
  EdgeInsets get onlyLeftLow2 => EdgeInsets.only(left: AppSizes.low2.value);

  ///  EdgeInsets.only(left: 12.0)
  EdgeInsets get onlyLeftLow3 => EdgeInsets.only(left: AppSizes.low3.value);

  ///  EdgeInsets.only(left: 16.0)
  EdgeInsets get onlyLeftMedium1 => EdgeInsets.only(left: AppSizes.medium1.value);

  ///  EdgeInsets.only(left: 20.0)
  EdgeInsets get onlyLeftMedium2 => EdgeInsets.only(left: AppSizes.medium2.value);

  ///  EdgeInsets.only(left: 24.0)
  EdgeInsets get onlyLeftMedium3 => EdgeInsets.only(left: AppSizes.medium3.value);

  ///  EdgeInsets.only(left: 28.0)
  EdgeInsets get onlyLeftHigh1 => EdgeInsets.only(left: AppSizes.high1.value);

  ///  EdgeInsets.only(left: 32.0)
  EdgeInsets get onlyLeftHigh2 => EdgeInsets.only(left: AppSizes.high2.value);

  ///  EdgeInsets.only(left: 36.0)
  EdgeInsets get onlyLeftHigh3 => EdgeInsets.only(left: AppSizes.high3.value);

  /// -- VERTICAL PADDING --
  ///
  ///  EdgeInsets.symmetric(vertical: 2.0)
  EdgeInsets get verticalMin => EdgeInsets.symmetric(vertical: AppSizes.min.value);

  ///  EdgeInsets.symmetric(vertical: 4.0)
  EdgeInsets get verticalLow1 => EdgeInsets.symmetric(vertical: AppSizes.low2.value);

  ///  EdgeInsets.symmetric(vertical: 8.0)
  EdgeInsets get verticalLow2 => EdgeInsets.symmetric(vertical: AppSizes.low2.value);

  ///  EdgeInsets.symmetric(vertical: 12.0)
  EdgeInsets get verticalLow3 => EdgeInsets.symmetric(vertical: AppSizes.low3.value);

  ///  EdgeInsets.symmetric(vertical: 16.0)
  EdgeInsets get verticalMedium1 => EdgeInsets.symmetric(vertical: AppSizes.medium1.value);

  ///  EdgeInsets.symmetric(vertical: 20.0)
  EdgeInsets get verticalMedium2 => EdgeInsets.symmetric(vertical: AppSizes.medium2.value);

  ///  EdgeInsets.symmetric(vertical: 24.0)
  EdgeInsets get verticalMedium3 => EdgeInsets.symmetric(vertical: AppSizes.medium3.value);

  ///  EdgeInsets.symmetric(vertical: 28.0)
  EdgeInsets get verticalHigh1 => EdgeInsets.symmetric(vertical: AppSizes.high1.value);

  ///  EdgeInsets.symmetric(vertical: 32.0)
  EdgeInsets get verticalHigh2 => EdgeInsets.symmetric(vertical: AppSizes.high2.value);

  ///  EdgeInsets.symmetric(vertical: 36.0)
  EdgeInsets get verticalHigh3 => EdgeInsets.symmetric(vertical: AppSizes.high3.value);

  /// -- HORIZONTAL PADDING --
  ///
  ///  EdgeInsets.symmetric(horizontal: 2.0)
  EdgeInsets get horizontalMin => EdgeInsets.symmetric(horizontal: AppSizes.min.value);

  ///  EdgeInsets.symmetric(horizontal: 4.0)
  EdgeInsets get horizontalLow1 => EdgeInsets.symmetric(horizontal: AppSizes.low1.value);

  ///  EdgeInsets.symmetric(horizontal: 8.0)
  EdgeInsets get horizontalLow2 => EdgeInsets.symmetric(horizontal: AppSizes.low2.value);

  ///  EdgeInsets.symmetric(horizontal: 12.0)
  EdgeInsets get horizontalLow3 => EdgeInsets.symmetric(horizontal: AppSizes.low3.value);

  ///  EdgeInsets.symmetric(horizontal: 16.0)
  EdgeInsets get horizontalMedium1 => EdgeInsets.symmetric(horizontal: AppSizes.medium1.value);

  ///  EdgeInsets.symmetric(horizontal: 20.0)
  EdgeInsets get horizontalMedium2 => EdgeInsets.symmetric(horizontal: AppSizes.medium2.value);

  ///  EdgeInsets.symmetric(horizontal: 24.0)
  EdgeInsets get horizontalMedium3 => EdgeInsets.symmetric(horizontal: AppSizes.medium3.value);

  ///  EdgeInsets.symmetric(horizontal: 28.0)
  EdgeInsets get horizontalHigh1 => EdgeInsets.symmetric(horizontal: AppSizes.high1.value);

  ///  EdgeInsets.symmetric(horizontal: 32.0)
  EdgeInsets get horizontalHigh2 => EdgeInsets.symmetric(horizontal: AppSizes.high2.value);

  ///  EdgeInsets.symmetric(horizontal: 36.0)
  EdgeInsets get horizontalHigh3 => EdgeInsets.symmetric(horizontal: AppSizes.high3.value);
}
