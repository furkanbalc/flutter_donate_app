import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileViewModel extends ChangeNotifier {
  /// VARIABLES
  GlobalKey<FormState> get formKey;

  TextEditingController get nameController;

  TextEditingController get surnameController;

  TextEditingController get emailController;

  TextEditingController get phoneController;

  TextEditingController get genderController;

  TextEditingController get ageController;

  XFile? get image;

  String? get profilPhotoUrl;

  IconData get genderIcon;

  bool get isEditing;

  set image(XFile? value);

  set profilPhotoUrl(String? value);

  set genderIcon(IconData value);

  void setIsEditing();

  /// -- INITSTATE METHOD --
  void init();

  // /// -- DEACTIVE METHOD --
  // void deactive();

  ///  -- GET USER INFO --
  ApiResponse<UserEntity> get getUserInfoFromFirestoreResponse;

  set getUserInfoFromFirestoreResponse(ApiResponse<UserEntity> value);

  Future<void> getUserInfoFromFirestore({required String id});


  ///  -- SIGN OUT USER --
  ApiResponse<void> get signOutResponse;

  set signOutResponse(ApiResponse<void> value);

  Future<void> signOut();

  ///  -- UPDATE USER INFO --
  ApiResponse<void> get updateUserInfoResponse;

  set updateUserInfoResponse(ApiResponse<void> value);

  Future<void> updateUserInfo();

  /// -- DELETE ACCOUNT --
  ApiResponse<void> get deleteAccountResponse;

  set deleteAccountResponse(ApiResponse<void> value);

  Future<void> deleteAccount();

  /// get current user id
  String get getUserId;

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
  IconData get getUserGenderIcon;

  /// get current user gender is man ?
  bool get isMan;

  /// get current user age
  String get getUserAge;

  /// get current user phone number
  String get getUserPhoneNumber;

  /// get current user photo url
  String get getUserProfilPhoto;

  /// select image from gallery
  Future getImageFromGallery();

  /// open camera
  Future getImageFromCamera();

  ///  Are there any unsaved changes?
  bool isChangesSaved();

  /// undo unsaved changes
  void undoUnsavedChanges();
}
