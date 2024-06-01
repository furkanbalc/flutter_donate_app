import 'package:flutter_donate_app/domain/entity/user_entity.dart';

abstract class ProfileRepository {
  ///  -- GET USER INFO --
  Future<UserEntity> getUserInfoFromFirestore({required String id});

  ///  -- SIGN OUT --
  Future<void> signOut();
}
