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

class _HorizontalProductCartState extends State<HorizontalProductCart> with ProductCardComponents {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      margin: context.paddings.zero,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: context.borders.radiusNormal,
              bottomLeft: context.borders.radiusNormal,
            ),
            child: Stack(
              children: [
                CustomImageWidget(
                  image: AppPng.sofa.toPng,
                  fit: BoxFit.cover,
                  width: context.dynamicWidth(.35),
                  height: context.dynamicHeight(.17),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: buildFavoriteIcon(context),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: context.paddings.allNormal,
              child: Column(
                children: [
                  buildTags(context, ['Bağış', 'Yeni Gibi', 'Mobilya']),
                  context.sizedBoxHeightLow,
                  buildItemDetails(
                    context: context,
                    title: 'Koltuk',
                    description: 'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit, sed do dolor sit amet',
                    rating: '4.9',
                  ),
                   Divider(color: AppColors.electricViolet.withOpacity(.1)),
                  buildUserInfo(context, 'Kullanıcı Adı', '9.4 km'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
