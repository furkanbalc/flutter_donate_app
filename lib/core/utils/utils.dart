import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:toastification/toastification.dart';

class Utils {
  Utils._();

  static void _showSnackBar({
    required BuildContext context,
    String? title,
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: (Durations.extralong4) * 4,
      title: title != null
          ? Text(title,
              style: context.textStyles.titleMedium.copyWith(
                fontWeight: FontWeight.w800,
              ))
          : null,
      description: Text(message,
          style: context.textStyles.titleMedium.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          )),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: Durations.medium2,
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: kAlwaysCompleteAnimation,
          child: child,
        );
      },
      icon: Icon(icon),
      primaryColor: backgroundColor,
      foregroundColor: Colors.black,
      closeButtonShowType: CloseButtonShowType.always,
      closeOnClick: true,
      dragToClose: true,
      showProgressBar: false,
    );
  }

  static void successSnackBar({
    required BuildContext context,
    String? title,
    required String message,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      title: title,
      backgroundColor: AppColors.success,
      icon: AppIcons.kTickIcon,
    );
  }

  static void errorSnackBar({
    required BuildContext context,
    String? title,
    required String message,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      title: title,
      backgroundColor: AppColors.error,
      icon: AppIcons.kRemoveIcon,
    );
  }

  static void infoSnackBar({
    required BuildContext context,
    String? title,
    required String message,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      title: title,
      backgroundColor: AppColors.info,
      icon: AppIcons.kInfoIcon,
    );
  }
//
// static final List<OverlayEntry> _overlayEntries = [];
//
// static void _showAnimatedSnackbar({
//   required BuildContext context,
//   String? title,
//   required String message,
//   Function()? onTap,
//   required Color backgroundColor,
// }) {
//   /// Eğer bir snackbar zaten gösteriliyorsa, ilk snackbar'ı kaldır ve yeni snackbar'ı ekle
//   if (_overlayEntries.isNotEmpty) {
//     _overlayEntries.first.remove();
//     _overlayEntries.clear();
//   }
//   final overlayEntry = OverlayEntry(
//     builder: (context) {
//       return Positioned(
//         left: 8,
//         right: 8,
//         child: AnimatedSnackbar(
//           title: title,
//           message: message,
//           onTap: onTap,
//           backgroundColor: backgroundColor,
//         ),
//       );
//     },
//   );
//
//   _hideSnackBar(context, overlayEntry);
// }
//
// static void _hideSnackBar(BuildContext context, OverlayEntry overlayEntry) {
//   Overlay.of(context).insert(overlayEntry);
//   _overlayEntries.add(overlayEntry);
//
//   Future.delayed(const Duration(seconds: 4), () {
//     overlayEntry.remove();
//     _overlayEntries.remove(overlayEntry);
//   });
// }
}
