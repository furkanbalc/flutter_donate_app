import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Title
        Text(
          title,
          style: context.textStyles.headlineMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        context.sizedBoxHeightMedium,

        /// SubTitle
        Padding(
          padding: context.paddings.horizontalUltra,
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: context.textStyles.titleSmall,
          ),
        ),
      ],
    );
  }
}
