import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:go_router/go_router.dart';

Future<void> showBackDialog({
  required BuildContext context,
  String? message,
  String? title,
  VoidCallback? cancelPress,
  String? cancelText,
  VoidCallback? continuePress,
  String? continueText,
}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.whiteColor,
        title: Text(title ?? 'Kaydedilmeyen değişiklikler var!'),
        titleTextStyle: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: context.borders.circularBorderRadiusMedium),
        content: Text(message ?? 'Geri gidersen değişiklikleri kaybedebilirsin.'),
        actions: [
          TextButton(
            onPressed: cancelPress ??
                () {
                  context.pop();
                },
            child: Text(cancelText ?? 'İptal Et'),
          ),
          TextButton(
            onPressed: continuePress,
            child: Text(continueText ?? 'Devam Et'),
          ),
        ],
      );
    },
  );
}
