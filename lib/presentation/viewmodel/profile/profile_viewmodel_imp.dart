import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/data/models/user_model.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/usecases/profile_usecases.dart';
import 'package:flutter_donate_app/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/profile_viewmodel.dart';

class ProfileViewModelImp extends ChangeNotifier implements ProfileViewModel {
  /// -- GET USER INFO --
  ApiResponse<UserEntity> _getUserInfoFromFirestoreResponse = ApiResponse.loading('loading');

  @override
  ApiResponse<UserEntity> get getUserInfoFromFirestoreResponse => _getUserInfoFromFirestoreResponse;

  @override
  set getUserInfoFromFirestoreResponse(ApiResponse<UserEntity> value) {
    _getUserInfoFromFirestoreResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getUserInfoFromFirestore({required String id}) async {
    getUserInfoFromFirestoreResponse = ApiResponse.loading("loading");
    try {
      final UserEntity userEntity = await injector<GetUserInfoFromFirestore>().execute(
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

  /// get current user email
  @override
  String get getUserEmail => getUserInfoFromFirestoreResponse.data.data!.email!;

  /// get current user full name
  @override
  String get getUserFullname => getUserInfoFromFirestoreResponse.data.data!.userName!;

  /// get current user name
  @override
  String get getUserName => getUserInfoFromFirestoreResponse.data.data!.userName!.split(' ').first;

  /// get current user surname
  @override
  String get getUserSurname => getUserInfoFromFirestoreResponse.data.data!.userName!.split(' ').last;

  /// get current user gender
  @override
  String get getUserGender => getUserInfoFromFirestoreResponse.data.data!.gender!;

  /// get current user gender icon
  @override
  String get getUserGenderIcon =>
      getUserInfoFromFirestoreResponse.data.data!.gender == 'Erkek' ? AppAssets.man.toSvg : AppAssets.woman.toSvg;

  /// get current user age
  @override
  String get getUserAge => getUserInfoFromFirestoreResponse.data.data!.age!;

  /// get current user phone number
  @override
  String get getUserPhoneNumber => getUserInfoFromFirestoreResponse.data.data!.phoneNumber!;

  /// get current user photo url
  @override
  String get getUserProfilPhoto => getUserInfoFromFirestoreResponse.data.data!.profileImgUrl!;
}
