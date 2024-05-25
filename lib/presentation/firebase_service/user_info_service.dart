import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/widget_animated_navigation.dart';
import 'package:flutter_donate_app/presentation/view/authentication/screens/personal_info/gender_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/screens/personal_info/user_info.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';

mixin UserInfoService on State<UserInfoView> {
  void userInfoProcess({required PersonalInfoViewModel personalInfoViewModel}) {
    FocusScope.of(context).unfocus();
    personalInfoViewModel.saveUserInfoToFirestore().then((value) {
      if (personalInfoViewModel.formKey.currentState != null &&
          personalInfoViewModel.formKey.currentState!.validate()) {
        personalInfoViewModel.endProgress = 1 / 3;
        Future.delayed(Durations.extralong4).then((value) {
          const GenderInfoView().slideTransitionPush(context);
        });
      } else {
        personalInfoViewModel.toggleValidateMode();
      }
    });
  }
}
