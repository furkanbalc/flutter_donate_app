import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_icon_button.dart';

class ImagePickerIcon extends StatelessWidget {
  const ImagePickerIcon({
    super.key,
    this.onTap,
    required this.icon,
    required this.text,
  });
  final VoidCallback? onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          onPressed: onTap,
          icon: Icon(icon, color: AppColors.electricViolet),
          shape: BoxShape.circle,
          border: Border.all(
              color: AppColors.electricViolet.withOpacity(.5), width: 2),
        ),
        context.sizedBoxHeightLow,
        Text(text, style: const TextStyle(color: AppColors.greyPrimary)),
      ],
    );
  }
}
