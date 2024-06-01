import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgWidget extends StatelessWidget {
  const CustomSvgWidget({
    super.key,
    required this.svg,
    this.fit,
    this.width,
    this.height,
    this.color,
  });

  final String svg;
  final BoxFit? fit;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      colorFilter:  color !=null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
