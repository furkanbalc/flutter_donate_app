import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/response_event.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signup.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signup/signup_viewmodel.dart';
import 'package:go_router/go_router.dart';

mixin SignupService on State<SignupView> {
  void signUpProcess({required SignupViewModel signupViewModel}) {
    if (signupViewModel.formKey.currentState != null && signupViewModel.formKey.currentState!.validate()) {
      signupViewModel.signUp().then((value) {
        if (signupViewModel.signUpResponse.isCompleted()) {
          Utils.successSnackBar(
            context: context,
            title: 'Başarılı',
            message: 'Kayıt Başarılı',
          );
          context.goNamed(AppRouteName.userInfo.name);
        } else {
          Utils.errorSnackBar(
            context: context,
            title: 'Başarısız',
            message: signupViewModel.signUpResponse.message.toString(),
          );
        }
      });
    } else {
      signupViewModel.toggleValidateMode();
    }
  }
}