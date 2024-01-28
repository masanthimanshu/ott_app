import 'package:firebase_remote_config/firebase_remote_config.dart';

mixin RemoteConfig {
  final _config = FirebaseRemoteConfig.instance;

  bool getBoolData(String key) => _config.getBool(key);
  String getStringData(String key) => _config.getString(key);
}
