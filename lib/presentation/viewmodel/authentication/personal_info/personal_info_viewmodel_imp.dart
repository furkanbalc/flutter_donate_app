import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/mixin/validator.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:flutter_donate_app/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signup/signup_viewmodel.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../main.dart';

class PersonalInfoViewModelImp extends ChangeNotifier with Validator implements PersonalInfoViewModel {
  /// -- VARIABLES --
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _surname = '';
  PhoneNumber _phoneNumber = PhoneNumber();
  String _profilePhotoUrl = '';
  String _gender = '';
  int _age = 18;
  bool _isCheck = false;
  double _beginProgress = 0.0;
  double _endProgress = 0.0;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  String get name => _name;

  @override
  String get surname => _surname;

  @override
  PhoneNumber get phoneNumber => _phoneNumber;

  @override
  String get profilePhotoUrl => _profilePhotoUrl;

  @override
  String get gender => _gender;

  @override
  int get age => _age;

  @override
  bool get isCheck => _isCheck;

  @override
  double get beginProgress => _beginProgress;

  @override
  double get endProgress => _endProgress;

  @override
  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  @override
  set profilePhotoUrl(String value) {
    _profilePhotoUrl = value;
    notifyListeners();
  }

  @override
  set age(int value) {
    _age = value;
    notifyListeners();
  }

  @override
  set isCheck(bool value) {
    _isCheck = value;
    notifyListeners();
  }

  @override
  set beginProgress(double value) {
    _beginProgress = value;
    notifyListeners();
  }

  @override
  set endProgress(double value) {
    _endProgress = value;
    notifyListeners();
  }

  /// -- METHODS --
  @override
  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  @override
  void setSurname(String value) {
    _surname = value;
    notifyListeners();
  }

  @override
  void setPhoneNumber(PhoneNumber value) {
    _phoneNumber = value;
    notifyListeners();
  }

  @override
  void toggleValidateMode() {
    _isCheck = !_isCheck;
    notifyListeners();
  }

  @override
  bool emptyCheck() {
    if (name.isNotEmpty &&
        surname.isNotEmpty &&
        ((phoneNumber.phoneNumber?.length ?? 0) - (phoneNumber.dialCode?.length ?? 0)) != 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  String? nameValidation() {
    return nameValidator(name);
  }

  @override
  String? surnameValidation() {
    return surnameValidator(surname);
  }

  /// -- SAVE USER INFO --
  ApiResponse<UserEntity> _saveUserInfoToFirestoreResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<UserEntity> get saveUserInfoToFirestoreResponse => _saveUserInfoToFirestoreResponse;

  @override
  set saveUserInfoToFirestoreResponse(ApiResponse<UserEntity> value) {
    _saveUserInfoToFirestoreResponse = value;
    notifyListeners();
  }

  @override
  Future<void> saveUserInfoToFirestore() async {
    saveUserInfoToFirestoreResponse = ApiResponse.loading("loading");
    try {
      final UserEntity userEntity = await injector<SaveUserInfoToFirestore>().execute(
        ParamsForSaveUserInfoToFirestore(
          name: name,
          surname: surname,
          phoneNumber: phoneNumber.phoneNumber ?? '',
          age: age.toString(),
          gender: gender,
          profileImage: profilePhotoUrl,
        ),
      );
      saveUserInfoToFirestoreResponse = ApiResponse.completed(userEntity);
    } catch (e, stackTrace) {
      saveUserInfoToFirestoreResponse = ApiResponse.error(e, stackTrace);
    }
  }
}
