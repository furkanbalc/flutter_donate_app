import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/view/app/widgets/home/product_card_components.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_image_widget.dart';

class VerticalProductCard extends StatefulWidget {
  const VerticalProductCard({super.key});

  @override
  State<VerticalProductCard> createState() => _VerticalProductCardState();
}

class _VerticalProductCardState extends State<VerticalProductCard> with ProductCardComponents{
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
