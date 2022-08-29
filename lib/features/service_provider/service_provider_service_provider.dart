import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';

import 'data/data_source/service_provider_remote_data_source.dart';
import 'data/repositories/service_provider_repository.dart';
import 'presentations/partner_cubit/partner_cubit.dart';
import 'presentations/service_provider_cubit/service_provider_cubit.dart';

class ServiceProviderServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => ServiceProviderRemoteDataSource(it()));
    it.registerFactory(() => ServiceProviderRepository(it()));
    it.registerFactory(() => ServiceProviderCubit(it()));
    it.registerFactory(() => PartnerCubit(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case User:
        return User.fromJson(json) as T;
      default:
        return null;
    }
  }
}
