import 'package:flutter_donate_app/domain/entity/address_entity.dart';
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
