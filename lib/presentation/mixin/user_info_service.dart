import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/presentation/view/authentication/user_info.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';
import 'package:go_router/go_router.dart';

mixin UserInfoService on State<UserInfoView> {
  void userInfoProcess({required PersonalInfoViewModel personalInfoViewModel}) {
    FocusScope.of(context).unfocus();
    personalInfoViewModel.saveUserInfoToFirestore().then((value) {
      if (personalInfoViewModel.formKey.currentState != null &&
          personalInfoViewModel.formKey.currentState!.validate()) {
        personalInfoViewModel.endProgress = 1 / 3;
        Future.delayed(Durations.extralong4).then((value) {
          context.goNamed(AppRouteName.genderInfo.name);
        });
      } else {
        personalInfoViewModel.toggleValidateMode();
      }
    });
  }
}
