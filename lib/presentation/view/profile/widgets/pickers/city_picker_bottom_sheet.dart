import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/utils/custom_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:go_router/go_router.dart';

selectCityPicker({
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
                initialItem: addressViewModel.selectedCityIndex == -1
                    ? 0
                    : addressViewModel.selectedCityIndex,
              ),
              childCount: addressViewModel.getCitiesLenght,
              diameterRatio: 1.5,
              itemExtent: 40,
              squeeze: 1,
              onSelectedItemChanged: (index) {
                addressViewModel.selectedCityIndex = index;
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    addressViewModel.getCityByIndex(index),
                    style: TextStyle(
                      fontSize:
                          addressViewModel.selectedCityIndex == index ? 35 : 30,
                      fontWeight: addressViewModel.selectedCityIndex == index
                          ? FontWeight.bold
                          : FontWeight.w800,
                      color: addressViewModel.selectedCityIndex == index
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
              addressViewModel.city.text = addressViewModel.getSelectedCityName;
              addressViewModel.county.text = '';
              addressViewModel.desc.text = '';
              context.pop();
            },
            text: LocaleKeys.address_select.tr(),
          )
        ],
      ),
    ),
  );
}
