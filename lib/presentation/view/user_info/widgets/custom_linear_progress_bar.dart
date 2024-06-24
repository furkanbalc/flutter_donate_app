import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';

class CustomLinearProgressBar extends StatelessWidget {
  const CustomLinearProgressBar({super.key, required this.userInfoViewModel});

  final UserInfoViewModel userInfoViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getAppBarHeight(),
      padding: context.paddings.verticalMedium,
      color: AppColors.transparentColor,
      child: TweenAnimationBuilder<double>(
        duration: Durations.long4,
        curve: Curves.easeInOut,
        tween: Tween<double>(
          begin: userInfoViewModel.beginProgress,
          end: userInfoViewModel.endProgress,
        ),
        builder: (context, value, _) => LinearProgressIndicator(
          color: AppColors.electricViolet,
          value: value,
          borderRadius: context.borders.circularBorderRadiusMedium,
        ),
      ),
    );
  }
}
