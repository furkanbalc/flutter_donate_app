import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/firebase_service/save_user_info_service.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_body.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_bottom_button.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_header.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/personal_info/custom_linear_progress_bar.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgeInfoView extends ConsumerStatefulWidget {
  const AgeInfoView({super.key});

  @override
  ConsumerState createState() => _AgeInfoViewState();
}

class _AgeInfoViewState extends ConsumerState<AgeInfoView> with SaveUserInfoService {
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
      floatingActionButton: _buildApplyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: AuthBody(child: _buildBody(context)),
    );
  }

  /// Body
  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// Linear Progress Bar
        CustomLinearProgressBar(personalInfoViewModel: _personalInfoViewModel),

        /// Age Info Title
        AuthHeader(
          title: LocaleKeys.user_info_how_old_are_you.tr(),
          subTitle: LocaleKeys.user_info_share_your_age.tr(),
        ),
        context.sizedBoxHeightMedium,

        /// Age Select Picker
        SizedBox(
          height: context.dynamicHeight(.6),
          child: _buildAgeSelectPicker(),
        ),
      ],
    );
  }

  /// Age Select Picker
  Widget _buildAgeSelectPicker() {
    return CupertinoPicker.builder(
      squeeze: 1.5,
      itemExtent: 80,
      onSelectedItemChanged: (value) {
        _personalInfoViewModel.age = value + 18;
      },
      childCount: 73,
      itemBuilder: (context, index) {
        var age = index + 18;
        return Center(
          child: Text(
            age.toString(),
            style: TextStyle(
              fontSize: _personalInfoViewModel.age == index + 18 ? 65 : 60,
              fontWeight: _personalInfoViewModel.age == index + 18 ? FontWeight.bold : FontWeight.w800,
              color: _personalInfoViewModel.age == index + 18 ? AppColors.electricViolet : null,
            ),
          ),
        );
      },
    );
  }

  /// Apply Button
  Widget _buildApplyButton() {
    return AuthBottomButton(
      onPressed: _personalInfoViewModel.age != 18
          ? () => saveInfoProcess(personalInfoViewModel: _personalInfoViewModel)
          : null,
    );
  }
}
