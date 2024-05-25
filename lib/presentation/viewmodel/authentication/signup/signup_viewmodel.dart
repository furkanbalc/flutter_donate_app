import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';

abstract class SignupViewModel with ChangeNotifier{
  /// -- VARIABLES --
  GlobalKey<FormState> get formKey;

  TextEditingController get emailController;

  TextEditingController get passController;

  TextEditingController get confirmPassController;

  bool get isCheck;

  bool get passObscure;

  bool get confirmPassObscure;

  /// -- METHODS --

  void togglePassObscure();

  void toggleConfirmPassObscure();

  void toggleValidateMode();

  String? emailValidation();

  String? passwordValidation();

  String? confirmPasswordValidation();

  /// -- SIGN UP --
  ApiResponse<bool> get signUpResponse;

  set signUpResponse(ApiResponse<bool> value);

  Future<void> signUp();
}
