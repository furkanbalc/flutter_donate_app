
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';

customAlertDialog({
  required BuildContext context,
  required String message,
  String? btnText,
  Widget? route,
  VoidCallback? onPressed,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: context.borders.circularBorderRadiusHigh),
        content: Text(message, style: context.textStyles.titleMedium),
        actions: [
          TextButton(
            onPressed: () {
              route == null
                  ? Navigator.of(context).pop()
                  : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
            },
            child: Text(
              btnText ?? 'Devam Et',
              style: context.textStyles.titleMedium.copyWith(color: AppColors.electricViolet),
            ),
          ),
        ],
      );
    },
  );
}
