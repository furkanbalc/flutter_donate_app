
import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/models/user_model.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImp({required this.remoteDataSource});

  /// -- SIGN UP --
  @override
  Future<UserEntity> signUp({required String email, required String password}) async {
    UserModel userModel = await remoteDataSource.signUp(email: email, password: password);
    return userModel.convertToEntity();
  }

  /// -- SIGN IN --
  @override
  Future<UserEntity> signIn({required String email, required String password}) async {
    UserModel userModel = await remoteDataSource.signIn(email: email, password: password);
    return userModel.convertToEntity();
  }

  /// -- SAVE USER INFO --
  @override
  Future<UserEntity> saveUserInfoToFirestore({
    required String id,
    required String email,
    required String name,
    required String surname,
    required String phoneNumber,
    required String age,
    required String gender,
    required dynamic profileImage,
  }) async {
    UserModel userModel = await remoteDataSource.saveUserInfoToFirestore(
      id: id,
      email: email,
      name: name,
      surname: surname,
      phoneNumber: phoneNumber,
      age: age,
      gender: gender,
      profileImage: profileImage,
    );
    return userModel.convertToEntity();
  }
}
