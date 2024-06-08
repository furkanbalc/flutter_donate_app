import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/auth_method.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/mixin/signin_service.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signin/signin_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/address_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/profile_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninView extends ConsumerStatefulWidget {
  const SigninView({super.key});

  @override
  ConsumerState createState() => _SigninViewState();
}

class _SigninViewState extends ConsumerState<SigninView> with SigninService {
  late SigninViewModel _signinViewModel;
  late ProfileViewModel _profileViewModel;
  late AddressViewModel _addressViewModel;

  @override
  void initState() {
    _signinViewModel = ref.read(signinViewModelImp);
    _profileViewModel = ref.read(profileViewModelImp);
    _addressViewModel = ref.read(addressViewModelImp);
    super.initState();
  }

  @override
  void dispose() {
    _signinViewModel.emailController.text = '';
    _signinViewModel.passController.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _signinViewModel = ref.watch(signinViewModelImp);
    _profileViewModel = ref.watch(profileViewModelImp);
    _addressViewModel = ref.watch(addressViewModelImp);
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: AuthBody(child: _buildBody(context)),
        ),

        /// Loading Widget
        Visibility(
          visible: _signinViewModel.signInResponse.isLoading(),
          child: const CustomLoadingWidget(),
        ),
      ],
    );
  }

  /// Body
  Widget _buildBody(BuildContext context) {
    return Form(
      key: _signinViewModel.formKey,
      autovalidateMode: _signinViewModel.isCheck ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Column(
          children: [
            SizedBox(height: context.getAppBarHeight()),

            /// Signin Title
            AuthHeader(
              title: LocaleKeys.auth_signin.tr(),
              subTitle: LocaleKeys.auth_welcome_back.tr(),
            ),
            context.sizedBoxHeightMedium,

            /// Signin Forms
            _buildForms(context),

            /// Signin Dont Have An Account
            const AuthFooter(method: AuthMethod.sigin),
          ],
        ),
      ),
    );
  }

  /// Signin Forms
  Widget _buildForms(BuildContext context) {
    return Column(
      children: [
        /// Email Field
        CustomTextFormField(
          controller: _signinViewModel.emailController,
          validator: (p0) => _signinViewModel.emailValidation(),
          labelText: LocaleKeys.form_fields_email.tr(),
          hintText: LocaleKeys.form_fields_email.tr(),
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
          unFocus: true,
        ),
        context.sizedBoxHeightMedium,

        /// Password Field
        CustomTextFormField(
          controller: _signinViewModel.passController,
          validator: (p0) => _signinViewModel.passwordValidation(),
          labelText: LocaleKeys.form_fields_password.tr(),
          hintText: LocaleKeys.form_fields_password.tr(),
          suffixIcon: _signinViewModel.passObscure ? AppIcons.kVisibility : AppIcons.kVisibilityOff,
          suffixOnPressed: _signinViewModel.togglePassObscure,
          keyboardType: TextInputType.text,
          autofillHints: const [AutofillHints.password],
          textInputAction: TextInputAction.done,
          obscureText: _signinViewModel.passObscure,
          unFocus: true,
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
          onPressed: () => signInProcess(
            context: context,
            signinViewModel: _signinViewModel,
            profileViewModel: _profileViewModel,
            addressViewModel: _addressViewModel,
          ),
          text: LocaleKeys.auth_signin.tr(),
        ),
      ],
    );
  }
}
