import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_image_widget.dart';

class AutoPageSlider extends StatelessWidget {
  AutoPageSlider({super.key});

  final List<String> _items = [
    AppAssets.img1.toPng,
    AppAssets.img2.toPng,
    AppAssets.img3.toPng,
    AppAssets.img4.toPng,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: _items.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: context.paddings.allNormal + context.paddings.onlyTopLow,
          child: ClipRRect(
            borderRadius: context.borders.circularBorderRadiusLow,
            child: CustomImageWidget(
              width: context.dynamicWidth(),
              image: _items[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2 / 1,
        viewportFraction: 1,
      ),
    );
  }
}