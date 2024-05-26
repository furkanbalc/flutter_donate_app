import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/app/app.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signin.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signin/signin_viewmodel.dart';

mixin SigninService on State<SigninView> {
  void signInProcess({required SigninViewModel signinViewModel}) {
    if (signinViewModel.formKey.currentState != null && signinViewModel.formKey.currentState!.validate()) {
      signinViewModel.signIn().then((value) {
        if (signinViewModel.signInResponse.isCompleted()) {
          Utils.successSnackBar(
            context: context,
            title: 'Başarılı',
            message: 'Giriş Başarılı',
          );
          const App().slideTransitionReplace(context);
        } else {
          Utils.errorSnackBar(
            context: context,
            title: 'Başarısız',
            message: signinViewModel.signInResponse.message.toString(),
          );
        }
      });
    } else {
      signinViewModel.toggleValidateMode();
    }
  }
}