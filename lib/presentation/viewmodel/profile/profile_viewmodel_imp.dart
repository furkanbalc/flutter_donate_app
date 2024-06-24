import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:flutter_donate_app/domain/usecases/profile_usecases.dart';
import 'package:flutter_donate_app/di/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/profile_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileViewModelImp extends ChangeNotifier implements ProfileViewModel {
  /// VARIABLES
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController =
      TextEditingController(text: getUserName);
  late final TextEditingController _surnameController =
      TextEditingController(text: getUserSurname);
  late final TextEditingController _emailController =
      TextEditingController(text: getUserEmail);
  late final TextEditingController _phoneController =
      TextEditingController(text: getUserPhoneNumber);
  late final TextEditingController _genderController =
      TextEditingController(text: getUserGender);
  late final TextEditingController _ageController =
      TextEditingController(text: getUserAge);

  late String? _profilPhotoUrl;
  late IconData _genderIcon;
  late XFile? _image;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  TextEditingController get nameController => _nameController;

  @override
  TextEditingController get surnameController => _surnameController;

  @override
  TextEditingController get emailController => _emailController;

  @override
  TextEditingController get phoneController => _phoneController;

  @override
  TextEditingController get genderController => _genderController;

  @override
  TextEditingController get ageController => _ageController;

  @override
  XFile? get image => _image;

  @override
  String? get profilPhotoUrl => _profilPhotoUrl;

  @override
  IconData get genderIcon => _genderIcon;

  @override
  set image(XFile? value) {
    _image = value;
    notifyListeners();
  }

  @override
  set profilPhotoUrl(String? value) {
    _profilPhotoUrl = value;
    notifyListeners();
  }

  @override
  set genderIcon(IconData value) {
    _genderIcon = value;
    notifyListeners();
  }

  /// -- INITSTATE METHOD --
  @override
  void init() {
    _profilPhotoUrl = getUserProfilPhoto;
    _genderIcon = getUserGenderIcon;
    _image = null;
  }

  /// -- GET USER INFO --
  ApiResponse<UserEntity> _getUserInfoFromFirestoreResponse =
      ApiResponse.loading('loading');

  @override
  ApiResponse<UserEntity> get getUserInfoFromFirestoreResponse =>
      _getUserInfoFromFirestoreResponse;

  @override
  set getUserInfoFromFirestoreResponse(ApiResponse<UserEntity> value) {
    _getUserInfoFromFirestoreResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getUserInfoFromFirestore({required String id}) async {
    try {
      final UserEntity userEntity =
          await injector<GetUserInfoFromFirestore>().execute(
        ParamsForGetUserInfo(id: id),
      );
      getUserInfoFromFirestoreResponse = ApiResponse.completed(userEntity);
    } catch (e, stackTrace) {
      getUserInfoFromFirestoreResponse = ApiResponse.error(e, stackTrace);
    }
  }

  ///  -- SIGN OUT USER --
  ApiResponse<void> _signOutResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<void> get signOutResponse => _signOutResponse;

  @override
  set signOutResponse(ApiResponse<void> value) {
    _signOutResponse = value;
    notifyListeners();
  }

  @override
  Future<void> signOut() async {
    signOutResponse = ApiResponse.loading("loading");
    try {
      await injector<SignOut>().execute(const ParamsBase());
      signOutResponse = ApiResponse.completed("completed");
    } catch (e, stackTrace) {
      signOutResponse = ApiResponse.error(e, stackTrace);
    }
  }

  ///  -- UPDATE USER INFO --
  ApiResponse<void> _updateUserInfoResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<void> get updateUserInfoResponse => _updateUserInfoResponse;

  @override
  set updateUserInfoResponse(ApiResponse<void> value) {
    _updateUserInfoResponse = value;
    notifyListeners();
  }

  @override
  Future<void> updateUserInfo() async {
    updateUserInfoResponse = ApiResponse.loading("loading");
    try {
      await injector<UpdateProfileUser>().execute(
        ParamsForUpdateUser(
          id: getUserId,
          name: _nameController.text.trim(),
          surname: _surnameController.text.trim(),
          email: _emailController.text.trim(),
          phoneNumber: _phoneController.text.trim(),
          gender: _genderController.text,
          age: _ageController.text,
          profileImage: image,
        ),
      );
      updateUserInfoResponse = ApiResponse.completed("completed");
    } catch (e, stackTrace) {
      updateUserInfoResponse = ApiResponse.error(e, stackTrace);
    }
  }

  /// -- DELETE ACCOUNT --
  ApiResponse<void> _deleteAccountResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<void> get deleteAccountResponse => _deleteAccountResponse;

  @override
  set deleteAccountResponse(ApiResponse<void> value) {
    _deleteAccountResponse = value;
    notifyListeners();
  }

  @override
  Future<void> deleteAccount() async {
    deleteAccountResponse = ApiResponse.loading("loading");
    try {
      await injector<DeleteAccount>().execute(const ParamsBase());
      deleteAccountResponse = ApiResponse.completed("completed");
    } catch (e, stackTrace) {
      deleteAccountResponse = ApiResponse.error(e, stackTrace);
    }
  }

  /// -- SELECT IMAGE FROM GALLERY --
  @override
  Future getImageFromGallery() async {
    final XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    image = selectedImage;
    if (image != null) {
      profilPhotoUrl = image!.path;
    }
  }

  /// -- OPEN CAMERA --
  @override
  Future getImageFromCamera() async {
    PermissionStatus permissionStatus = await Permission.camera.status;
    if (permissionStatus.isGranted) {
      final XFile? selectedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      image = selectedImage;
      if (image != null) {
        profilPhotoUrl = image!.path;
      }
    } else if (permissionStatus.isDenied) {
      await _requestPermission(Permission.camera);
      getImageFromCamera();
    } else {
      await _requestPermission(Permission.camera);
    }
  }

  Future<void> _requestPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  ///  Are there any unsaved changes?
  @override
  bool isChangesSaved() {
    if (_nameController.text.trim() != getUserName ||
            _surnameController.text.trim() != getUserSurname ||
            _emailController.text.trim() != getUserEmail ||
            _phoneController.text.trim() != getUserPhoneNumber ||
            _genderController.text.trim() != getUserGender ||
            _ageController.text.trim() != getUserAge
        // _profilPhotoUrl != getUserProfilPhoto///FIXME
        ) {
      return true;
    }
    return false;
  }

  /// undo unsaved changes
  @override
  void undoUnsavedChanges() {
    _nameController.text = getUserName;
    _surnameController.text = getUserSurname;
    _emailController.text = getUserEmail;
    _phoneController.text = getUserPhoneNumber;
    _genderController.text = getUserGender;
    _ageController.text = getUserAge;
    // _profilPhotoUrl = getUserProfilPhoto;///FIXME
    _genderIcon = getUserGenderIcon;
  }

  /// get current user id
  @override
  String get getUserId => getUserInfoFromFirestoreResponse.data.data!.id!;

  /// get current user email
  @override
  String get getUserEmail => getUserInfoFromFirestoreResponse.data.data!.email!;

  /// get current user full name
  @override
  String get getUserFullname =>
      getUserInfoFromFirestoreResponse.data.data!.userName!;

  /// get current user name
  @override
  String get getUserName =>
      getUserInfoFromFirestoreResponse.data.data!.userName!.split(' ').first;

  /// get current user surname
  @override
  String get getUserSurname =>
      getUserInfoFromFirestoreResponse.data.data!.userName!.split(' ').last;

  /// get current user gender
  @override
  String get getUserGender =>
      getUserInfoFromFirestoreResponse.data.data!.gender!;

  /// get current user gender icon
  @override
  IconData get getUserGenderIcon =>
      isMan ? AppIcons.kManIcon : AppIcons.kWomanIcon;

  /// get current user gender icon
  @override
  bool get isMan =>
      getUserInfoFromFirestoreResponse.data.data!.gender == 'Erkek';

  /// get current user age
  @override
  String get getUserAge => getUserInfoFromFirestoreResponse.data.data!.age!;

  /// get current user phone number
  @override
  String get getUserPhoneNumber =>
      getUserInfoFromFirestoreResponse.data.data!.phoneNumber!;

  /// get current user photo url
  @override
  String get getUserProfilPhoto =>
      getUserInfoFromFirestoreResponse.data.data!.profileImgUrl!;
}
