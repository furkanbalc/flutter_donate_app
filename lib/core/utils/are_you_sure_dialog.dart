import 'package:flutter/material.dart';

Future<void> showBackDialog({
  required BuildContext context,
  VoidCallback? cancelPress,
  VoidCallback? continuePress,
}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Emin misin?'),
        content: const Text('Kaydedilmeyen değişiklikler var'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: cancelPress ?? () {
              Navigator.pop(context, false);
            },
            child: const Text('İptal Et'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: continuePress,
            child: const Text('Devam Et'),
          ),
        ],
      );
    },
  );
}
