import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_borders.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(color: Colors.black.withOpacity(.1)),
        Container(
          width: context.dynamicWidth(.13),
          height: context.dynamicWidth(.13),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: context.borders.circularBorderRadiusMedium,
          ),
          child: Shimmer.fromColors(
            baseColor: AppColors.blackColor,
            highlightColor: AppColors.whiteColor,
            child: Center(
              child: Image.asset(
                'assets/images/png/app-logo.png',
                width: context.dynamicWidth(.11),
                height: context.dynamicWidth(.11),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
