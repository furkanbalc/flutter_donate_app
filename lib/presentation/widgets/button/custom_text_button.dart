import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.decoration,
    this.color,
    this.fontSize,
  });

  final TextDecoration? decoration;
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: context.textStyles.titleMedium.copyWith(
          color: color ?? AppColors.electricViolet,
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
          decoration: decoration,
        ),
      ),
    );
  }
}
