import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter/material.dart';

class AuthTextRichButton extends StatelessWidget {
  const AuthTextRichButton({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  final String text;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashFactory: NoSplash.splashFactory,
      highlightColor: AppColors.transparentColor,
      child: Text.rich(
        textAlign: TextAlign.center,

        /// Button Description
        TextSpan(
          text: text,
          children: [
            /// Button Label
            TextSpan(
              text: buttonText,
              style: context.textStyles.titleSmall.copyWith(
                color: AppColors.electricViolet,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.electricViolet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
