String serviceProviderStub({required String name}) => '''
import 'package:bond/core/service_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/data_sources/${name.toLowerCase()}_local_data_source.dart';
import 'data/data_sources/${name.toLowerCase()}_remote_data_source.dart';
import 'data/repositories/${name.toLowerCase()}_repository.dart';
import 'presentation/${name.toLowerCase()}_cubit.dart';

class ${name}ServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    it.registerLazySingleton(() => sharedPreferences);

    it.registerFactory(() => ${name}RemoteDataSource(it.get()));
    it.registerFactory(() => ${name}LocalDataSource(it.get()));

    it.registerLazySingleton(() => ${name}Repository(it.get(), it.get()));

    it.registerFactory(() => ${name}Cubit(it.get()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      default:
       return null;
    }
  }
}
''';
