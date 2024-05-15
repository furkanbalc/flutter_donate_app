import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/widget_animated_navigation.dart';
import 'package:flutter_donate_app/presentation/view/authentication/screens/personal_info/gender_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_bottom_button.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_header.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/personal_info/user_info_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/container/profile_photo_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/input/custom_intl_form_number.dart';
import 'package:flutter_donate_app/presentation/widgets/input/custom_text_form_field.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    _formKey = GlobalKey();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: _getApplyButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          context.sizedBoxHeightMedium,

          /// Progress Bar
          const UserInfoAppBar(progressValue: 1 / 3),
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
        const GenderInfoView().slideTransitionReplace(context);
      },
    );
  }

  /// Body
  Widget _buildBody({required BuildContext context}) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// User Info Title
            AuthHeader(
              title: LocaleKeys.user_info_complete_your_profile.tr(),
              subTitle: LocaleKeys.auth_fill_your_info.tr(),
            ),
            context.sizedBoxHeightHigh,

            /// Add Profile Photo
            ProfilePhotoWidget(
              onTap: () {},
            ),
            context.sizedBoxHeightHigh,

            /// User Info Forms
            _getFormFields(),
          ],
        ),
      ),
    );
  }

  /// Form Fields
  Widget _getFormFields() {
    return Column(
      children: [
        Row(
          children: [
            /// Name Field
            Expanded(
              child: CustomTextFormField(
                controller: _nameController,
                labelText: LocaleKeys.form_fields_name.tr(),
                hintText: LocaleKeys.form_fields_name.tr(),
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.username],
                textInputAction: TextInputAction.next,
              ),
            ),
            context.sizedBoxWidthLow,

            /// Surname Field
            Expanded(
              child: CustomTextFormField(
                controller: _surnameController,
                labelText: LocaleKeys.form_fields_surname.tr(),
                hintText: LocaleKeys.form_fields_surname.tr(),
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.username],
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              ),
            ),
          ],
        ),
        context.sizedBoxHeightHigh,

        /// Phone Number Field
        CustomIntlPhoneNumberInput(
          controller: _phoneNumberController,
        ),
      ],
    );
  }
}
