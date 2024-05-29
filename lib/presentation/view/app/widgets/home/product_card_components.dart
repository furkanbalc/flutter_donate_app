import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';

mixin ProductCardComponents {
  /// Item Cart Rating Icon & Count
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

  /// Item Favorite Icon
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

  /// Category & Item Type & Item Status Tag
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

  /// Item Title & Description
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

  /// Item's User & Location
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
