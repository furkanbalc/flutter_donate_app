import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';

abstract class ProfileViewModel extends ChangeNotifier {
  ///  -- GET USER INFO --
  ApiResponse<UserEntity> get getUserInfoFromFirestoreResponse;

  set getUserInfoFromFirestoreResponse(ApiResponse<UserEntity> value);

  Future<void> getUserInfoFromFirestore({required String id});

  ///  -- SIGN OUT USER --
  ApiResponse<void> get signOutResponse;

  set signOutResponse(ApiResponse<void> value);

  Future<void> signOut();

  /// get current user email
  String get getUserEmail;

  /// get current user full name
  String get getUserFullname;

   /// get current user name
  String get getUserName;

   /// get current user surname
  String get getUserSurname;

  /// get current user gender
  String get getUserGender;

  /// get current user gender icon
  String get getUserGenderIcon;

  /// get current user age
  String get getUserAge;

  /// get current user phone number
  String get getUserPhoneNumber;

  /// get current user photo url
  String get getUserProfilPhoto;
}
