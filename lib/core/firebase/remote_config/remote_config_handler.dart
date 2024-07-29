import 'dart:convert';
import 'package:ecommerce/core/firebase/remote_config/i_remote_config_handler.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigHandler implements IRemoteConfigHandler {
  final FirebaseRemoteConfig _config = FirebaseRemoteConfig.instance;

  @override
  Future<bool?> fetch() async {
    return await _config.fetchAndActivate();
  }

  @override
  Future<void> init() async {
    try {
      await _config.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 8),
          minimumFetchInterval: const Duration(minutes: 1),
        ),
      );
      await setDefaultValues();
      await _config.ensureInitialized();

      await fetch();
    } catch (err) {
      print(err);
      return;
    }
  }

  @override
  Future<void> setDefaultValues() async {}

  @override
  Map<String, dynamic> getValue(String configKey) {
    final configValue = _config.getString(configKey);

    return (jsonDecode(configValue) as Map<String, dynamic>);
  }
}
