import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signin.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signin/signin_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/address_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/profile_viewmodel.dart';
import 'package:go_router/go_router.dart';

mixin SigninService on State<SigninView> {
  void signInProcess({
    required BuildContext context,
    required SigninViewModel signinViewModel,
    required ProfileViewModel profileViewModel,
    required AddressViewModel addressViewModel,
  }) {
    if (signinViewModel.formKey.currentState != null && signinViewModel.formKey.currentState!.validate()) {
      signinViewModel.signIn().then((value) async {
        if (signinViewModel.signInResponse.isCompleted()) {
          await profileViewModel.getUserInfoFromFirestore(id: signinViewModel.signInResponse.data).then((value) async {
            if(profileViewModel.getUserInfoFromFirestoreResponse.isCompleted()) {
              if(profileViewModel.getUserInfoFromFirestoreResponse.data.isActive!) {
                await addressViewModel.getAdressesFromFirestore(id: signinViewModel.signInResponse.data).then((value) {
                  addressViewModel.getProvinces();
                  context.goNamed(AppRouteName.app.name);
                  Utils.successSnackBar(
                    context: context,
                    title: 'Başarılı',
                    message: 'Giriş Başarılı',
                  );
                });
              } else {
                context.goNamed(AppRouteName.userInfo.name);
              }
            }
          });

        } else {
          Utils.errorSnackBar(
            context: context,
            title: 'Başarısız',
            message: signinViewModel.signInResponse.message.toString(),
          );
        }
      });
    } else {
      signinViewModel.toggleValidateMode();
    }
  }
}
