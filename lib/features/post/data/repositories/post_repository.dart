import 'package:dartz/dartz.dart';
import 'package:one_studio_core/core.dart';

import '../datasource/post_remote_data_source.dart';
import '../models/post.dart';

class PostRepository {
  final PostRemoteDataSource _remoteDataSource;

  PostRepository(this._remoteDataSource);

  Future<Either<Failure, ListResponse<Post>>> posts() async {
    try {
      final response = await _remoteDataSource.posts();
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.toFailure());
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

  Future<Either<Failure, SingleResponse<Post>>> post(String id) async {
    try {
      final response = await _remoteDataSource.post(id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.toFailure());
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

  Future<Either<Failure, SingleResponse<Post>>> random() async {
    try {
      final response = await _remoteDataSource.random();
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.toFailure());
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }
}
