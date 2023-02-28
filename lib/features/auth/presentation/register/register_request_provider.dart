import 'dart:developer';

import 'package:bond/features/auth/auth.dart';
import 'package:bond/features/auth/data/datasource/auth_http_client.dart';
import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';

// 1 - declare the provider
typedef RegisterResult = Either<SingleMResponse<User, UserMeta>, Failure>;

final registerRequestProvider =
    FutureProvider.autoDispose.family<RegisterResult, UserDto>(
  (ref, userDto) async {
    final AuthHttpClient authHttpClient = sl<AuthHttpClient>();
    final AuthStore<User> localDataSource = sl<AuthStore<User>>();
    try {
      final response = await authHttpClient.register(userDto.body);
      localDataSource.user = response.data;
      localDataSource.token = response.meta.token;
      log('User registered${localDataSource.user.toString()}');
      return Left(response);
    } on ServerException catch (error, _) {
      return Right(error.toFailure());
    } catch (error) {
      return Right(ConnectionFailure());
    }
  },
);
