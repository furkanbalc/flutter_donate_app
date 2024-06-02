import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/profile/profile_infos.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';

mixin UpdateUserInfo on State<ProfileInfosView> {
  void updateProcess({required ProfileViewModel profileViewModel}) {
    profileViewModel.updateUserInfo().then((value) async {
      if (profileViewModel.updateUserInfoResponse.isCompleted()) {
        Utils.successSnackBar(
          context: context,
          title: 'Başarılı',
          message: 'Bilgileriniz güncellendi',
        );
        profileViewModel.getUserInfoFromFirestore(id: profileViewModel.getUserId);
        profileViewModel.setIsEditing();
      } else {
        Utils.errorSnackBar(
          context: context,
          title: 'Başarısız',
          message: profileViewModel.updateUserInfoResponse.message.toString(),
        );
      }
    });
  }
}
