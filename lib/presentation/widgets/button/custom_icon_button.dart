import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.border,
    this.icon,
    this.shape,
    this.borderRadius,
    this.padding,
  });

  final VoidCallback? onPressed;
  final Widget? icon;
  final Color? backgroundColor;
  final BoxBorder? border;
  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: context.paddings.zero,
      onPressed: onPressed,
      icon: Container(
        margin: context.paddings.zero,
        padding: padding ?? context.paddings.allLow,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          color: backgroundColor,
          borderRadius: borderRadius,
          border: border,
        ),
        child: icon,
      ),
    );
  }
}
