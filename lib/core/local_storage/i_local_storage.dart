import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage.dart';

part 'local_storage_keys.dart';

abstract class ILocalStorage {
  Future<void> init();

  Future<String?> getString(String key);

  Future<bool> setString({
    required String key,
    required String value,
  });

  Future<void> clearData();
}
