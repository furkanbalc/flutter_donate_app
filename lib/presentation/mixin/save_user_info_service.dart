import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/response_event.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/authentication/age_info.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';
import 'package:go_router/go_router.dart';

mixin SaveUserInfoService on State<AgeInfoView> {
  void saveInfoProcess({required PersonalInfoViewModel personalInfoViewModel}) {
    personalInfoViewModel.endProgress = 3 / 3;
    Future.delayed(Durations.extralong4).then((value) {
      personalInfoViewModel.saveUserInfoToFirestore().then((value) {
        if (personalInfoViewModel.saveUserInfoToFirestoreResponse.isCompleted()) {
          Utils.successSnackBar(
            context: context,
            title: 'Başarılı',
            message: 'Bilgilerin kaydedildi. Hemen Giriş Yap!',
          );
          context.goNamed(AppRouteName.signin.name);
        } else {
          Utils.errorSnackBar(
            context: context,
            title: 'Başarısız',
            message: 'Kayıt İşlemi Başarısız!',
          );
        }
      });
    });
  }
}
