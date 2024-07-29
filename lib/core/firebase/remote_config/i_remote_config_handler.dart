abstract class IRemoteConfigHandler {
  Future<void> init();

  Future<bool?> fetch();

  Future<void> setDefaultValues();

  Map<String, dynamic> getValue(String configKey);
}
