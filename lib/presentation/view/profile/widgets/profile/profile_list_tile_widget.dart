import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';

class ProfileListTileWidget extends StatelessWidget {
  const ProfileListTileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: AppColors.whiteColor,
      tileColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: context.borders.circularBorderRadiusMedium),
      onTap: onPressed,
      contentPadding: context.paddings.horizontalLow2,
      title: Text(title, style: context.textStyles.bodyLarge),
      leading: Icon(icon,
          color: AppColors.electricViolet, size: AppSizes.high1.value),
      trailing:
          const Icon(AppIcons.kArrowRight, color: AppColors.electricViolet),
    );
  }
}
