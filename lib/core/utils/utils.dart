import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/utils/custom_animated_snackbar.dart';

class Utils {
  Utils._();

  static void successSnackBar({
    required BuildContext context,
    String? title,
    required String message,
    Function()? onTap,
  }) {
    _showAnimatedSnackbar(
      context: context,
      message: message,
      title: title,
      backgroundColor: Colors.green.withOpacity(.7),
      onTap: onTap,
    );
  }

  static void errorSnackBar({
    required BuildContext context,
    String? title,
    required String message,
    Function()? onTap,
  }) {
    _showAnimatedSnackbar(
      context: context,
      message: message,
      title: title,
      backgroundColor: Colors.red.withOpacity(.7),
      onTap: onTap,
    );
  }

  static void infoSnackBar({
    required BuildContext context,
    String? title,
    required String message,
    Function()? onTap,
  }) {
    _showAnimatedSnackbar(
      context: context,
      message: message,
      title: title,
      backgroundColor: Colors.orange.withOpacity(.7),
      onTap: onTap,
    );
  }

  static final List<OverlayEntry> _overlayEntries = [];

  static void _showAnimatedSnackbar({
    required BuildContext context,
    String? title,
    required String message,
    Function()? onTap,
    required Color backgroundColor,
  }) {
    /// Eğer bir snackbar zaten gösteriliyorsa, ilk snackbar'ı kaldır ve yeni snackbar'ı ekle
    if (_overlayEntries.isNotEmpty) {
      _overlayEntries.first.remove();
      _overlayEntries.clear();
    }
    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 8,
          right: 8,
          child: AnimatedSnackbar(
            title: title,
            message: message,
            onTap: onTap,
            backgroundColor: backgroundColor,
          ),
        );
      },
    );

    _hideSnackBar(context, overlayEntry);
  }

  static void _hideSnackBar(BuildContext context, OverlayEntry overlayEntry) {
    Overlay.of(context).insert(overlayEntry);
    _overlayEntries.add(overlayEntry);

    Future.delayed(const Duration(seconds: 4), () {
      overlayEntry.remove();
      _overlayEntries.remove(overlayEntry);
    });
  }
}
