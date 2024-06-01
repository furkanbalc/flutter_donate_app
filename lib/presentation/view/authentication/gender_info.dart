import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/authentication/age_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_body.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_bottom_button.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_header.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/personal_info/custom_linear_progress_bar.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/personal_info/select_gender_widget.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GenderInfoView extends ConsumerStatefulWidget {
  const GenderInfoView({super.key});

  @override
  ConsumerState createState() => _GenderInfoViewState();
}

class _GenderInfoViewState extends ConsumerState<GenderInfoView> {
  late PersonalInfoViewModel _personalInfoViewModel;

  @override
  void initState() {
    _personalInfoViewModel = ref.read(personalInfoViewModelImp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _personalInfoViewModel = ref.watch(personalInfoViewModelImp);
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
        CustomLinearProgressBar(personalInfoViewModel: _personalInfoViewModel),

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
              SelectGenderWidget(
                gender: 'Erkek',
                svg: AppAssets.man.toSvg,
                onTap: () {
                  _personalInfoViewModel.gender = 'Erkek';
                },
                isSelect: _personalInfoViewModel.gender == 'Erkek',
              ),
              context.sizedBoxHeightCustom,
              SelectGenderWidget(
                gender: 'Kadın',
                svg: AppAssets.woman.toSvg,
                onTap: () {
                  _personalInfoViewModel.gender = 'Kadın';
                },
                isSelect: _personalInfoViewModel.gender == 'Kadın',
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Apply Button
  AuthBottomButton _getApplyButton(BuildContext context) {
    return AuthBottomButton(
      onPressed: _personalInfoViewModel.gender.isNotEmpty
          ? () {
              _personalInfoViewModel.endProgress = 2 / 3;
              Future.delayed(Durations.extralong4).then((value) {
                context.goNamed(AppRouteName.ageInfo.name);
              });
            }
          : null,
    );
  }
}
