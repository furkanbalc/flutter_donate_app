import 'package:flutter_donate_app/core/enums/hive_keys.dart';
import 'package:flutter_donate_app/data/datasource/local_datasource/local_datasource.dart';
import 'package:flutter_donate_app/domain/repositories/splash_repository.dart';

class SplashRepositoryImp implements SplashRepository {
  SplashRepositoryImp({required this.localDataSource});

  final LocalDataSource localDataSource;

  @override
  Future<bool?> getInitialScreen() async {
    return await localDataSource.getBool(HiveKeys.firstOpen.name);
  }

  @override
  Future<void> setInitialScreen() async {
    await localDataSource.saveBool(HiveKeys.firstOpen.name, true);
  }
}
