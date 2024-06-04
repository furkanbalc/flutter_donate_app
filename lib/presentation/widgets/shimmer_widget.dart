import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: context.dynamicHeight(),
      padding: context.paddings.allLow,
      color: Colors.white,
      child: Shimmer.fromColors(
        baseColor: AppColors.greyLighter,
        highlightColor: AppColors.whiteColor,
        child: Row(
          children: [
            Container(
              width: context.dynamicWidth(.25),
              height: context.dynamicWidth(.25),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
            context.sizedBoxWidthMedium,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 150.0,
                      height: 20.0,
                      color: Colors.grey[300],
                    ),
                    context.sizedBoxWidthLow,
                    Container(
                      width: 20.0,
                      height: 20.0,
                      color: Colors.grey[300],
                    ),
                    context.sizedBoxWidthLow,
                    Container(
                      width: 20.0,
                      height: 20.0,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
                context.sizedBoxHeightLow,
                Container(
                  width: 200.0,
                  height: 20.0,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
