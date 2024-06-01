import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';

class ProfileListTileWidget extends StatelessWidget {
  const ProfileListTileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
     this.color,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: AppColors.transparentColor,
      onTap: onPressed,
      contentPadding: context.paddings.zero,
      title: Text(title, style: context.textStyles.bodyLarge),
      leading: Icon(icon, color:  color ??  AppColors.electricViolet, size: AppSizes.profilePageIconSize.value),
      trailing: title == 'Çıkış Yap' ? context.sizedBoxShrink : const Icon(AppIcons.kArrowRight, color:AppColors.electricViolet),
    );
  }
}
