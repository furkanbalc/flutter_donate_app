import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottieWidget extends StatelessWidget {
  const CustomLottieWidget({
    super.key,
    required this.lottie,
    this.boxFit,
    this.height,
    this.width,
  });
  final String lottie;
  final BoxFit? boxFit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        lottie,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.cover,
      ),
    );
  }
}
