import 'package:bond/config/feature_flag.dart';
import 'package:bond/core/feature_flag/providers/splitio/splitio_feature_flag_provider.dart';
import 'package:bond/core/feature_flag/providers/splitio/splitio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

class FeatureFlagServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    var defaultService = FeatureFlagConfig.defaultService;
    var defaultServiceConfig =
        FeatureFlagConfig.services[FeatureFlagConfig.defaultService];
    if (defaultService == 'splitio') {
      await SplitIOService.instance.init(defaultServiceConfig);
      it.registerSingleton(SplitIOFeatureFlagService<bool>.new);
      it.registerSingleton(SplitIOFeatureFlagService<String>.new);
    } else {
      debugPrint('Feature not implemented yet!');
    }
  }
}
