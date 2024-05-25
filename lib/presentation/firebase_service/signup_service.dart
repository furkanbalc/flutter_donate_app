import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/response_event.dart';
import 'package:flutter_donate_app/core/extensions/widget_animated_navigation.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/app/screens/app.dart';
import 'package:flutter_donate_app/presentation/view/authentication/screens/personal_info/user_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/screens/signup.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signup/signup_viewmodel.dart';

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
          const UserInfoView().slideTransitionReplace(context);
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