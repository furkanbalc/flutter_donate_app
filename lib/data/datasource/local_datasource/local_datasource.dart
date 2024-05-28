abstract class LocalDataSource {
  Future<void> saveBool(String key, bool value);

  Future<bool?> getBool(String key);

  Future<void> deleteBool(String key);
}
