import 'package:flutter_donate_app/domain/entity/user_entity.dart';

abstract class ProfileRepository {
  /// -- SAVE USER INFO --
  Future<UserEntity> saveUserInfoToFirestore({
    required String name,
    required String surname,
    required String phoneNumber,
    required String age,
    required String gender,
    required dynamic profileImage,
  });

  ///  -- GET USER INFO --
  Future<UserEntity> getUserInfoFromFirestore({required String id});

  /// -- UPDATE USER INFO --
  Future<void> updateUserInfo({
    required String id,
    required String name,
    required String surname,
    required String email,
    required String phoneNumber,
    required String gender,
    required String age,
    required dynamic profileImage,
  });


}
