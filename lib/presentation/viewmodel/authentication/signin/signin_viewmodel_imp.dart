import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/mixin/validator.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:flutter_donate_app/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signin/signin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

class SigninViewModelImp extends ChangeNotifier with Validator implements SigninViewModel {
  /// -- VARIABLES --
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isCheck = false;
  bool _passObscure = true;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  TextEditingController get emailController => _emailController;

  @override
  TextEditingController get passController => _passController;

  @override
  bool get isCheck => _isCheck;

  @override
  bool get passObscure => _passObscure;

  @override
  set isCheck(bool value) {
    _isCheck = value;
    notifyListeners();
  }

  @override
  set passObscure(bool value) {
    _passObscure = value;
    notifyListeners();
  }


  /// -- METHODS --
  @override
  void togglePassObscure() {
    passObscure = !passObscure;
    notifyListeners();
  }

  @override
  void toggleValidateMode() {
    isCheck = !isCheck;
    notifyListeners();
  }

  @override
  String? emailValidation() {
    return emailValidator(emailController.text);
  }

  @override
  String? passwordValidation() {
    return loginPasswordValidator(passController.text);
  }

  /// -- SIGN IN --
  ApiResponse<bool> _signInResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<bool> get signInResponse => _signInResponse;

  @override
  set signInResponse(ApiResponse<bool> value) {
    _signInResponse = value;
    notifyListeners();
  }

  @override
  Future<void> signIn() async {
    signInResponse = ApiResponse.loading("loading");
    try {
      await injector<SignIn>().execute(
        ParamsForAuth(
          email: emailController.text,
          password: passController.text,
        ),
      );
      signInResponse = ApiResponse.completed(true);
    } on FirebaseAuthException catch (e, stacTrace) {
      if (e.code == 'user-not-found') {
        signInResponse = ApiResponse.error(LocaleKeys.messages_user_not_found.tr(), stacTrace);
      } else if (e.code == 'wrong-password') {
        signInResponse = ApiResponse.error(LocaleKeys.messages_wrong_password.tr(), stacTrace);
      }
      signInResponse = ApiResponse.error(LocaleKeys.messages_wrong_email_or_password.tr(), stacTrace);
    } catch (e, stackTrace) {
      signInResponse = ApiResponse.error(e, stackTrace);
    }
  }
}
