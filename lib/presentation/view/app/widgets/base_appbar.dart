
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_constants.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppConstants.appName.toLowerCase(),style: context.textStyles.bodyLarge.copyWith(color: AppColors.whiteColor)),
      centerTitle: true,
      backgroundColor: AppColors.electricViolet,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
