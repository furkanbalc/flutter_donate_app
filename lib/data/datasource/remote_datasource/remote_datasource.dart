import 'package:flutter_donate_app/data/models/user_model.dart';

abstract class RemoteDataSource {
  /// -- SIGN UP --
  Future<UserModel> signUp({required String email, required String password});

  /// -- SIGN IN --
  Future<UserModel> signIn({required String email, required String password});

  /// -- SAVE USER INFO --
  Future<UserModel> saveUserInfoToFirestore({
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
