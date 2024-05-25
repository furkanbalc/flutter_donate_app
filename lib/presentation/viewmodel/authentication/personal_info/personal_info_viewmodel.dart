import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

abstract class PersonalInfoViewModel with ChangeNotifier {
  /// -- VARIABLES --
  GlobalKey<FormState> get formKey;

  String get name;

  String get surname;

  PhoneNumber get phoneNumber;

  String get profilePhotoUrl;

  String get gender;

  int get age;

  bool get isCheck;

  double get beginProgress;

  double get endProgress;

  set profilePhotoUrl(String value);

  set gender(String value);

  set age(int value);

  set isCheck(bool value);

  set beginProgress(double value);

  set endProgress(double value);

  /// -- METHODS --
  void setName(String value);

  void setSurname(String value);

  void setPhoneNumber(PhoneNumber value);

  void toggleValidateMode();

  String? nameValidation();

  String? surnameValidation();

  bool emptyCheck();

  /// -- SAVE USER INFO --
  ApiResponse<UserEntity> get saveUserInfoToFirestoreResponse;

  set saveUserInfoToFirestoreResponse(ApiResponse<UserEntity> value);

  Future<void> saveUserInfoToFirestore();
}
