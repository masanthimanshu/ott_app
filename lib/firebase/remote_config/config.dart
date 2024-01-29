import 'package:firebase_remote_config/firebase_remote_config.dart';

final _config = FirebaseRemoteConfig.instance;

void initializeRemoteConfig() async {
  await _config.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await _config.fetchAndActivate();
}

mixin RemoteConfig {
  bool getBoolData(String key) => _config.getBool(key);
  String getStringData(String key) => _config.getString(key);
}
