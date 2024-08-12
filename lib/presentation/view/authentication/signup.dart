import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/mixin/signup_service.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
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
            context.sizedBoxHeightMedium1,

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
          unFocus: true,
        ),
        context.sizedBoxHeightMedium1,

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
          unFocus: true,
          onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        ),
        context.sizedBoxHeightMedium1,

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
          unFocus: true,
          obscureText: _signupViewModel.confirmPassObscure,
        ),
        context.sizedBoxHeightMedium1,

        /// Terms and Conditions
        CustomCheckBoxListTile(title: LocaleKeys.auth_i_have_read_registration_conditions.tr()),
        context.sizedBoxHeightMedium1,

        /// Signup Button
        CustomElevatedButton(
          onPressed: () => signUpProcess(signupViewModel: _signupViewModel),
          text: LocaleKeys.auth_signup.tr(),
        ),
      ],
    );
  }
}
