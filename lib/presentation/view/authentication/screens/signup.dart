import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/auth_method.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_body.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_footer.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_header.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter_donate_app/presentation/widgets/input/custom_text_form_field.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

part '../widgets/signup/signup_form_widget.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBody(
        child: _buildBody(context: context),
      ),
    );
  }

  /// Body
  Widget _buildBody({required BuildContext context}) {
    return Form(
      key: _formKey,
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
            const SignupFormWidget(),

            /// Signup Already Have An Account
            const AuthFooter(method: AuthMethod.signup),
          ],
        ),
      ),
    );
  }
}
