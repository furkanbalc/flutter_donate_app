import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/mixin/save_user_info_service.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/index.dart';
import 'package:flutter_donate_app/presentation/view/user_info/widgets/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgeInfoView extends ConsumerStatefulWidget {
  const AgeInfoView({super.key});

  @override
  ConsumerState createState() => _AgeInfoViewState();
}

class _AgeInfoViewState extends ConsumerState<AgeInfoView> with SaveUserInfoService {
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
        CustomLinearProgressBar(userInfoViewModel: _userInfoViewModel),

        /// Age Info Title
        AuthHeader(
          title: LocaleKeys.user_info_how_old_are_you.tr(),
          subTitle: LocaleKeys.user_info_share_your_age.tr(),
        ),
        context.sizedBoxHeightMedium1,

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
        _userInfoViewModel.age = value + 18;
      },
      childCount: 73,
      itemBuilder: (context, index) {
        var age = index + 18;
        return Center(
          child: Text(
            age.toString(),
            style: TextStyle(
              fontSize: _userInfoViewModel.age == index + 18 ? 65 : 60,
              fontWeight: _userInfoViewModel.age == index + 18 ? FontWeight.bold : FontWeight.w800,
              color: _userInfoViewModel.age == index + 18 ? AppColors.electricViolet : null,
            ),
          ),
        );
      },
    );
  }

  /// Apply Button
  Widget _buildApplyButton() {
    return AuthBottomButton(
      onPressed: _userInfoViewModel.age != 18 ? () => saveInfoProcess(userInfoViewModel: _userInfoViewModel) : null,
    );
  }
}
