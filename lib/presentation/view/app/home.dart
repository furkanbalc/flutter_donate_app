import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/presentation/view/app/widgets/home/home_sliver_appbar.dart';
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
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            HomeSliverAppBar(),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: buildHorizontalList(context),
            ),
            SliverToBoxAdapter(
              child:  buildSectionHeader(context, 'Yakınlardakiler', 'Tümünü Gör'),
            ),
            SliverPadding(
              padding: context.paddings.zero,
              sliver: buildVerticalList(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHorizontalList(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.45),
      child: Column(
        children: [
          buildSectionHeader(context, 'Son Eklenenler', 'Tümünü Gör'),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buildHorizontalListItem(context);
              },
              separatorBuilder: (context, index) => context.sizedBoxWidthMin,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVerticalList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) {
          return buildVerticalListItem(context);
        },
      ),
    );
  }

  Widget buildSectionHeader(BuildContext context, String title, String actionText) {
    return Padding(
      padding: context.paddings.horizontalMedium + context.paddings.verticalLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            actionText,
            style: context.textStyles.titleSmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.electricViolet,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalListItem(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(.7),
      child: Card(
        elevation: 0,
        color: AppColors.whiteColor,
        child: Padding(
          padding: context.paddings.allMin,
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
                        child: buildRatingBadge(context, '4.9'),
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: buildFavoriteIcon(context),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: context.paddings.allLow,
                child: Column(
                  children: [
                    buildTags(context, ['Bağış', 'Yeni Gibi', 'Mobilya']),
                    context.sizedBoxHeightLow,
                    buildItemDetails(context, 'Koltuk',
                        'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit, sed do dolor sit amet'),
                    const Divider(color: AppColors.cascadingWhite),
                    context.sizedBoxHeightMin,
                    buildUserInfo(context, 'Kullanıcı Adı', '9.4 km'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVerticalListItem(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.20),
      child: Card(
        elevation: 0,
        color: AppColors.whiteColor,
        child: Padding(
          padding: context.paddings.allMedium,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: context.borders.circularBorderRadiusLow,
                  child: Stack(
                    children: [
                      CustomImageWidget(image: AppAssets.sofa.toPng, fit: BoxFit.cover,height: context.dynamicHeight(.20)),
                      Positioned(
                        left: 5,
                        top: 5,
                        child: buildRatingBadge(context, '4.9'),
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: buildFavoriteIcon(context),
                      ),
                    ],
                  ),
                ),
              ),
              context.sizedBoxWidthMedium,
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    buildTags(context, ['Bağış', 'Yeni Gibi', 'Mobilya']),
                    context.sizedBoxHeightLow,
                    buildItemDetails(context, 'Koltuk',
                        'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit, sed do dolor sit amet'),
                    const Divider(color: AppColors.cascadingWhite),
                    context.sizedBoxHeightMin,
                    buildUserInfo(context, 'Kullanıcı Adı', '9.4 km'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRatingBadge(BuildContext context, String rating) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: context.borders.circularBorderRadiusMin,
      ),
      child: Row(
        children: [
          const Icon(Icons.star_rounded, color: AppColors.orangeColor, size: 16),
          Text(
            rating,
            style: context.textStyles.bodySmall.copyWith(color: AppColors.steel),
          ),
        ],
      ),
    );
  }

  Widget buildFavoriteIcon(BuildContext context) {
    return Container(
      padding: context.paddings.allMin,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        shape: BoxShape.circle,
      ),
      child: const Icon(AppIcons.kFavouriteIcon, color: AppColors.redColor, size: 16),
    );
  }

  Widget buildTags(BuildContext context, List<String> tags) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: tags.map((tag) {
        Color backgroundColor;
        switch (tag) {
          case 'Bağış':
            backgroundColor = AppColors.electricViolet.withOpacity(.1);
            break;
          case 'Yeni Gibi':
            backgroundColor = AppColors.greenColor.withOpacity(.2);
            break;
          case 'Mobilya':
            backgroundColor = AppColors.blueColor.withOpacity(.2);
            break;
          default:
            backgroundColor = Colors.grey.withOpacity(.2);
        }
        return Container(
          margin: context.paddings.onlyRightLow,
          padding: context.paddings.horizontalLow,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: context.borders.circularBorderRadiusMin,
          ),
          child: Text(tag, style: context.textStyles.labelSmall.copyWith(color: AppColors.steel)),
        );
      }).toList(),
    );
  }

  Widget buildItemDetails(BuildContext context, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w600)),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textStyles.titleSmall.copyWith(
            overflow: TextOverflow.ellipsis,
            color: AppColors.steel,
          ),
        ),
      ],
    );
  }

  Widget buildUserInfo(BuildContext context, String username, String distance) {
    return Row(
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
              child: CustomSvgWidget(svg: AppAssets.profile.toSvg, width: 16),
            ),
            context.sizedBoxWidthLow,
            Text(username, style: context.textStyles.bodySmall.copyWith(color: AppColors.steel)),
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
              child: const Icon(AppIcons.kLocationIcon, color: AppColors.electricViolet, size: 16),
            ),
            context.sizedBoxWidthLow,
            Text(distance, style: context.textStyles.bodySmall.copyWith(color: AppColors.steel)),
          ],
        ),
      ],
    );
  }
}
