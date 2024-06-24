import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/enums/app_png.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/product_card_components.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';

class HorizontalProductCart extends StatefulWidget {
  const HorizontalProductCart({super.key});

  @override
  State<HorizontalProductCart> createState() => _HorizontalProductCartState();
}

class _HorizontalProductCartState extends State<HorizontalProductCart>
    with ProductCardComponents {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                    CustomImageWidget(
                        image: AppPng.sofa.toPng,
                        fit: BoxFit.cover,
                        height: context.dynamicHeight(.20)),
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
    );
  }
}
