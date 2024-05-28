import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/presentation/view/splash/widgets/custom_tab_page_selector.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_icon_button.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';

class CustomClipPathContainer extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HalfMoonClipper(),
      child: Container(
        color: AppColors.whiteColor.withOpacity(.99),
        width: MediaQuery.of(context).size.width,
        height: context.dynamicHeight(.45),
        child: Padding(
          padding: context.paddings.horizontalHigh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getTitleAndDescription(context),
              context.sizedBoxHeightNormal,
              const SizedBox(height: 50),
              _getNavigationWidget(),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigation Page Widget
  Widget _getNavigationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          onPressed: () {},
          icon: const Icon(AppIcons.kArrowLeft, color: AppColors.electricViolet, size: 28),
          border: Border.all(color: AppColors.electricViolet),
          shape: BoxShape.circle,
        ),
        const CustomTabPageSelector(selectedIndex: 1, tabLenght: 3),
        CustomIconButton(
          onPressed: () {},
          icon: const Icon(AppIcons.kArrowRight, color: AppColors.whiteColor, size: 28),
          border: Border.all(color: AppColors.electricViolet),
          shape: BoxShape.circle,
          backgroundColor: AppColors.electricViolet,
        ),
      ],
    );
  }

  /// Title And Description
  Widget _getTitleAndDescription(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: context.textStyles.headlineSmall.copyWith(
                  color: AppColors.electricViolet,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                text: subTitle,
                style: context.textStyles.headlineSmall.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Text(
          desc,
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

    // Draw the rectangle
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // Draw the half-moon shape (parantez) from the top center
    path.quadraticBezierTo(
      size.width / 2, size.height / 4, // Adjust the y value to lower the curve
      0, 0,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
