import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_bottom_button.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_header.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/personal_info/user_info_appbar.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

class AgeInfoView extends StatefulWidget {
  const AgeInfoView({super.key});

  @override
  State<AgeInfoView> createState() => _AgeInfoViewState();
}

class _AgeInfoViewState extends State<AgeInfoView> {
  int selectedAge = 18; // Varsayılan yaş 18

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildApplyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          context.sizedBoxHeightMedium,

          /// Progress Bar
          const UserInfoAppBar(progressValue: 2 / 3),
          context.sizedBoxHeightMedium,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildBody(context),
          ),
        ],
      ),
    );
  }

  /// Apply Button
  Widget _buildApplyButton() {
    return AuthBottomButton(
      onPressed: () {
        // Kayıt işlemleri burada gerçekleştirilir
      },
    );
  }

  /// Body
  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// Age Info Title
        AuthHeader(
          title: LocaleKeys.user_info_how_old_are_you.tr(),
          subTitle: LocaleKeys.user_info_share_your_age.tr(),
        ),
        context.sizedBoxHeightMedium,

        /// Age Select Picker
        SizedBox(
          height: 320,
          child: CupertinoPicker.builder(
            squeeze: 1.5,
            itemExtent: 80,
            onSelectedItemChanged: (index) {
              setState(() {
                selectedAge = index + 18;
              });
            },
            childCount: 43,
            itemBuilder: (context, index) {
              final age = index + 18;
              return Center(
                child: Text(
                  age.toString(),
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: selectedAge == age ? FontWeight.bold : FontWeight.w800,
                    color: selectedAge == age ? AppColors.electricViolet : null,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
