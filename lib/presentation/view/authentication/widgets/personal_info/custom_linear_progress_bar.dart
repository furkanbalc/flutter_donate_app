import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';

class CustomLinearProgressBar extends StatelessWidget {

  const CustomLinearProgressBar({super.key, required this.personalInfoViewModel});

  final PersonalInfoViewModel personalInfoViewModel;


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
          begin: personalInfoViewModel.beginProgress,
          end: personalInfoViewModel.endProgress,
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
