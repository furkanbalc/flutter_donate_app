import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/models/user_model.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/repositories/profile_repository.dart';

class ProfileRepositoryImp implements ProfileRepository {
  ProfileRepositoryImp({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  /// -- SAVE USER INFO --
  @override
  Future<UserEntity> saveUserInfoToFirestore({
    required String name,
    required String surname,
    required String phoneNumber,
    required String age,
    required String gender,
    required dynamic profileImage,
  }) async {
    UserModel userModel = await remoteDataSource.saveUserInfoToFirestore(
      name: name,
      surname: surname,
      phoneNumber: phoneNumber,
      age: age,
      gender: gender,
      profileImage: profileImage,
    );
    return userModel.convertToEntity();
  }

  ///  -- GET USER INFO --
  @override
  Future<UserEntity> getUserInfoFromFirestore({required String id}) async {
    UserModel userModel =
        await remoteDataSource.getUserInfoFromFirestore(id: id);
    return userModel.convertToEntity();
  }

  /// -- UPDATE USER INFO --
  @override
  Future<void> updateUserInfo({
    required String id,
    required String name,
    required String surname,
    required String email,
    required String phoneNumber,
    required String gender,
    required String age,
    required dynamic profileImage,
  }) async {
    await remoteDataSource.updateUserInfo(
      id: id,
      name: name,
      surname: surname,
      email: email,
      phoneNumber: phoneNumber,
      gender: gender,
      age: age,
      profileImage: profileImage,
    );
  }
}
