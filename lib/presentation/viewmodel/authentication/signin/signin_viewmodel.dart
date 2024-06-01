import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';

abstract class SigninViewModel with ChangeNotifier {
  /// -- VARIABLES --
  GlobalKey<FormState> get formKey;

  TextEditingController get emailController;

  TextEditingController get passController;

  bool get isCheck;

  bool get passObscure;

  set isCheck(bool value);

  set passObscure(bool value);

  /// -- METHODS --

  void togglePassObscure();

  void toggleValidateMode();

  String? emailValidation();

  String? passwordValidation();

  /// -- SIGN IN --
  ApiResponse<String> get signInResponse;

  set signInResponse(ApiResponse<String> value);

  Future<void> signIn();
}
