import 'package:fixit/core/service_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get_it/get_it.dart';

class ConfigServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    // await FlutterConfig.loadEnvVariables();
  }
}
