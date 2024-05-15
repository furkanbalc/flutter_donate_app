import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
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
  int selectedAge = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserInfoAppBar(progressValue: 3 / 3),
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// User Info Title
        AuthHeader(
          title: LocaleKeys.user_info_how_old_are_you.tr(),
          subTitle: LocaleKeys.user_info_share_your_age.tr(),
        ),
        context.sizedBoxHeightMedium,
        SizedBox(
          width: 100,
          height: 400,
          child: CupertinoPicker(
            squeeze: 1.5,
            looping: true,
            selectionOverlay: Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                horizontal: BorderSide(color: AppColors.electricViolet, width: 5),
              )),
            ),
            itemExtent: 80,
            onSelectedItemChanged: (index) {
              setState(() {
                selectedAge = index + 18; // Seçilen yaş, 18'den başlayacak şekilde ayarlanır
              });
            },
            children: List.generate(
              60 - 18 + 1, // 18'den 60'a kadar olan yaşları oluştur
              (index) => Center(
                child: Text(
                  (index + 18).toString(),
                  style: selectedAge == index + 18
                      ? context.textStyles.displayLarge.copyWith(fontWeight: FontWeight.bold, fontSize: 75)
                      : context.textStyles.displayLarge.copyWith(fontSize: 60, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
