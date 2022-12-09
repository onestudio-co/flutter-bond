import 'package:bond/config/feature_flag.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

class FeatureFlagServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    var defaultService = FeatureFlagConfig.defaultService;
    var defaultServiceConfig =
        FeatureFlagConfig.services[FeatureFlagConfig.defaultService];
    /*TODO INIT SERVICE (SPLITIO or OTHER)*/

    /*TODO INJECT SplitIOFeatureFlagService for each type supported (bool and String)*/
  }
}
