import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';

customAlertDialog({
  required BuildContext context,
  required String message,
  String? title,
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
        title: Text(title ?? 'Emin misin?', style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
        content: Text(message, style: context.textStyles.titleMedium),
        actions: [
          TextButton(
            onPressed: () {
              route == null
                  ? Navigator.of(context).pop()
                  : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
            },
            child: Text(
              btnText ?? 'Vazgeç',
              style: context.textStyles.titleMedium.copyWith(color: AppColors.electricViolet),
            ),
          ),
          TextButton(
            onPressed: onPressed,
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
