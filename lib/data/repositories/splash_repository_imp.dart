import 'package:flutter_donate_app/core/enums/hive_keys.dart';
import 'package:flutter_donate_app/data/datasource/local_datasource/local_datasource.dart';
import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/domain/repositories/splash_repository.dart';

class SplashRepositoryImp implements SplashRepository {
  SplashRepositoryImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  /// -- IS USER LOGGED IN --
  @override
  Future<String?> isUserLoggedIn() async {
    return await remoteDataSource.isUserLoggedIn();
  }

  /// -- GET INITIAL SCREEN --
  @override
  Future<bool?> getInitialScreen() async {
    return await localDataSource.getBool(HiveKeys.firstOpen.name);
  }

  /// -- SET INITIAL SCREEN --
  @override
  Future<void> setInitialScreen() async {
    await localDataSource.saveBool(HiveKeys.firstOpen.name, true);
  }
}
