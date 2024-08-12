import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:shimmer/shimmer.dart';

class CustomCategoriesListShimmer extends StatelessWidget {
  const CustomCategoriesListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildShimmer(context);
  }

  /// Shimmer Widget
  Widget _buildShimmer(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildShimmerUserInfoFields(context),
        ],
      ),
    );
  }

  /// Shimmer User Info Fields
  Widget _buildShimmerUserInfoFields(BuildContext context) {
    return Padding(
      padding: context.paddings.allMedium1,
      child: Row(
        children: [
          _buildShimmerProfileInfoField(context),
          context.sizedBoxWidthMedium1,
          _buildShimmerProfileInfoField(context),
          context.sizedBoxWidthMedium1,
          _buildShimmerProfileInfoField(context),
          context.sizedBoxWidthMedium1,
          _buildShimmerProfileInfoField(context),
          context.sizedBoxWidthMedium1,
          _buildShimmerProfileInfoField(context),
        ],
      ),
    );
  }

  Widget _buildShimmerProfileInfoField(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyLight.withOpacity(.1),
      highlightColor: AppColors.greyLighter,
      child: Column(
        children: [
          Container(
            width: context.dynamicWidth(.15),
            height: context.dynamicWidth(.14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
          ),
          context.sizedBoxHeightMin,
          Container(
            width: context.dynamicWidth(.13),
            height: context.dynamicWidth(.05),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
