import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configDataProvider = StateNotifierProvider<RemoteConfig, ConfigModel>(
  (ref) => RemoteConfig(const ConfigModel(hostname: "", libraryId: "")),
);

class RemoteConfig extends StateNotifier<ConfigModel> {
  RemoteConfig(super.state);

  final _config = FirebaseRemoteConfig.instance;

  void initConfig() {
    final hostname = _config.getString("hostname");
    final libraryId = _config.getString("libraryId");

    state = ConfigModel(hostname: hostname, libraryId: libraryId);
  }
}

class ConfigModel {
  final String hostname;
  final String libraryId;

  const ConfigModel({
    required this.hostname,
    required this.libraryId,
  });
}
