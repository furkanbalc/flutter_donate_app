import 'package:hive/hive.dart';
import 'local_datasource.dart';

class LocalDataSourceImp implements LocalDataSource {
  final Box box;

  LocalDataSourceImp({required this.box});

  @override
  Future<void> saveBool(String key, bool value) async {
    await box.put(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return box.get(key);
  }

  @override
  Future<void> deleteBool(String key) async {
    await box.delete(key);
  }
}
