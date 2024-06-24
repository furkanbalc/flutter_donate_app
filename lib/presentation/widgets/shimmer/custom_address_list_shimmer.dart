import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:shimmer/shimmer.dart';

class CustomAddressListShimmer extends StatelessWidget {
  const CustomAddressListShimmer({super.key});

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
      padding: context.paddings.allMedium,
      child: Column(
        children: [
          _buildShimmerProfileInfoField(context),
          context.sizedBoxHeightMedium,
          _buildShimmerProfileInfoField(context),
          context.sizedBoxHeightMedium,
          _buildShimmerProfileInfoField(context),
          context.sizedBoxHeightMedium,
          _buildShimmerProfileInfoField(context),
          context.sizedBoxHeightMedium,
          _buildShimmerProfileInfoField(context),
          context.sizedBoxHeightMedium,
          _buildShimmerProfileInfoField(context),
        ],
      ),
    );
  }

  Widget _buildShimmerProfileInfoField(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyLight.withOpacity(.1),
      highlightColor: AppColors.greyLighter,
      child: Container(
        width: double.infinity,
        height: context.dynamicHeight(.1),
        decoration: BoxDecoration(
          borderRadius: context.borders.circularBorderRadiusMedium,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
