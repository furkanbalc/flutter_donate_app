import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_elevated_button.dart';

class AuthBottomButton extends StatelessWidget {
  const AuthBottomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddings.allMedium,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: CustomElevatedButton(
        onPressed: onPressed,
        text: text,
      ),
    );
  }
}
