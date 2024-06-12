import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/profile/profile_info.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';

mixin UpdateUserInfoService on State<ProfileInfoView> {
  void updateProcess({
    required BuildContext context,
    required ProfileViewModel profileViewModel,
  }) {
    if (profileViewModel.formKey.currentState != null && profileViewModel.formKey.currentState!.validate()) {
      profileViewModel.updateUserInfo().then((value)  {
        if (profileViewModel.updateUserInfoResponse.isCompleted()) {
          profileViewModel.getUserInfoFromFirestore(id: profileViewModel.getUserId);
          if(profileViewModel.getUserInfoFromFirestoreResponse.isCompleted()) {
            Utils.successSnackBar(
              context: context,
              title: 'Başarılı',
              message: 'Bilgileriniz güncellendi',
            );
          }
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
}
