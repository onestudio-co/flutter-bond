import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';

import '../data_source/service_provider_category_remote_data_source.dart';
import '../models/service_provider_category.dart';

class ServiceProviderCategoryRepository {
  final ServiceProviderCategoryRemoteDataSource _remoteDataSource;

  ServiceProviderCategoryRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<ServiceProviderCategory>>> getServiceProviderCategories(
      {String? textSearch}) async {
    try {
      final ListResponse<ServiceProviderCategory> response =
          await _remoteDataSource.getServiceProviderCategories(textSearch: textSearch);
      return Right<Failure, ListResponse<ServiceProviderCategory>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<ServiceProviderCategory>>(e.toFailure());
    }
  }
}
