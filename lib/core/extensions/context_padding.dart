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
  EdgeInsets get zero => EdgeInsets.zero;

  /// -- ALL PADDING --
  EdgeInsets get allMin => EdgeInsets.all(AppSizes.low1.value);
  EdgeInsets get allLow => EdgeInsets.all(AppSizes.low2.value);
  EdgeInsets get allNormal => EdgeInsets.all(AppSizes.low3.value);
  EdgeInsets get allMedium => EdgeInsets.all(AppSizes.medium1.value);
  EdgeInsets get allHigh => EdgeInsets.all(AppSizes.medium2.value);
  EdgeInsets get allUltra => EdgeInsets.all(AppSizes.medium3.value);
  EdgeInsets get allCustom => EdgeInsets.all(AppSizes.high3.value);

  /// -- ONLY TOP PADDING --
  EdgeInsets get onlyTopLow => EdgeInsets.only(top: AppSizes.low2.value);
  EdgeInsets get onlyTopNormal => EdgeInsets.only(top: AppSizes.low3.value);
  EdgeInsets get onlyTopMedium => EdgeInsets.only(top: AppSizes.medium1.value);
  EdgeInsets get onlyTopHigh => EdgeInsets.only(top: AppSizes.medium2.value);
  EdgeInsets get onlyTopUltra => EdgeInsets.only(top: AppSizes.medium3.value);

  /// -- ONLY BOTTOM PADDING --
  EdgeInsets get onlyBottomLow => EdgeInsets.only(bottom: AppSizes.low2.value);
  EdgeInsets get onlyBottomNormal => EdgeInsets.only(bottom: AppSizes.low3.value);
  EdgeInsets get onlyBottomMedium => EdgeInsets.only(bottom: AppSizes.medium1.value);
  EdgeInsets get onlyBottomHigh => EdgeInsets.only(bottom: AppSizes.medium2.value);
  EdgeInsets get onlyBottomUltra => EdgeInsets.only(bottom: AppSizes.medium3.value);

  /// -- ONLY RIGHT PADDING --
  EdgeInsets get onlyRightLow => EdgeInsets.only(right: AppSizes.low2.value);
  EdgeInsets get onlyRightNormal => EdgeInsets.only(right: AppSizes.low3.value);
  EdgeInsets get onlyRightMedium => EdgeInsets.only(right: AppSizes.medium1.value);
  EdgeInsets get onlyRightHigh => EdgeInsets.only(right: AppSizes.medium2.value);
  EdgeInsets get onlyRightUltra => EdgeInsets.only(right: AppSizes.medium3.value);

  /// -- ONLY LEFT PADDING --
  EdgeInsets get onlyLeftLow => EdgeInsets.only(left: AppSizes.low2.value);
  EdgeInsets get onlyLeftNormal => EdgeInsets.only(left: AppSizes.low3.value);
  EdgeInsets get onlyLeftMedium => EdgeInsets.only(left: AppSizes.medium1.value);
  EdgeInsets get onlyLeftHigh => EdgeInsets.only(left: AppSizes.medium2.value);
  EdgeInsets get onlyLeftUltra => EdgeInsets.only(left: AppSizes.medium3.value);

  /// -- VERTICAL PADDING --
  EdgeInsets get verticalLow => EdgeInsets.symmetric(vertical: AppSizes.low2.value);
  EdgeInsets get verticalNormal => EdgeInsets.symmetric(vertical: AppSizes.low3.value);
  EdgeInsets get verticalMedium => EdgeInsets.symmetric(vertical: AppSizes.medium1.value);
  EdgeInsets get verticalHigh => EdgeInsets.symmetric(vertical: AppSizes.medium2.value);
  EdgeInsets get verticalUltra => EdgeInsets.symmetric(vertical: AppSizes.medium3.value);

  /// -- HORIZONTAL PADDING --
  EdgeInsets get horizontalLow => EdgeInsets.symmetric(horizontal: AppSizes.low2.value);
  EdgeInsets get horizontalNormal => EdgeInsets.symmetric(horizontal: AppSizes.low3.value);
  EdgeInsets get horizontalMedium => EdgeInsets.symmetric(horizontal: AppSizes.medium1.value);
  EdgeInsets get horizontalHigh => EdgeInsets.symmetric(horizontal: AppSizes.medium2.value);
  EdgeInsets get horizontalUltra => EdgeInsets.symmetric(horizontal: AppSizes.medium3.value);
}
