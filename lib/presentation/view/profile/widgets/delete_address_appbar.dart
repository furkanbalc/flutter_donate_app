import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/address_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_icon_button.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_text_button.dart';
import 'package:iconsax/iconsax.dart';

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
                text: 'Tümünü Seç',
                textStyle: context.textStyles.titleSmall,
              ),
              CustomTextButton(
                onPressed: addressViewModel.deleteModeOff,
                text: 'İptal Et',
                textStyle: context.textStyles.titleSmall.copyWith(
                  color: AppColors.electricViolet,
                ),
              ),
            ],
          ),
          CustomIconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.kDeleteIcon, color: AppColors.electricViolet),
          ),
        ],
      ),
    );
  }




}
