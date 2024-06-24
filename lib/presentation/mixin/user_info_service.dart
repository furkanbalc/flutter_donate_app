import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/presentation/view/user_info/user_info.dart';
import 'package:flutter_donate_app/presentation/viewmodel/user_info/user_info_viewmodel.dart';
import 'package:go_router/go_router.dart';

mixin UserInfoService on State<UserInfoView> {
  void userInfoProcess({required UserInfoViewModel userInfoViewModel}) {
    FocusScope.of(context).unfocus();
    userInfoViewModel.saveUserInfoToFirestore().then((value) {
      if (userInfoViewModel.formKey.currentState != null &&
          userInfoViewModel.formKey.currentState!.validate()) {
        userInfoViewModel.endProgress = 1 / 3;
        Future.delayed(Durations.extralong4).then((value) {
          context.goNamed(AppRouteName.genderInfo.name);
        });
      } else {
        userInfoViewModel.toggleValidateMode();
      }
    });
  }
}
