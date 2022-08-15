import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';

import '../data_source/news_remote_data_source.dart';
import '../models/news.dart';

class NewsRepository {
  final NewsRemoteDataSource _remoteDataSource;

  NewsRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<News>>> allNews() async {
    try {
      final ListResponse<News> response = await _remoteDataSource.allNews();
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.toFailure());
    }
  }
}
