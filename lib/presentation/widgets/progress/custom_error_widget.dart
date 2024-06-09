import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/enums/app_lottie.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_text_button.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_lottie_widget.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 200,
            child: CustomLottieWidget(
              lottie: AppLotties.error.toLottie,
            ),
          ),
          Column(
            children: [
              const Text('Veriler Çekilirken Bir Hata Oluştu'),
              CustomTextButton(
                onPressed: onPressed,
                text: 'Tekrar Dene',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
