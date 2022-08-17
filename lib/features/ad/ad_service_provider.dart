import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/ad/presentations/cubit/ad_cubit.dart';

import 'data/data_source/ad_remote_data_source.dart';
import 'data/models/ad.dart';
import 'data/repositories/ad_repository.dart';

class AdServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => AdRemoteDataSource(it()));
    it.registerFactory(() => AdRepository(it()));
    it.registerLazySingleton(() => AdCubit(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case Ad:
        return Ad.fromJson(json) as T;
      default:
        return null;
    }
  }
}
