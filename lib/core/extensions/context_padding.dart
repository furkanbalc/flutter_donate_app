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
  EdgeInsets get allMin => EdgeInsets.all(AppSizes.min.value);
  EdgeInsets get allLow => EdgeInsets.all(AppSizes.low.value);
  EdgeInsets get allNormal => EdgeInsets.all(AppSizes.normal.value);
  EdgeInsets get allMedium => EdgeInsets.all(AppSizes.medium.value);
  EdgeInsets get allHigh => EdgeInsets.all(AppSizes.high.value);
  EdgeInsets get allUltra => EdgeInsets.all(AppSizes.ultra.value);
  EdgeInsets get allCustom => EdgeInsets.all(AppSizes.custom.value);

  /// -- ONLY TOP PADDING --
  EdgeInsets get onlyTopLow => EdgeInsets.only(top: AppSizes.low.value);
  EdgeInsets get onlyTopNormal => EdgeInsets.only(top: AppSizes.normal.value);
  EdgeInsets get onlyTopMedium => EdgeInsets.only(top: AppSizes.medium.value);
  EdgeInsets get onlyTopHigh => EdgeInsets.only(top: AppSizes.high.value);
  EdgeInsets get onlyTopUltra => EdgeInsets.only(top: AppSizes.ultra.value);

  /// -- ONLY BOTTOM PADDING --
  EdgeInsets get onlyBottomLow => EdgeInsets.only(bottom: AppSizes.low.value);
  EdgeInsets get onlyBottomNormal => EdgeInsets.only(bottom: AppSizes.normal.value);
  EdgeInsets get onlyBottomMedium => EdgeInsets.only(bottom: AppSizes.medium.value);
  EdgeInsets get onlyBottomHigh => EdgeInsets.only(bottom: AppSizes.high.value);
  EdgeInsets get onlyBottomUltra => EdgeInsets.only(bottom: AppSizes.ultra.value);

  /// -- ONLY RIGHT PADDING --
  EdgeInsets get onlyRightLow => EdgeInsets.only(right: AppSizes.low.value);
  EdgeInsets get onlyRightNormal => EdgeInsets.only(right: AppSizes.normal.value);
  EdgeInsets get onlyRightMedium => EdgeInsets.only(right: AppSizes.medium.value);
  EdgeInsets get onlyRightHigh => EdgeInsets.only(right: AppSizes.high.value);
  EdgeInsets get onlyRightUltra => EdgeInsets.only(right: AppSizes.ultra.value);

  /// -- ONLY LEFT PADDING --
  EdgeInsets get onlyLeftLow => EdgeInsets.only(left: AppSizes.low.value);
  EdgeInsets get onlyLeftNormal => EdgeInsets.only(left: AppSizes.normal.value);
  EdgeInsets get onlyLeftMedium => EdgeInsets.only(left: AppSizes.medium.value);
  EdgeInsets get onlyLeftHigh => EdgeInsets.only(left: AppSizes.high.value);
  EdgeInsets get onlyLeftUltra => EdgeInsets.only(left: AppSizes.ultra.value);

  /// -- VERTICAL PADDING --
  EdgeInsets get verticalLow => EdgeInsets.symmetric(vertical: AppSizes.low.value);
  EdgeInsets get verticalNormal => EdgeInsets.symmetric(vertical: AppSizes.normal.value);
  EdgeInsets get verticalMedium => EdgeInsets.symmetric(vertical: AppSizes.medium.value);
  EdgeInsets get verticalHigh => EdgeInsets.symmetric(vertical: AppSizes.high.value);
  EdgeInsets get verticalUltra => EdgeInsets.symmetric(vertical: AppSizes.ultra.value);

  /// -- HORIZONTAL PADDING --
  EdgeInsets get horizontalLow => EdgeInsets.symmetric(horizontal: AppSizes.low.value);
  EdgeInsets get horizontalNormal => EdgeInsets.symmetric(horizontal: AppSizes.normal.value);
  EdgeInsets get horizontalMedium => EdgeInsets.symmetric(horizontal: AppSizes.medium.value);
  EdgeInsets get horizontalHigh => EdgeInsets.symmetric(horizontal: AppSizes.high.value);
  EdgeInsets get horizontalUltra => EdgeInsets.symmetric(horizontal: AppSizes.ultra.value);
}
