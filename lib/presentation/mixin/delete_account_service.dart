import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/profile/profile_info.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:go_router/go_router.dart';

mixin DeleteAccountService on State<ProfileInfoView> {
  void deleteAccountProcess(
      {required BuildContext context,
      required ProfileViewModel profileViewModel}) {
    context.pop();
    profileViewModel.deleteAccount().then((value) {
      if (profileViewModel.deleteAccountResponse.isCompleted()) {
        context.goNamed(AppRouteName.welcome.name);
        Utils.successSnackBar(
          context: context,
          message: 'Hesabınız başarıyla silindi',
        );
      } else {
        Utils.errorSnackBar(
          context: context,
          message: 'Hesabınız silinemedi tekrar deneyiniz',
        );
      }
    });
  }
}
