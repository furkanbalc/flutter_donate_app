import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/app/profile/profile.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/profile_viewmodel.dart';
import 'package:go_router/go_router.dart';

mixin SignOutService on State<ProfileView> {
  void signOutProcess({
    required BuildContext context,
    required ProfileViewModel profileViewModel,
  }) {
    profileViewModel.signOut().then((value) {
      if(profileViewModel.signOutResponse.isCompleted()) {
        context.goNamed(AppRouteName.signin.name);
        Utils.successSnackBar(
          context: context,
          title: 'Başarılı',
          message: 'Çıkış Yapıldı',
        );
      } else {
        Utils.errorSnackBar(
          context: context,
          title: 'Başarısız',
          message: 'Çıkış Yapılamadı',
        );
      }
    });
  }
}
