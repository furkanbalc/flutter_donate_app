import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    required this.image,
    this.fit,
    this.width,
    this.height,
    this.color,
  });

  final String image;
  final BoxFit? fit;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      color: color,
    );
  }
}
