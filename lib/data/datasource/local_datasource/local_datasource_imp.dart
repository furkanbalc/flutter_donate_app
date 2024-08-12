import 'package:flutter_donate_app/data/datasource/local_datasource/local_datasource.dart';
import 'package:hive/hive.dart';

class LocalDataSourceImp implements LocalDataSource {

  LocalDataSourceImp({required this.box});
  final Box box;

  @override
  Future<void> saveBool(String key, bool value) async {
    await box.put(key, value);
    await box.close();
  }

  @override
  Future<bool?> getBool(String key) async {
    final value = await box.get(key) as bool?;
    await box.close();
    return value;
  }

  @override
  Future<void> deleteBool(String key) async {
    await box.delete(key);
    await box.close();
  }
}
