import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/auth_method.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/response_event.dart';
import 'package:flutter_donate_app/core/extensions/widget_animated_navigation.dart';
import 'package:flutter_donate_app/core/mixin/validator.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/app/screens/app.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_body.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_footer.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_header.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/auth_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter_donate_app/presentation/widgets/checkbox/custom_checkbox_listile.dart';
import 'package:flutter_donate_app/presentation/widgets/input/custom_text_form_field.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_loading_widget.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  @override
  ConsumerState createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignupView> with Validator {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  late final TextEditingController _confirmPassController;
  bool isCheck = false;
  bool passObscure = true;
  bool confirmPassObscure = true;

  @override
  void initState() {
    _formKey = GlobalKey();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

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

  void _toggleValidateMode() {
    setState(() {
      isCheck = !isCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = ref.watch(authViewModelImp);
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: true,
          body: AuthBody(
            child: _buildBody(context: context, authViewModel: authViewModel),
          ),
        ),
        Visibility(
          visible: authViewModel.signUpResponse.isLoading(),
          child: const CustomLoadingWidget(),
        ),
      ],
    );
  }

  /// Body
  Widget _buildBody({required BuildContext context, required AuthViewModel authViewModel}) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          autovalidateMode: isCheck ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Column(
              children: [
                SizedBox(height: context.getAppBarHeight()),

                /// Signup Title
                AuthHeader(
                  title: LocaleKeys.auth_create_account.tr(),
                  subTitle: LocaleKeys.auth_fill_your_info.tr(),
                ),
                context.sizedBoxHeightMedium,

                /// Signup Forms
                _buildForms(context, authViewModel),

                /// Signup Already Have An Account
                const AuthFooter(method: AuthMethod.signup),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Signup Forms
  Widget _buildForms(BuildContext context, AuthViewModel authViewModel) {
    return Column(
      children: [
        /// Email Field
        CustomTextFormField(
          controller: _emailController,
          validator: emailValidator,
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
          validator: (p0) => passwordValidator(pass1: _passController.text, pass2: _confirmPassController.text),
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
          validator: (p0) => confirmPasswordValidator(pass1: _passController.text, pass2: _confirmPassController.text),
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
        CustomCheckBoxListTile(title: 'Kayıt koşullarını okudum, kabul ediyorum.'),
        context.sizedBoxHeightMedium,

        /// Signup Button
        CustomElevatedButton(
          onPressed: () {
            if (_formKey.currentState != null && _formKey.currentState!.validate()) {
              authViewModel.signUp(email: _emailController.text, password: _passController.text).then((value) {
                if (authViewModel.signUpResponse.isCompleted()) {
                  Utils.successSnackBar(
                    mesaj: 'Kayıt Başarılı',
                    context: context,
                  );
                  const App().slideTransitionReplace(context);
                } else {
                  Utils.errorSnackBar(
                    mesaj: authViewModel.signUpResponse.message.toString(),
                    context: context,
                  );
                }
              });
            } else {
              _toggleValidateMode();
            }
          },
          text: LocaleKeys.auth_signup.tr(),
        ),
      ],
    );
  }
}
