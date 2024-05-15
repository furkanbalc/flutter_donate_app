import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/core/extensions/string_extension.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_bottom_button.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_header.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/personal_info/user_info_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_svg_widget.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

class GenderInfoView extends StatefulWidget {
  const GenderInfoView({super.key});

  @override
  State<GenderInfoView> createState() => _GenderInfoViewState();
}

class _GenderInfoViewState extends State<GenderInfoView> {
  bool isMan = false;
  bool isWoman = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserInfoAppBar(progressValue: 2 / 3),
      floatingActionButton: AuthBottomButton(
        onPressed: () {},
        text: LocaleKeys.user_info_apply_and_continue.tr(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: context.paddings.horizontalMedium,
        child: _buildBody(context: context),
      ),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return Column(
      children: [
        /// Gender Info Title
        AuthHeader(
          title: LocaleKeys.user_info_tell_us_about_yourself.tr(),
          subTitle: LocaleKeys.user_info_share_your_gender.tr(),
        ),
        context.sizedBoxHeightCustom,
        context.sizedBoxHeightCustom,
        Expanded(
          child: Padding(
            padding: context.paddings.onlyBottomUltra,
            child: Column(
              children: [
                SelectGenderWidget(
                  gender: 'Erkek',
                  svg: AppAssets.man.toSvg,
                  onTap: () {
                    setState(() {
                      if (isWoman) {
                        isMan = true;
                        isWoman = false;
                      } else {
                        isMan = true;
                      }
                    });
                  },
                  isSelect: isMan,
                ),
                context.sizedBoxHeightCustom,
                SelectGenderWidget(
                  gender: 'Kadın',
                  svg: AppAssets.woman.toSvg,
                  onTap: () {
                    setState(() {
                      if (isMan) {
                        isWoman = true;
                        isMan = false;
                      } else {
                        isWoman = true;
                      }
                    });
                  },
                  isSelect: isWoman,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({
    super.key,
    required this.gender,
    required this.svg,
    this.isSelect = false,
    required this.onTap,
  });

  final String gender;
  final String svg;
  final bool isSelect;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: AppColors.transparentColor,
      splashFactory: NoSplash.splashFactory,
      child: CircleAvatar(
        maxRadius: context.dynamicWidth(.25),
        backgroundColor: isSelect ? AppColors.electricViolet : AppColors.greyLighter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgWidget(
              svg: svg,
              width: context.dynamicWidth(.3),
              color: isSelect ? null : AppColors.blackColor,
            ),
            Text(
              gender,
              style: context.textStyles.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelect ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
