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
import 'package:flutter_donate_app/presentation/view/authentication/service/signin_service.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_body.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_footer.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_header.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/auth_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_text_button.dart';
import 'package:flutter_donate_app/presentation/widgets/input/custom_text_form_field.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_loading_widget.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninView extends ConsumerStatefulWidget {
  const SigninView({super.key});

  @override
  ConsumerState createState() => _SigninViewState();
}

class _SigninViewState extends ConsumerState<SigninView> with Validator, SignInWithEmailAndPassword {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  bool isCheck = false;
  bool passObscure = true;

  @override
  void initState() {
    _formKey = GlobalKey();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _togglePassObscure() {
    setState(() {
      passObscure = !passObscure;
    });
  }

  void _toggleAutoValidate() {
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
          body: AuthBody(
            child: _buildBody(context: context, authViewModel: authViewModel),
          ),
        ),
        Visibility(
          visible: authViewModel.signInResponse.isLoading(),
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

                /// Signin Title
                AuthHeader(
                  title: LocaleKeys.auth_signin.tr(),
                  subTitle: LocaleKeys.auth_welcome_back.tr(),
                ),
                context.sizedBoxHeightMedium,

                /// Signin Forms
                _buildForms(context, authViewModel),

                /// Signin Dont Have An Account
                const AuthFooter(method: AuthMethod.sigin),
              ],
            ),
          ),
        ),
        Visibility(
          visible: authViewModel.signUpResponse.isLoading(),
          child: const CustomLoadingWidget(),
        ),
      ],
    );
  }

  /// Signin Forms
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
          validator: loginPasswordValidator,
          labelText: LocaleKeys.form_fields_password.tr(),
          hintText: LocaleKeys.form_fields_password.tr(),
          suffixIcon: passObscure ? AppIcons.kVisibility : AppIcons.kVisibilityOff,
          suffixOnPressed: _togglePassObscure,
          keyboardType: TextInputType.text,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.done,
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
            if (_formKey.currentState != null && _formKey.currentState!.validate()) {
              authViewModel
                  .signIn(
                email: _emailController.text,
                password: _passController.text,
              )
                  .then((value) {
                if (authViewModel.signInResponse.isCompleted()) {
                  Utils.successSnackBar(
                    mesaj: 'Giriş Başarılı',
                    context: context,
                  );
                  const App().slideTransitionPush(context);
                } else {
                  Utils.errorSnackBar(
                    mesaj: authViewModel.signInResponse.message.toString(),
                    context: context,
                  );
                }
              });
            } else {
              _toggleAutoValidate();
            }
          },
          text: LocaleKeys.auth_signin.tr(),
        ),
      ],
    );
  }
}
