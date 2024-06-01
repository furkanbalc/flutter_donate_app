import 'package:flutter_donate_app/data/models/user_model.dart';

abstract class RemoteDataSource {
  /// -- SIGN UP --
  Future<void> signUp({required String email, required String password});

  /// -- SIGN IN --
  Future<String> signIn({required String email, required String password});

  /// -- SIGN OUT --
  Future<void> signOut();

  /// -- SAVE USER INFO --
  Future<UserModel> saveUserInfoToFirestore({
    required String name,
    required String surname,
    required String phoneNumber,
    required String age,
    required String gender,
    required dynamic profileImage,
  });

  /// -- GET CURRENT USER INFO --
  Future<UserModel> getUserInfoFromFirestore({
    required String id,
  });
}
