import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_svg_widget.dart';

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({
    super.key,
    required this.gender,
    required this.svg,
    this.isSelect = false,
    required this.onTap,
  });

  final String gender;
  final String svg;
  final bool isSelect;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: AppColors.transparentColor,
      splashFactory: NoSplash.splashFactory,
      child: CircleAvatar(
        maxRadius: context.dynamicWidth(.25),
        backgroundColor:
            isSelect ? AppColors.electricViolet : AppColors.greyLighter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgWidget(
              svg: svg,
              width: context.dynamicWidth(.3),
              color: isSelect ? null : AppColors.blackColor,
            ),
            Text(
              gender,
              style: context.textStyles.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelect ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
