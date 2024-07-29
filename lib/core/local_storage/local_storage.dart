part of 'i_local_storage.dart';

class LocalStorage implements ILocalStorage {
  Map<String, dynamic> _cacheMap = {};

  late SharedPreferences _preferences;

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _cacheMap = {};
  }

  @override
  Future<String?> getString(String key) async {
    return _cacheMap[key] ?? (_preferences.getString(key));
  }

  @override
  Future<bool> setString({
    required String key,
    required String value,
  }) async {
    _cacheMap[key] = value;
    return _preferences.setString(key, value);
  }

  @override
  Future<void> clearData() async {
    await _preferences.clear();
  }
}
