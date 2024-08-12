import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonWidth,
    this.backgroundColor,
    this.textStyle,
    this.padding,
  });

  final VoidCallback? onPressed;
  final double? buttonWidth;
  final Color? backgroundColor;
  final String text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Padding(
          padding: padding ?? context.paddings.verticalMedium1,
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
