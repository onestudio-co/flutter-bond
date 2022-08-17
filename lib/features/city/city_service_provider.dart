import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/city/presentations/cubit/city_cubit.dart';

import 'data/data_source/city_remote_data_source.dart';
import 'data/models/city.dart';
import 'data/repositories/city_repository.dart';

class CityServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => CityRemoteDataSource(it()));
    it.registerFactory(() => CityRepository(it()));
    it.registerFactory(() => CityCubit(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case City:
        return City.fromJson(json) as T;
      default:
        return null;
    }
  }
}
