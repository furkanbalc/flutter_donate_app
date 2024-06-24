import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:go_router/go_router.dart';

void agePickerBottomSheet({
  required BuildContext context,
  required ProfileViewModel profileViewModel,
}) async {
  return await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      int tempSelectedAge =
          int.tryParse(profileViewModel.ageController.text)! - 18;
      return Container(
        height: context.dynamicHeight(.3),
        padding: context.paddings.allLow,
        child: Column(
          children: [
            Expanded(
              child: CupertinoPicker.builder(
                scrollController: FixedExtentScrollController(
                  initialItem: tempSelectedAge,
                ),
                squeeze: 1,
                itemExtent: 40,
                onSelectedItemChanged: (value) {
                  tempSelectedAge = value;
                },
                childCount: 73,
                itemBuilder: (context, index) {
                  var age = index + 18;
                  return Center(
                    child: Text(
                      age.toString(),
                      style: TextStyle(
                        fontSize: tempSelectedAge == index ? 35 : 35,
                        fontWeight: tempSelectedAge == index
                            ? FontWeight.bold
                            : FontWeight.w800,
                        color: tempSelectedAge == index
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
                profileViewModel.ageController.text =
                    (tempSelectedAge + 18).toString();
                context.pop();
              },
              text: LocaleKeys.address_apply.tr(),
            ),
          ],
        ),
      );
    },
  );
}
