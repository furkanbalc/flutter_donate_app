import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/address_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_icon_button.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_text_button.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

class DeleteAddressAppBar extends StatelessWidget {
  const DeleteAddressAppBar({super.key, required this.addressViewModel});

  final AddressViewModel addressViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: AppColors.cascadingWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomTextButton(
                onPressed: addressViewModel.selectAllAddress,
                text: LocaleKeys.address_select_all.tr(),
                textStyle: context.textStyles.titleSmall,
              ),
              CustomTextButton(
                onPressed: addressViewModel.deleteModeOff,
                text: LocaleKeys.address_cancel.tr(),
                textStyle: context.textStyles.titleSmall.copyWith(
                  color: AppColors.electricViolet,
                ),
              ),
            ],
          ),
          CustomIconButton(
            onPressed: () {
              // removeFromArray(profileViewModel.getUserId, 0);
              addressViewModel.deleteAddress(
                deleteAddressIndices: addressViewModel.isCheckedList
                    .asMap()
                    .entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .toList(),
              );
            },
            icon: const Icon(AppIcons.kDeleteIcon, color: AppColors.electricViolet),
          ),
        ],
      ),
    );
  }
}
