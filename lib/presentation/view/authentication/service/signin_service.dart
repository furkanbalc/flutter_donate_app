import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/extensions/response_event.dart';
import 'package:flutter_donate_app/core/extensions/widget_animated_navigation.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/app/screens/app.dart';
import 'package:flutter_donate_app/presentation/view/authentication/screens/signin.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/auth_viewmodel.dart';

mixin SignInWithEmailAndPassword on State<SigninView> {
  void signinProcess({
    required BuildContext context,
    required AuthViewModel viewModel,
    required String email,
    required String password,
  }) {
    viewModel
        .signIn(
      email: email,
      password: password,
    )
        .then((value) {
      if (viewModel.signInResponse.isLoading()) {
        Utils.showLoadingDialog(context: context);
      } else if (viewModel.signInResponse.isCompleted()) {
        Navigator.pop(context);
        Utils.successSnackBar(
          mesaj: 'Giriş Başarılı',
          context: context,
        );
        const App().slideTransitionPush(context);
      } else {
        Navigator.pop(context);
        Utils.errorSnackBar(
          mesaj: viewModel.signInResponse.message.toString(),
          context: context,
        );
      }
    });
  }
}
