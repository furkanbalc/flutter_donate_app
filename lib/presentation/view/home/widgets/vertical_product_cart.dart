import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/domain/entities/product/product_entity.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/product_card_components.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_image_widget.dart';

class VerticalProductCard extends StatefulWidget {
  const VerticalProductCard({
    super.key,
    required this.product,
    required this.productType,
    required this.productStatus,
    required this.productCategory,
  });

  final ProductEntity product;
  final String productType;
  final String productStatus;
  final String productCategory;

  @override
  State<VerticalProductCard> createState() => _VerticalProductCardState();
}

class _VerticalProductCardState extends State<VerticalProductCard> with ProductCardComponents {
  @override
  Widget build(BuildContext context) {
    var data = widget.product;
    return Card(
      margin: context.paddings.zero,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: context.borders.radiusNormal),
            child: Stack(
              children: [
                CustomImageWidget(image: AppPng.sofa.toPng, fit: BoxFit.cover),
                Positioned(
                  right: 10,
                  top: 10,
                  child: buildFavoriteIcon(context),
                ),
              ],
            ),
          ),
          Padding(
            padding: context.paddings.allNormal,
            child: Column(
              children: [
                buildTags(context, [
                  widget.productType,
                  widget.productStatus,
                  widget.productCategory,
                ]),
                context.sizedBoxHeightLow,
                buildItemDetails(
                  context: context,
                  title: data.title!,
                  description: data.description!,
                  rating: data.rating!,
                ),
                context.sizedBoxHeightMin,
                Divider(color: AppColors.electricViolet.withOpacity(.1)),
                context.sizedBoxHeightMin,
                buildUserInfo(context, 'Kullanıcı Adı', '9.4 km'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
