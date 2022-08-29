import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import 'imports.dart';

class ServiceProviderCategoryServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => ServiceProviderCategoryRemoteDataSource(it()));
    it.registerFactory(() => ServiceProviderCategoryRepository(it()));
    it.registerFactory(() => ServiceProviderCategoryCubit(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case ServiceProviderCategory:
        return ServiceProviderCategory.fromJson(json) as T;
      default:
        return null;
    }
  }
}
