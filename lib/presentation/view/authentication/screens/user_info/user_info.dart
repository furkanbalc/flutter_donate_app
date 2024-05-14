import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/core/extensions/string_extension.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_bottom_button.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_header.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/user_info/user_info_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter_donate_app/presentation/widgets/container/profile_photo_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_svg_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/input/custom_intl_form_number.dart';
import 'package:flutter_donate_app/presentation/widgets/input/custom_text_form_field.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

part '../../widgets/user_info/user_info_form_widget.dart';

part 'gender_info.dart';

part 'age_info.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  final double _progressValue = 3 / 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserInfoAppBar(
        progressValue: _progressValue,
        onBack: () {},
      ),
      body: Padding(
        padding: context.paddings.horizontalMedium,
        // child: _buildBody(context: context),
        child: AgeInfoView(),
      ),
      floatingActionButton: AuthBottomButton(
        onPressed: () {},
        text: LocaleKeys.user_info_apply_and_continue.tr(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return Column(
      children: [
        /// User Info Title
        AuthHeader(
          title: LocaleKeys.user_info_complete_your_profile.tr(),
          subTitle: LocaleKeys.auth_fill_your_info.tr(),
        ),
        context.sizedBoxHeightMedium,

        /// Add Profile Photo
        ProfilePhotoWidget(
          onTap: () {},
        ),

        /// User Info Forms
        const UserInfoFormWidget(),
      ],
    );
  }
}
