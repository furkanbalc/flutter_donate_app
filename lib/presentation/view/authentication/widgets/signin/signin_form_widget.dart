import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_text_button.dart';
import 'package:flutter_donate_app/presentation/widgets/input/custom_text_form_field.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

class SigninFormWidget extends StatefulWidget {
  const SigninFormWidget({super.key});

  @override
  State<SigninFormWidget> createState() => _SigninFormWidgetState();
}

class _SigninFormWidgetState extends State<SigninFormWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  bool passObscure = true;
  void _togglePassObscure() {
    setState(() {
      passObscure = !passObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.verticalNormal,
      /// Signin Forms
      child: _buildForms(context),
    );
  }
  /// Signin Forms
  Widget _buildForms(BuildContext context) {
    return Column(
      children: [
        /// Email Field
        CustomTextFormField(
          controller: _emailController,
          labelText: LocaleKeys.form_fields_email.tr(),
          hintText: LocaleKeys.form_fields_email.tr(),
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
        ),
        context.sizedBoxHeightMedium,

        /// Password Field
        CustomTextFormField(
          controller: _passController,
          labelText: LocaleKeys.form_fields_password.tr(),
          hintText: LocaleKeys.form_fields_password.tr(),
          suffixIcon: passObscure ? AppIcons.kVisibility : AppIcons.kVisibilityOff,
          suffixOnPressed: _togglePassObscure,
          keyboardType: TextInputType.text,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
          obscureText: passObscure,
        ),
        context.sizedBoxHeightLow,

        /// Forgot Password Button
        Align(
          alignment: Alignment.centerRight,
          child: CustomTextButton(
            // onPressed: () => const ForgotPassword().slideTransitionPush(context: context),
            onPressed: () {},
            text: LocaleKeys.auth_forgot_password.tr(),
            fontSize: 14,
          ),
        ),
        context.sizedBoxHeightCustom,

        /// Signin Button
        CustomElevatedButton(
          onPressed: () {

          },
          text: LocaleKeys.auth_signin.tr(),
        ),
      ],
    );
  }
}
