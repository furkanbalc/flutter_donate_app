import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_icon_button.dart';

customBottomSheet<T>({
  required BuildContext context,
  String? title,
  required Widget body,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          title != null
              ? _bottomSheetHeader(context, title)
              : context.sizedBoxShrink,
          context.sizedBoxHeightLow,
          Padding(
            padding: context.paddings.allLow,
            child: body,
          ),
          context.sizedBoxHeightNormal,
        ],
      );
    },
  );
}

Widget _bottomSheetHeader(BuildContext context, String? title) {
  return Padding(
    padding: context.paddings.horizontalNormal,
    child: Column(
      children: [
        _shortHBar(),
        Row(
          children: [
            context.sizedBoxWidthNormal,
            Text(
              title ?? '',
              style: context.textStyles.titleMedium.copyWith(
                  color: AppColors.blackPrimary, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            CustomIconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, color: AppColors.blackPrimary),
            ),
            context.sizedBoxHeightLow,
          ],
        ),
        Divider(color: AppColors.blackPrimary.withOpacity(0.3)),
      ],
    ),
  );
}

Widget _shortHBar() {
  return Container(
    height: 4,
    width: 50,
    margin: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      color: AppColors.electricViolet,
      borderRadius: BorderRadius.circular(5),
    ),
  );
}
