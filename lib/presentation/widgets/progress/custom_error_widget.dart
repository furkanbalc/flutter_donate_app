import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/enums/app_lottie.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_text_button.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_lottie_widget.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLottieWidget(
          lottie: AppLotties.error.toLottie,
          width: context.dynamicWidth(),
        ),
        const Text('Veriler Çekilirken Bir Hata Oluştu'),
        CustomTextButton(
          onPressed: onPressed,
          text: 'Tekrar Dene',
        ),
      ],
    );
  }
}
