import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/app_png.dart';
import 'package:flutter_donate_app/core/enums/app_svg.dart';
import 'package:flutter_donate_app/core/extensions/context_borders.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_image_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_svg_widget.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Son Eklenenler',
                style: context.textStyles.titleMedium
                    .copyWith(fontWeight: FontWeight.w600)),
            Text('Tümünü Gör',
                style: context.textStyles.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.electricViolet)),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: context.dynamicWidth(.7),
                child: Card(
                  elevation: 0,
                  color: AppColors.whiteColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: context.paddings.allLow2,
                        child: ClipRRect(
                          borderRadius: context.borders.circularBorderRadiusLow,
                          child: Stack(
                            children: [
                              CustomImageWidget(
                                  image: AppPng.sofa.toPng, fit: BoxFit.cover),
                              Positioned(
                                left: 5,
                                top: 5,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius:
                                        context.borders.circularBorderRadiusMin,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star_rounded,
                                          color: AppColors.orangeColor,
                                          size: 16),
                                      Text(
                                        '4.9',
                                        style: context.textStyles.bodySmall
                                            .copyWith(color: AppColors.steel),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: Container(
                                  padding: context.paddings.allMin,
                                  decoration: const BoxDecoration(
                                    color: AppColors.whiteColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(AppIcons.kFavouriteIcon,
                                      color: AppColors.redColor, size: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: context.paddings.allLow2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: context.paddings.horizontalLow3,
                                  decoration: BoxDecoration(
                                    color: AppColors.electricViolet
                                        .withOpacity(.1),
                                    borderRadius:
                                        context.borders.circularBorderRadiusMin,
                                  ),
                                  child: Text('Bağış',
                                      style: context.textStyles.labelSmall
                                          .copyWith(color: AppColors.steel)),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: context.paddings.horizontalLow2,
                                  decoration: BoxDecoration(
                                    color: AppColors.greenColor.withOpacity(.2),
                                    borderRadius:
                                        context.borders.circularBorderRadiusMin,
                                  ),
                                  child: Text('Yeni Gibi',
                                      style: context.textStyles.labelSmall
                                          .copyWith(color: AppColors.steel)),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: context.paddings.horizontalLow2,
                                  decoration: BoxDecoration(
                                    color: AppColors.blueColor.withOpacity(.2),
                                    borderRadius:
                                        context.borders.circularBorderRadiusMin,
                                  ),
                                  child: Text('Mobilya',
                                      style: context.textStyles.labelSmall
                                          .copyWith(color: AppColors.steel)),
                                ),
                              ],
                            ),
                            context.sizedBoxHeightLow2,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Koltuk',
                                    style: context.textStyles.titleMedium
                                        .copyWith(fontWeight: FontWeight.w600)),
                                Text(
                                  'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit, sed do dolor sit amet',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.titleSmall.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    color: AppColors.steel,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: AppColors.cascadingWhite),
                            context.sizedBoxHeightMin,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: context.paddings.allMin,
                                      decoration: const BoxDecoration(
                                        color: AppColors.cascadingWhite,
                                        shape: BoxShape.circle,
                                      ),
                                      child: CustomSvgWidget(
                                          svg: AppSvg.profile.toSvg, width: 20),
                                    ),
                                    context.sizedBoxWidthLow2,
                                    Text(
                                      'Kullanıcı Adı',
                                      style: context.textStyles.bodySmall
                                          .copyWith(color: AppColors.steel),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: context.paddings.allMin,
                                      decoration: const BoxDecoration(
                                        color: AppColors.cascadingWhite,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                          AppIcons.kLocationOutlinedIcon,
                                          color: AppColors.electricViolet,
                                          size: 20),
                                    ),
                                    context.sizedBoxWidthLow2,
                                    Text(
                                      '9.4 km',
                                      style: context.textStyles.bodySmall
                                          .copyWith(color: AppColors.steel),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
