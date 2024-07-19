import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/app_svg.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';

mixin ProductCardComponents {
  /// Item Cart Rating Icon & Count
  Widget buildRatingBadge(BuildContext context, String rating) {
    return Row(
      children: [
        Icon(Icons.star_rounded, color: AppColors.orangeColor, size: context.dynamicWidth(.04)),
        Text(
          '($rating)',
          style: context.textStyles.bodySmall.copyWith(color: AppColors.steel),
        ),
      ],
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
      child:  Icon(AppIcons.kFavouriteIcon, color: AppColors.redColor, size: context.dynamicWidth(.06)),
    );
  }

  /// Category & Item Type & Item Status Tag
  Widget buildTags(BuildContext context, List<String> tags) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(3, (index) {
        Color backgroundColor;
        switch (index) {
          case 0:
            backgroundColor = AppColors.electricViolet.withOpacity(.1);
            break;
          case 1:
            backgroundColor = AppColors.greenColor.withOpacity(.2);
            break;
          case 2:
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
          child: Text(tags[index], style: context.textStyles.labelSmall.copyWith(color: AppColors.steel)),
        );
      },));
  }

  /// Item Title & Description
  Widget buildItemDetails({
    required BuildContext context,
    required String title,
    required String description,
    required String rating,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w600)),
            buildRatingBadge(context, rating)
          ],
        ),
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
              decoration: const BoxDecoration(
                color: AppColors.cascadingWhite,
                shape: BoxShape.circle,
              ),
              child: CustomSvgWidget(svg: AppSvg.profile.toSvg, width: 16),
            ),
            context.sizedBoxWidthLow,
            Text(username, style: context.textStyles.bodySmall.copyWith(color: AppColors.steel)),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.cascadingWhite,
                shape: BoxShape.circle,
              ),
              child: const Icon(AppIcons.kLocationOutlinedIcon, color: AppColors.electricViolet, size: 16),
            ),
            context.sizedBoxWidthLow,
            Text(distance, style: context.textStyles.bodySmall.copyWith(color: AppColors.steel)),
          ],
        ),
      ],
    );
  }
}
