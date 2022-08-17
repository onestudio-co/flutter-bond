import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';

import '../data_source/ad_remote_data_source.dart';
import '../models/ad.dart';

class AdRepository {
  final AdRemoteDataSource _remoteDataSource;

  AdRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<Ad>>> getAds() async {
    try {
      final ListResponse<Ad> response = await _remoteDataSource.getAds();
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.toFailure());
    }
  }
}
