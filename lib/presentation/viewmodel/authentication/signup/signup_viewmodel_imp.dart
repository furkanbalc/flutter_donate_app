import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/utils/validators.dart/custom_validators.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:flutter_donate_app/di/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signup/signup_viewmodel.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

class SignupViewModelImp extends ChangeNotifier implements SignupViewModel {
  /// -- VARIABLES --
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool _isCheck = false;
  bool _passObscure = true;
  bool _confirmPassObscure = true;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  TextEditingController get emailController => _emailController;

  @override
  TextEditingController get passController => _passController;

  @override
  TextEditingController get confirmPassController => _confirmPassController;

  @override
  bool get isCheck => _isCheck;

  @override
  bool get passObscure => _passObscure;

  @override
  bool get confirmPassObscure => _confirmPassObscure;

  /// -- METHODS --
  @override
  void togglePassObscure() {
    _passObscure = !_passObscure;
    notifyListeners();
  }

  @override
  void toggleConfirmPassObscure() {
    _confirmPassObscure = !_confirmPassObscure;
    notifyListeners();
  }

  @override
  void toggleValidateMode() {
    _isCheck = !_isCheck;
    notifyListeners();
  }

  @override
  String? emailValidation() {
    return CustomValidators.emailValidator(_emailController.text);
  }

  @override
  String? passwordValidation() {
    return CustomValidators.passwordValidator(
        pass: passController.text, confirmPass: confirmPassController.text);
  }

  @override
  String? confirmPasswordValidation() {
    return CustomValidators.confirmPasswordValidator(
        pass: passController.text, confirmPass: confirmPassController.text);
  }

  /// -- SIGN UP --
  ApiResponse<bool> _signUpResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<bool> get signUpResponse => _signUpResponse;

  @override
  set signUpResponse(ApiResponse<bool> value) {
    _signUpResponse = value;
    notifyListeners();
  }

  @override
  Future<void> signUp() async {
    signUpResponse = ApiResponse.loading("loading");
    try {
      await injector<SignUp>().execute(
        ParamsForAuth(
          email: emailController.text,
          password: passController.text,
        ),
      );
      signUpResponse = ApiResponse.completed(true);
    } on FirebaseAuthException catch (e, stacTrace) {
      if (e.code == 'email-already-in-use') {
        signUpResponse = ApiResponse.error(
            LocaleKeys.messages_email_already_in_use.tr(), stacTrace);
      }
    } catch (e, stackTrace) {
      signUpResponse = ApiResponse.error(e, stackTrace);
    }
  }
}
