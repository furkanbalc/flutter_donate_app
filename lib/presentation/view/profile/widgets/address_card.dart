import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/address_viewmodel.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.addressViewModel,
    required this.index,
  });

  final AddressViewModel addressViewModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cascadingWhite,
      child: Padding(
        padding: context.paddings.allLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              addressViewModel.getAddressTitle(index),
              style: context.textStyles.titleSmall.copyWith(fontWeight: FontWeight.bold),
            ),
            context.sizedBoxHeightMin,
            Text(
              addressViewModel.getAddressDesc(index),
              style: context.textStyles.titleSmall.copyWith(
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
