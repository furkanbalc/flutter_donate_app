import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/mixin/validator.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:flutter_donate_app/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:permission_handler/permission_handler.dart';

class PersonalInfoViewModelImp extends ChangeNotifier with Validator implements PersonalInfoViewModel {
  /// -- VARIABLES --
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? _image;
  String _name = '';
  String _surname = '';
  PhoneNumber _phoneNumber = PhoneNumber();
  String _gender = '';
  int _age = 18;
  bool _isCheck = false;
  double _beginProgress = 0.0;
  double _endProgress = 0.0;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  XFile? get image => _image;

  @override
  String get name => _name;

  @override
  String get surname => _surname;

  @override
  PhoneNumber get phoneNumber => _phoneNumber;

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
  set image(XFile? value) {
    _image = value;
    notifyListeners();
  }

  @override
  set gender(String value) {
    _gender = value;
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

  /// -- THE CONFIRM BUTTON BE TURNED ON --
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

  /// -- NAME VALIDATION --
  @override
  String? nameValidation() {
    return nameValidator(name);
  }

  /// -- SURNAME VALIDATION --
  @override
  String? surnameValidation() {
    return surnameValidator(surname);
  }

  /// -- SELECT IMAGE FROM GALLERY --
  @override
  Future getImageFromGallery() async {
    // if (await Permission.photos.isGranted) {
    final XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = selectedImage;
    notifyListeners();
    // } else {
    //   await _requestPermission(Permission.photos);
    // }
  }

  /// -- OPEN CAMERA --
  @override
  Future getImageFromCamera() async {
    PermissionStatus permissionStatus = await Permission.camera.status;
    if (permissionStatus.isGranted) {
      final XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);
      image = selectedImage;
      notifyListeners();
    } else if (permissionStatus.isDenied) {
      await _requestPermission(Permission.camera);
      getImageFromCamera();
    } else {
      await _requestPermission(Permission.camera);
    }
  }

  /// -- REMOVE SELECTED IMAGE --
  @override
  Future<void> pickImageRemove({required BuildContext context}) async {
    Navigator.pop(context);
    image = null;
    notifyListeners();
  }

  Future<void> _requestPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      openAppSettings();
    }
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
          profileImage: image,
        ),
      );
      saveUserInfoToFirestoreResponse = ApiResponse.completed(userEntity);
    } catch (e, stackTrace) {
      saveUserInfoToFirestoreResponse = ApiResponse.error(e, stackTrace);
    }
  }
}
