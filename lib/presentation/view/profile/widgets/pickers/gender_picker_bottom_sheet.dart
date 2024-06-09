import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/custom_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
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
            title: const Text('Erkek'),
            onTap: () {
              profileViewModel.genderController.text = 'Erkek';
              profileViewModel.genderIcon = AppIcons.kManIcon;
              context.pop();
            },
            leading: const Icon(AppIcons.kManIcon, color: AppColors.blueTang),
            tileColor: gender == 'Erkek' ? AppColors.electricViolet.withOpacity(.2) : null,
            shape: RoundedRectangleBorder(
              side: gender == 'Erkek' ? const BorderSide(color: AppColors.electricViolet) : BorderSide.none,
              borderRadius: context.borders.circularBorderRadiusMedium,
            ),
          ),
          ListTile(
            title: const Text('Kadın'),
            onTap: () {
              profileViewModel.genderController.text = 'Kadın';
              profileViewModel.genderIcon = AppIcons.kWomanIcon;
              context.pop();
            },
            leading: const Icon(AppIcons.kWomanIcon, color: AppColors.tomatoFrog),
            tileColor: gender == 'Kadın' ? AppColors.electricViolet.withOpacity(.2) : null,
            shape: RoundedRectangleBorder(
              borderRadius: context.borders.circularBorderRadiusMedium,
              side: gender == 'Kadın' ? const BorderSide(color: AppColors.electricViolet) : BorderSide.none,
            ),
          ),
        ],
      ),
    ),
  );
}
