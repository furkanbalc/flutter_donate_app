import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomClipPathContainer extends ConsumerStatefulWidget {
  const CustomClipPathContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.desc,
  });

  final String title;
  final String subTitle;
  final String desc;

  @override
  ConsumerState createState() => _CustomClipPathContainerState();
}

class _CustomClipPathContainerState
    extends ConsumerState<CustomClipPathContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HalfMoonClipper(),
      child: Container(
        color: AppColors.whiteColor.withOpacity(.99),
        width: MediaQuery.of(context).size.width,
        height: context.dynamicHeight(.45),
        child: Padding(
          padding: context.paddings.horizontalMedium2,
          child: _getTitleAndDescription(),
        ),
      ),
    );
  }

  /// Title And Description
  Widget _getTitleAndDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.title,
                style: context.textStyles.headlineSmall.copyWith(
                  color: AppColors.electricViolet,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                text: widget.subTitle,
                style: context.textStyles.headlineSmall.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        context.sizedBoxHeightLow3,
        Text(
          widget.desc,
          textAlign: TextAlign.center,
          style: context.textStyles.titleSmall.copyWith(
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}

class HalfMoonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.quadraticBezierTo(size.width / 2, size.height / 4, 0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
