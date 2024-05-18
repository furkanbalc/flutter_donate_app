import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/context_borders.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/core/extensions/string_extension.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_image_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_svg_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: context.dynamicHeight(.25),
            backgroundColor: AppColors.electricViolet,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.linesBg.toPng),fit: BoxFit.fill)),
                child: Padding(
                  padding: context.paddings.allMedium,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Konum', style: context.textStyles.titleSmall.copyWith(color: AppColors.whiteColor)),
                              context.sizedBoxHeightMin,
                              Row(
                                children: [
                                  const Icon(AppIcons.kLocationIcon, color: AppColors.whiteColor, size: 20),
                                  Text('Kahramanmaraş, Türkiye',
                                      style: context.textStyles.titleMedium.copyWith(color: AppColors.whiteColor)),
                                  const Icon(AppIcons.kArrowDown, color: AppColors.whiteColor),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            padding: context.paddings.zero,
                            onPressed: () {},
                            icon: Container(
                              padding: context.paddings.allLow,
                              decoration: BoxDecoration(
                                color: AppColors.blueTang,
                                borderRadius: context.borders.circularBorderRadiusNormal,
                              ),
                              child: const Badge(child: Icon(AppIcons.kNotificationIcon, color: AppColors.whiteColor)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(56),
              child: Padding(
                padding: context.paddings.allMedium,
                child: Column(
                  children: [
                    context.sizedBoxHeightMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              filled: true,
                              fillColor: AppColors.whiteColor,
                              contentPadding: context.paddings.zero,
                              prefixIcon: const Icon(AppIcons.kSearchIcon, color: AppColors.steel),
                            ),
                          ),
                        ),
                        context.sizedBoxWidthLow,
                        IconButton(
                          style: IconButton.styleFrom(padding: context.paddings.zero),
                          onPressed: () {},
                          icon: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: context.borders.circularBorderRadiusNormal,
                            ),
                            child: const Icon(AppIcons.kFilterIcon, color: AppColors.electricViolet),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: context.dynamicWidth(95),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Son Eklenenler',
                                style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w600)),
                            Text('Tümünü Gör',
                                style: context.textStyles.titleSmall
                                    .copyWith(fontWeight: FontWeight.w600, color: AppColors.electricViolet)),
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
                                        padding: context.paddings.allLow,
                                        child: ClipRRect(
                                          borderRadius: context.borders.circularBorderRadiusLow,
                                          child: Stack(
                                            children: [
                                              CustomImageWidget(image: AppAssets.sofa.toPng, fit: BoxFit.cover),
                                              Positioned(
                                                left: 5,
                                                top: 5,
                                                child: Container(
                                                  padding: const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.whiteColor,
                                                    borderRadius: context.borders.circularBorderRadiusMin,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      const Icon(Icons.star_rounded,
                                                          color: AppColors.orangeColor, size: 16),
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
                                        padding: context.paddings.allLow,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: context.paddings.horizontalNormal,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.electricViolet.withOpacity(.1),
                                                    borderRadius: context.borders.circularBorderRadiusMin,
                                                  ),
                                                  child: Text('Bağış',
                                                      style: context.textStyles.labelSmall
                                                          .copyWith(color: AppColors.steel)),
                                                ),
                                                const SizedBox(width: 10),
                                                Container(
                                                  padding: context.paddings.horizontalLow,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.greenColor.withOpacity(.2),
                                                    borderRadius: context.borders.circularBorderRadiusMin,
                                                  ),
                                                  child: Text('Yeni Gibi',
                                                      style: context.textStyles.labelSmall
                                                          .copyWith(color: AppColors.steel)),
                                                ),
                                                const SizedBox(width: 10),
                                                Container(
                                                  padding: context.paddings.horizontalLow,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.blueColor.withOpacity(.2),
                                                    borderRadius: context.borders.circularBorderRadiusMin,
                                                  ),
                                                  child: Text('Mobilya',
                                                      style: context.textStyles.labelSmall
                                                          .copyWith(color: AppColors.steel)),
                                                ),
                                              ],
                                            ),
                                            context.sizedBoxHeightLow,
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
                                                      child: CustomSvgWidget(svg: AppAssets.profile.toSvg, width: 20),
                                                    ),
                                                    context.sizedBoxWidthLow,
                                                    Text(
                                                      'Kullanıcı Adı',
                                                      style:
                                                          context.textStyles.bodySmall.copyWith(color: AppColors.steel),
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
                                                      child: const Icon(AppIcons.kLocationIcon,
                                                          color: AppColors.electricViolet, size: 20),
                                                    ),
                                                    context.sizedBoxWidthLow,
                                                    Text(
                                                      '9.4 km',
                                                      style:
                                                          context.textStyles.bodySmall.copyWith(color: AppColors.steel),
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
                    ),
                  ),
                  context.sizedBoxHeightNormal,
                  SizedBox(
                    height: context.dynamicWidth(.95),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Son Eklenenler',
                                style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w600)),
                            Text('Tümünü Gör',
                                style: context.textStyles.titleSmall
                                    .copyWith(fontWeight: FontWeight.w600, color: AppColors.electricViolet)),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: context.dynamicWidth(.5),
                                child: Card(
                                  elevation: 0,
                                  color: AppColors.whiteColor,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: context.paddings.allLow,
                                        child: ClipRRect(
                                          borderRadius: context.borders.circularBorderRadiusLow,
                                          child: Stack(
                                            children: [
                                              CustomImageWidget(image: AppAssets.sofa.toPng, fit: BoxFit.cover),
                                              Positioned(
                                                left: 5,
                                                top: 5,
                                                child: Container(
                                                  padding: const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.whiteColor,
                                                    borderRadius: context.borders.circularBorderRadiusMin,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      const Icon(Icons.star_rounded,
                                                          color: AppColors.orangeColor, size: 16),
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
                                        padding: context.paddings.allLow,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: context.paddings.horizontalNormal,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.electricViolet.withOpacity(.1),
                                                    borderRadius: context.borders.circularBorderRadiusMin,
                                                  ),
                                                  child: Text('Bağış',
                                                      style: context.textStyles.labelSmall
                                                          .copyWith(color: AppColors.steel)),
                                                ),
                                                const SizedBox(width: 10),
                                                Container(
                                                  padding: context.paddings.horizontalLow,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.greenColor.withOpacity(.2),
                                                    borderRadius: context.borders.circularBorderRadiusMin,
                                                  ),
                                                  child: Text('Yeni Gibi',
                                                      style: context.textStyles.labelSmall
                                                          .copyWith(color: AppColors.steel)),
                                                ),
                                                const SizedBox(width: 10),
                                                Container(
                                                  padding: context.paddings.horizontalLow,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.blueColor.withOpacity(.2),
                                                    borderRadius: context.borders.circularBorderRadiusMin,
                                                  ),
                                                  child: Text('Mobilya',
                                                      style: context.textStyles.labelSmall
                                                          .copyWith(color: AppColors.steel)),
                                                ),
                                              ],
                                            ),
                                            context.sizedBoxHeightLow,
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
                                                      child: CustomSvgWidget(svg: AppAssets.profile.toSvg, width: 20),
                                                    ),
                                                    context.sizedBoxWidthLow,
                                                    Text(
                                                      'Kullanıcı Adı',
                                                      style:
                                                          context.textStyles.bodySmall.copyWith(color: AppColors.steel),
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
                                                      child: const Icon(AppIcons.kLocationIcon,
                                                          color: AppColors.electricViolet, size: 20),
                                                    ),
                                                    context.sizedBoxWidthLow,
                                                    Text(
                                                      '9.4 km',
                                                      style:
                                                          context.textStyles.bodySmall.copyWith(color: AppColors.steel),
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
