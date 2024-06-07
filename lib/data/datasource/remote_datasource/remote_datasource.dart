import 'package:flutter_donate_app/data/models/address_model.dart';
import 'package:flutter_donate_app/data/models/user_model.dart';

abstract class RemoteDataSource {
  /// -- IS LOGGED IN --
  Future<String?> isUserLoggedIn();

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
  Future<AddressesModel> getAdressesFromFirestore({
    required String id,
  });

  /// -- ADD ADDRESS INFO --
  Future<AddressesModel> addAddressInfoToFirestore({
    required String country,
    required String city,
    required String town,
    required String desc,
    required String lat,
    required String long,
  });
}
