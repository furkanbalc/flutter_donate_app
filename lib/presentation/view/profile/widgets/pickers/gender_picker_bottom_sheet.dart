import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/custom_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:go_router/go_router.dart';

genderPickerBottomSheet({
  required BuildContext context,
  required ProfileViewModel profileViewModel,
}) {
  var gender = profileViewModel.genderController.text;
  return customBottomSheet(
    context: context,
    body: Padding(
      padding: context.paddings.allMin,
      child: Column(
        children: [
          ListTile(
            title: Text(LocaleKeys.user_info_man.tr()),
            onTap: () {
              profileViewModel.genderController.text =
                  LocaleKeys.user_info_man.tr();
              profileViewModel.genderIcon = AppIcons.kManIcon;
              context.pop();
            },
            leading: const Icon(AppIcons.kManIcon, color: AppColors.blueTang),
            tileColor: gender == LocaleKeys.user_info_man.tr()
                ? AppColors.electricViolet.withOpacity(.2)
                : null,
            shape: RoundedRectangleBorder(
              side: gender == LocaleKeys.user_info_man.tr()
                  ? const BorderSide(color: AppColors.electricViolet)
                  : BorderSide.none,
              borderRadius: context.borders.circularBorderRadiusMedium,
            ),
          ),
          ListTile(
            title: Text(LocaleKeys.user_info_woman.tr()),
            onTap: () {
              profileViewModel.genderController.text =
                  LocaleKeys.user_info_woman.tr();
              profileViewModel.genderIcon = AppIcons.kWomanIcon;
              context.pop();
            },
            leading:
                const Icon(AppIcons.kWomanIcon, color: AppColors.tomatoFrog),
            tileColor: gender == LocaleKeys.user_info_woman.tr()
                ? AppColors.electricViolet.withOpacity(.2)
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: context.borders.circularBorderRadiusMedium,
              side: gender == LocaleKeys.user_info_woman.tr()
                  ? const BorderSide(color: AppColors.electricViolet)
                  : BorderSide.none,
            ),
          ),
        ],
      ),
    ),
  );
}
