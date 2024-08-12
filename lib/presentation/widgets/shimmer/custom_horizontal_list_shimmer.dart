import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/widgets/text/section_header_widget.dart';
import 'package:shimmer/shimmer.dart';

class CustomHorizontalListShimmer extends StatefulWidget {
  const CustomHorizontalListShimmer({super.key});

  @override
  State<CustomHorizontalListShimmer> createState() => _CustomHorizontalListShimmerState();
}

class _CustomHorizontalListShimmerState extends State<CustomHorizontalListShimmer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeaderWidget(title: 'Son Eklenenler'),
        Padding(
          padding: context.paddings.verticalMedium2 + context.paddings.onlyLeftMedium2,
          child: Row(
            children: [
              Container(
                height: context.dynamicHeight(.4),
                width: context.dynamicWidth(.65),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: context.borders.circularBorderRadiusNormal,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: AppColors.greyLight.withOpacity(.1),
                        highlightColor: AppColors.greyLighter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: context.borders.radiusNormal),
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: context.dynamicWidth(.7),
                        padding: context.paddings.allLow3,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildShimmerProfileInfoField(
                                  width: context.dynamicWidth(.18),
                                  height: context.dynamicWidth(.05),
                                ),
                                _buildShimmerProfileInfoField(
                                  width: context.dynamicWidth(.18),
                                  height: context.dynamicWidth(.05),
                                ),
                                _buildShimmerProfileInfoField(
                                  width: context.dynamicWidth(.18),
                                  height: context.dynamicWidth(.05),
                                ),
                              ],
                            ),
                            context.sizedBoxHeightLow2,
                            _buildShimmerProfileInfoField(
                              width: context.dynamicWidth(.3),
                              height: context.dynamicWidth(.05),
                            ),
                            context.sizedBoxHeightLow2,
                            _buildShimmerProfileInfoField(
                              width: double.infinity,
                              height: context.dynamicWidth(.05),
                            ),
                            context.sizedBoxHeightMin,
                            _buildShimmerProfileInfoField(
                              width: double.infinity,
                              height: context.dynamicWidth(.05),
                            ),
                            context.sizedBoxHeightMedium2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    _buildShimmerProfileInfoField(
                                        width: context.dynamicWidth(.08),
                                        height: context.dynamicWidth(.08),
                                        shape: BoxShape.circle),
                                    context.sizedBoxWidthLow2,
                                    _buildShimmerProfileInfoField(
                                      width: context.dynamicWidth(.18),
                                      height: context.dynamicWidth(.05),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    _buildShimmerProfileInfoField(
                                        width: context.dynamicWidth(.08),
                                        height: context.dynamicWidth(.08),
                                        shape: BoxShape.circle),
                                    context.sizedBoxWidthLow2,
                                    _buildShimmerProfileInfoField(
                                      width: context.dynamicWidth(.18),
                                      height: context.dynamicWidth(.05),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              context.sizedBoxWidthMedium1,
              Container(
                height: context.dynamicHeight(.4),
                width: context.dynamicWidth(.25),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.horizontal(left: context.borders.radiusNormal),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: AppColors.greyLight.withOpacity(.1),
                        highlightColor: AppColors.greyLighter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: context.borders.radiusNormal),
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: context.dynamicWidth(.3),
                        padding: context.paddings.allLow3,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildShimmerProfileInfoField(
                              width: context.dynamicWidth(.2),
                              height: context.dynamicWidth(.05),
                            ),
                            context.sizedBoxHeightLow2,
                            _buildShimmerProfileInfoField(
                              width: context.dynamicWidth(.2),
                              height: context.dynamicWidth(.05),
                            ),
                            context.sizedBoxHeightLow2,
                            _buildShimmerProfileInfoField(
                              width: context.dynamicWidth(.2),
                              height: context.dynamicWidth(.05),
                            ),
                            context.sizedBoxHeightMin,
                            _buildShimmerProfileInfoField(
                              width: context.dynamicWidth(.2),
                              height: context.dynamicWidth(.05),
                            ),
                            context.sizedBoxHeightMedium2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    _buildShimmerProfileInfoField(
                                        width: context.dynamicWidth(.08),
                                        height: context.dynamicWidth(.08),
                                        shape: BoxShape.circle),
                                    context.sizedBoxWidthLow2,
                                    _buildShimmerProfileInfoField(
                                      width: context.dynamicWidth(.08),
                                      height: context.dynamicWidth(.05),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerProfileInfoField({
    required double width,
    required double height,
    BoxShape? shape,
  }) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyLight.withOpacity(.1),
      highlightColor: AppColors.greyLighter,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: shape ?? BoxShape.rectangle,
        ),
      ),
    );
  }
}
