import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/auth_method.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/firebase_service/signup_service.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signup/signup_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  @override
  ConsumerState createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignupView> with SignupService {
  late SignupViewModel _signupViewModel;

  @override
  void initState() {
    _signupViewModel = ref.read(signupViewModelImp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _signupViewModel = ref.watch(signupViewModelImp);
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: true,
          body: AuthBody(child: _buildBody(context)),
        ),

        /// Loading Widget
        Visibility(
          visible: _signupViewModel.signUpResponse.isLoading(),
          child: const CustomLoadingWidget(),
        ),
      ],
    );
  }

  /// Body
  Widget _buildBody(BuildContext context) {
    return Form(
      key: _signupViewModel.formKey,
      autovalidateMode: _signupViewModel.isCheck ? AutovalidateMode.always : AutovalidateMode.disabled,
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
            _buildForms(context),

            /// Signup Already Have An Account
            const AuthFooter(method: AuthMethod.signup),
          ],
        ),
      ),
    );
  }

  /// Signup Forms
  Widget _buildForms(BuildContext context) {
    return Column(
      children: [
        /// Email Field
        CustomTextFormField(
          controller: _signupViewModel.emailController,
          validator: (p0) => _signupViewModel.emailValidation(),
          labelText: LocaleKeys.form_fields_email.tr(),
          hintText: LocaleKeys.form_fields_email.tr(),
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
        ),
        context.sizedBoxHeightMedium,

        /// Password Field
        CustomTextFormField(
          controller: _signupViewModel.passController,
          validator: (p0) => _signupViewModel.passwordValidation(),
          labelText: LocaleKeys.form_fields_password.tr(),
          hintText: LocaleKeys.form_fields_password.tr(),
          suffixIcon: _signupViewModel.passObscure ? AppIcons.kVisibility : AppIcons.kVisibilityOff,
          suffixOnPressed: _signupViewModel.togglePassObscure,
          keyboardType: TextInputType.text,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
          obscureText: _signupViewModel.passObscure,
          onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        ),
        context.sizedBoxHeightMedium,

        /// Confirm Password Field
        CustomTextFormField(
          controller: _signupViewModel.confirmPassController,
          validator: (p0) => _signupViewModel.confirmPasswordValidation(),
          labelText: LocaleKeys.form_fields_confirm_password.tr(),
          hintText: LocaleKeys.form_fields_confirm_password.tr(),
          suffixIcon: _signupViewModel.confirmPassObscure ? AppIcons.kVisibility : AppIcons.kVisibilityOff,
          suffixOnPressed: _signupViewModel.toggleConfirmPassObscure,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.done,
          obscureText: _signupViewModel.confirmPassObscure,
        ),
        context.sizedBoxHeightMedium,

        /// Terms and Conditions
        CustomCheckBoxListTile(title: 'Kayıt koşullarını okudum, kabul ediyorum.'),
        context.sizedBoxHeightMedium,

        /// Signup Button
        CustomElevatedButton(
          onPressed: () => signUpProcess(signupViewModel: _signupViewModel),
          text: LocaleKeys.auth_signup.tr(),
        ),
      ],
    );
  }
}