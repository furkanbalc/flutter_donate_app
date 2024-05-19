import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:flutter_donate_app/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/auth_viewmodel.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

class AuthViewModelImp with ChangeNotifier implements AuthViewModel {
  ApiResponse<UserEntity> _signUpResponse = ApiResponse.initial('initial');
  ApiResponse<UserEntity> _signInResponse = ApiResponse.initial('initial');
  ApiResponse<UserEntity> _saveUserInfoToFirestoreResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<UserEntity> get signUpResponse => _signUpResponse;

  @override
  ApiResponse<UserEntity> get signInResponse => _signInResponse;

  @override
  ApiResponse<UserEntity> get saveUserInfoToFirestoreResponse => _saveUserInfoToFirestoreResponse;

  @override
  set signUpResponse(ApiResponse<UserEntity> value) {
    _signUpResponse = value;
    notifyListeners();
  }

  @override
  set signInResponse(ApiResponse<UserEntity> value) {
    _signInResponse = value;
    notifyListeners();
  }

  @override
  set saveUserInfoToFirestoreResponse(ApiResponse<UserEntity> value) {
    _saveUserInfoToFirestoreResponse = value;
    notifyListeners();
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    signUpResponse = ApiResponse.loading("loading");
    try {
      final UserEntity userEntity = await injector<SignUp>().execute(ParamsForAuth(
        email: email,
        password: password,
      ));
      signUpResponse = ApiResponse.completed(userEntity);
    } on FirebaseAuthException catch (e, stacTrace) {
      if (e.code == 'email-already-in-use') {
        signUpResponse = ApiResponse.error(LocaleKeys.messages_email_already_in_use.tr(), stacTrace);
      }
    } catch (e, stackTrace) {
      signUpResponse = ApiResponse.error(e, stackTrace);
    }
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    signInResponse = ApiResponse.loading("loading");
    try {
      final UserEntity userEntity = await injector<SignIn>().execute(ParamsForAuth(email: email, password: password));
      signInResponse = ApiResponse.completed(userEntity);
    } on FirebaseAuthException catch (e, stacTrace) {
      if (e.code == 'user-not-found') {
        signInResponse = ApiResponse.error(LocaleKeys.messages_user_not_found.tr(), stacTrace);
      } else if (e.code == 'wrong-password') {
        signInResponse = ApiResponse.error(LocaleKeys.messages_wrong_password.tr(), stacTrace);
      }
      signInResponse = ApiResponse.error(LocaleKeys.messages_wrong_email_or_password.tr(), stacTrace);
    } catch (e, stackTrace) {
      signInResponse = ApiResponse.error(e, stackTrace);
    }
  }

  @override
  Future<void> saveUserInfoToFirestore({
    required String id,
    required String email,
    required String name,
    required String surname,
    required String phoneNumber,
    required String age,
    required String gender,
    required dynamic profileImage,
  }) async {
    saveUserInfoToFirestoreResponse = ApiResponse.loading("loading");
    try {
      final UserEntity userEntity = await injector<SaveUserInfoToFirestore>().execute(ParamsForSaveUserInfoToFirestore(
        id: id,
        email: email,
        name: name,
        surname: surname,
        phoneNumber: phoneNumber,
        age: age,
        gender: gender,
        profileImage: profileImage,
      ));
      saveUserInfoToFirestoreResponse = ApiResponse.completed(userEntity);
    } catch (e, stackTrace) {
      saveUserInfoToFirestoreResponse = ApiResponse.error(e, stackTrace);
    }
  }
}
