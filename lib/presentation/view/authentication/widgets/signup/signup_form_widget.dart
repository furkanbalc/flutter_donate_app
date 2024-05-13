part of '../../screens/signup.dart';


class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  late final TextEditingController _confirmPassController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _confirmPassController = TextEditingController();
    super.initState();
  }

  bool isCheck = false;
  bool passObscure = true;
  bool confirmPassObscure = true;

  void _togglePassObscure() {
    setState(() {
      passObscure = !passObscure;
    });
  }

  void _toggleConfirmPassObscure() {
    setState(() {
      confirmPassObscure = !confirmPassObscure;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.verticalNormal,

      /// Signup Forms
      child: _buildForms(context),
    );
  }

  /// Signup Forms
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
          onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        ),
        context.sizedBoxHeightMedium,

        /// Confirm Password Field
        CustomTextFormField(
          controller: _confirmPassController,
          labelText: LocaleKeys.form_fields_confirm_password.tr(),
          hintText: LocaleKeys.form_fields_confirm_password.tr(),
          suffixIcon: confirmPassObscure ? AppIcons.kVisibility : AppIcons.kVisibilityOff,
          suffixOnPressed: _toggleConfirmPassObscure,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.done,
          obscureText: confirmPassObscure,
        ),
        context.sizedBoxHeightMedium,

        /// Terms and Conditions
        CheckboxListTile(
          contentPadding: context.paddings.zero,
          title: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: 'Kayıt koşullarını',
              style: context.textStyles.titleSmall.copyWith(
                color: AppColors.electricViolet,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.electricViolet,
              ),
              children: [
                TextSpan(
                  text: 'okudum, kabul ediyorum.',
                  style: context.textStyles.titleSmall.copyWith(
                    color: AppColors.verifiedBlack,
                    decoration: TextDecoration.none,
                    decorationColor: AppColors.electricViolet,
                  ),
                ),
              ],
            ),
          ),
          value: isCheck,
          onChanged: (value) {
            setState(() {
              isCheck = value!;
            });
          },
        ),
        context.sizedBoxHeightCustom,

        /// Signup Button
        CustomElevatedButton(
          onPressed: () {},
          text: LocaleKeys.auth_signup.tr(),
        ),
      ],
    );
  }
}
