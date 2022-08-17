import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/integrations/integrations.dart';

class IntegrationsServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    
    it.registerLazySingleton(() => Integrations());
  }
}
