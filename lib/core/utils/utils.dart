import 'package:flutter/material.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_loading_widget.dart';

class Utils {
  Utils._();

  static errorSnackBar({required String mesaj, required BuildContext context, Function()? function}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 10,
            shadowColor: Colors.red.shade600,
            child: GestureDetector(
              onTap: function,
              child: Container(
                height: 80,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.red.shade600, borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: Text(
                  mesaj,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      );
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
  }

  static successSnackBar({required String mesaj, required BuildContext context, Function()? function}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 10,
            shadowColor: Colors.green.shade600,
            child: GestureDetector(
              onTap: function,
              child: Container(
                height: 80,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.green.shade600, borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: Text(
                  mesaj,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      );
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
  }

  static infoSnackBar({required String mesaj, required BuildContext context, Function()? function}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 10,
            shadowColor: Colors.brown.shade900,
            child: GestureDetector(
              onTap: function,
              child: Container(
                height: 80,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.brown.shade900, borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: Text(
                  mesaj,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      );
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
  }

  static showLoadingDialog({
    required BuildContext context,
  }) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Dialog.fullscreen(
          backgroundColor: Colors.transparent,
          child: CustomLoadingWidget(),
        );
      },
    );
  }
}
