import 'package:flutter_donate_app/domain/entity/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';

abstract class ProfileRepository {
  ///  -- GET USER INFO --
  Future<UserEntity> getUserInfoFromFirestore({required String id});

  ///  -- SIGN OUT --
  Future<void> signOut();

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

  /// -- GET USER ADDRESS INFO --
  Future<AddressesEntity> getAdressesFromFirestore({required String id});

  /// -- ADD ADDRESS INFO --
  Future<AddressesEntity> addAddressInfoToFirestore({
    required String country,
    required String city,
    required String town,
    required String desc,
    required String lat,
    required String long,
  });
}
