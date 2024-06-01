import 'package:flutter_donate_app/domain/entity/user_entity.dart';

abstract class AuthRepository {
  /// -- SIGN UP --
  Future<void> signUp({
    required String email,
    required String password,
  });

  /// -- SIGN IN --
  Future<String> signIn({
    required String email,
    required String password,
  });

  /// -- SAVE USER INFO --
  Future<UserEntity> saveUserInfoToFirestore({
    required String name,
    required String surname,
    required String phoneNumber,
    required String age,
    required String gender,
    required dynamic profileImage,
  });
}
