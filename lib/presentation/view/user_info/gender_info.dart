import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/index.dart';
import 'package:flutter_donate_app/presentation/view/user_info/widgets/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GenderInfoView extends ConsumerStatefulWidget {
  const GenderInfoView({super.key});

  @override
  ConsumerState createState() => _GenderInfoViewState();
}

class _GenderInfoViewState extends ConsumerState<GenderInfoView> {
  late UserInfoViewModel _userInfoViewModel;

  @override
  void initState() {
    _userInfoViewModel = ref.read(personalInfoViewModelImp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _userInfoViewModel = ref.watch(personalInfoViewModelImp);
    return Scaffold(
      floatingActionButton: _getApplyButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: AuthBody(child: _buildBody(context: context)),
    );
  }

  /// Body
  Widget _buildBody({required BuildContext context}) {
    return Column(
      children: [
        /// Linear Progress Bar
        CustomLinearProgressBar(userInfoViewModel: _userInfoViewModel),

        /// Gender Info Title
        AuthHeader(
          title: LocaleKeys.user_info_tell_us_about_yourself.tr(),
          subTitle: LocaleKeys.user_info_share_your_gender.tr(),
        ),
        context.sizedBoxHeightCustom,
        Padding(
          padding: context.paddings.onlyBottomUltra,
          child: Column(
            children: [
              _buildManButton(),
              context.sizedBoxHeightCustom,
              _buildWomanButton(),
            ],
          ),
        ),
      ],
    );
  }

  /// Woman Button
  Widget _buildWomanButton() {
    return SelectGenderWidget(
      gender: LocaleKeys.user_info_woman.tr(),
      svg: AppSvg.woman.toSvg,
      onTap: () {
        _userInfoViewModel.gender = LocaleKeys.user_info_woman.tr();
      },
      isSelect: _userInfoViewModel.gender == LocaleKeys.user_info_woman.tr(),
    );
  }

  /// Man Button
  Widget _buildManButton() {
    return SelectGenderWidget(
      gender: LocaleKeys.user_info_man.tr(),
      svg: AppSvg.man.toSvg,
      onTap: () {
        _userInfoViewModel.gender = LocaleKeys.user_info_man.tr();
      },
      isSelect: _userInfoViewModel.gender == LocaleKeys.user_info_man.tr(),
    );
  }

  /// Apply Button
  Widget _getApplyButton(BuildContext context) {
    return AuthBottomButton(
      onPressed: _userInfoViewModel.gender.isNotEmpty
          ? () {
              _userInfoViewModel.endProgress = 2 / 3;
              Future.delayed(Durations.extralong4).then((value) {
                context.goNamed(AppRouteName.ageInfo.name);
              });
            }
          : null,
    );
  }
}
