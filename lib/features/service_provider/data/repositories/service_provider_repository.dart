import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/auth/data/models/user.dart';

import '../data_source/service_provider_remote_data_source.dart';

class ServiceProviderRepository {
  final ServiceProviderRemoteDataSource _remoteDataSource;

  ServiceProviderRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<User>>> getServiceProviders() async {
    try {
      final ListResponse<User> response =
          await _remoteDataSource.getServiceProviers();
      return Right<Failure, ListResponse<User>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<User>>(e.toFailure());
    }
  }
}
