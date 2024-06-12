import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:shimmer/shimmer.dart';

class CustomProfileInfoShimmer extends StatefulWidget {
  const CustomProfileInfoShimmer({super.key});

  @override
  State<CustomProfileInfoShimmer> createState() => _CustomProfileInfoShimmerState();
}

class _CustomProfileInfoShimmerState extends State<CustomProfileInfoShimmer> {
  @override
  Widget build(BuildContext context) {
    return _buildShimmer(context);
  }

  /// Shimmer Widget
  Widget _buildShimmer(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildShimmerProfilPhoto(context),
          context.sizedBoxHeightMedium,
          _buildShimmerUserInfoFields(context),
        ],
      ),
    );
  }

  /// Shimmer Profil Photo
  Widget _buildShimmerProfilPhoto(BuildContext context) {
    return Container(
      padding: context.paddings.allHigh,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(AppColors.electricViolet.withOpacity(.3), BlendMode.srcIn),
          image: AssetImage(AppPng.linesBg.toPng),
        ),
      ),
      child: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
          ),
        ),
      ),
    );
  }

  /// Shimmer User Info Fields
  Widget _buildShimmerUserInfoFields(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: context.paddings.horizontalMedium + context.paddings.verticalNormal,
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
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: context.borders.circularBorderRadiusMedium,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
