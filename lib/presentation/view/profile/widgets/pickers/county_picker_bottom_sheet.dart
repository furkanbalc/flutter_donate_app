import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/utils/custom_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:go_router/go_router.dart';

selectCountyPicker({
  required BuildContext context,
  required AddressViewModel addressViewModel,
}) {
  customBottomSheet(
    context: context,
    body: SizedBox(
      height: 400, // BottomSheet yüksekliği
      child: Column(
        children: [
          Expanded(
            child: CupertinoPicker.builder(
              scrollController: FixedExtentScrollController(
                initialItem: addressViewModel.selectedCountyIndex,
              ),
              childCount: addressViewModel.getCountyLenght,
              diameterRatio: 1.5,
              itemExtent: 40,
              squeeze: 1,
              onSelectedItemChanged: (index) {
                addressViewModel.selectedCountyIndex = index;
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    addressViewModel.getCountyByIndex(index),
                    style: TextStyle(
                      fontSize: addressViewModel.selectedCountyIndex == index
                          ? 35
                          : 30,
                      fontWeight: addressViewModel.selectedCountyIndex == index
                          ? FontWeight.bold
                          : FontWeight.w800,
                      color: addressViewModel.selectedCountyIndex == index
                          ? AppColors.electricViolet
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
          CustomElevatedButton(
            onPressed: () {
              addressViewModel.getSelectedCountyName;
              context.pop();
            },
            text: LocaleKeys.address_select.tr(),
          ),
        ],
      ),
    ),
  );
}
