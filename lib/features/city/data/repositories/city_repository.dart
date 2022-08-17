import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';

import '../data_source/city_remote_data_source.dart';
import '../models/city.dart';

class CityRepository {
  final CityRemoteDataSource _remoteDataSource;

  CityRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<City>>> getCities(
      {String? textSearch}) async {
    try {
      final ListResponse<City> response =
          await _remoteDataSource.getCities(textSearch: textSearch);
      return Right<Failure, ListResponse<City>>(response);
    } on ServerException catch (e) {
      return Left<Failure, ListResponse<City>>(e.toFailure());
    }
  }
}
