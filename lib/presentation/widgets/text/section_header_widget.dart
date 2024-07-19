import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.actionText,
    this.action,
  });

  final String title;
  final String? actionText;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.horizontalMedium + context.paddings.onlyTopNormal,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: action,
                splashFactory: NoSplash.splashFactory,
                highlightColor: AppColors.transparentColor,
                child: Text(
                  actionText ?? 'Tümünü Gör',
                  style: context.textStyles.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.electricViolet,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
