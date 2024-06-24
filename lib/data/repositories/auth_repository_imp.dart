import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  AuthRepositoryImp({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  /// -- SIGN UP --
  @override
  Future<void> signUp({required String email, required String password}) async {
    await remoteDataSource.signUp(email: email, password: password);
  }

  /// -- SIGN IN --
  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    return await remoteDataSource.signIn(email: email, password: password);
  }

  ///  -- SIGN OUT --
  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
  }

  /// -- DELETE ACCOUNT --
  @override
  Future<void> deleteAccount() async {
    await remoteDataSource.deleteUserAccount();
  }
}
