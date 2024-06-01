import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/models/user_model.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/repositories/profile_repository.dart';

class ProfileRepositoryImp implements ProfileRepository {
  ProfileRepositoryImp({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  ///  -- GET USER INFO --
  @override
  Future<UserEntity> getUserInfoFromFirestore({required String id}) async {
    UserModel userModel = await remoteDataSource.getUserInfoFromFirestore(id: id);
    return userModel.convertToEntity();
  }
  ///  -- SIGN OUT --
  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
  }
}
