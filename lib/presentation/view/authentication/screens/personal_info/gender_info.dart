import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/string_extension.dart';
import 'package:flutter_donate_app/core/extensions/widget_animated_navigation.dart';
import 'package:flutter_donate_app/presentation/view/authentication/screens/personal_info/age_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_bottom_button.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_header.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/personal_info/select_gender_widget.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/personal_info/user_info_appbar.dart';
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
      floatingActionButton: _getApplyButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          context.sizedBoxHeightMedium,

          /// Progress Bar
          const UserInfoAppBar(progressValue: 2 / 3),
          Expanded(
            child: Padding(
              padding: context.paddings.horizontalMedium,
              child: _buildBody(context: context),
            ),
          ),
        ],
      ),
    );
  }

  /// Apply Button
  AuthBottomButton _getApplyButton(BuildContext context) {
    return AuthBottomButton(
      onPressed: () {
        const AgeInfoView().slideTransitionReplace(context);
      },
    );
  }

  /// Body
  Widget _buildBody({required BuildContext context}) {
    return Column(
      children: [
        /// Gender Info Title
        AuthHeader(
          title: LocaleKeys.user_info_tell_us_about_yourself.tr(),
          subTitle: LocaleKeys.user_info_share_your_gender.tr(),
        ),
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
