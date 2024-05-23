import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';

abstract class AuthViewModel with ChangeNotifier {
  /// -- SIGN UP --
  ApiResponse<bool> get signUpResponse;

  set signUpResponse(ApiResponse<bool> value);

  Future<void> signUp({
    required String email,
    required String password,
  });

  /// -- SIGN IN --
  ApiResponse<bool> get signInResponse;

  set signInResponse(ApiResponse<bool> value);

  Future<void> signIn({
    required String email,
    required String password,
  });

  /// -- SAVE USER INFO --
  ApiResponse<UserEntity> get saveUserInfoToFirestoreResponse;

  set saveUserInfoToFirestoreResponse(ApiResponse<UserEntity> value);

  Future<void> saveUserInfoToFirestore({
    required String id,
    required String email,
    required String name,
    required String surname,
    required String phoneNumber,
    required String age,
    required String gender,
    required dynamic profileImage,
  });
}
