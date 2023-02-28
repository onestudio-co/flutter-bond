import 'dart:developer';

import 'package:bond/features/auth/auth.dart';
import 'package:bond/features/auth/data/datasource/auth_http_client.dart';
import 'package:bond/features/auth/data/dto/user_dto.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';

// 1 - declare the provider
final registerRequestProvider = FutureProvider.autoDispose
    .family<AsyncValue<SingleMResponse<User, UserMeta>>, UserDto>(
        (ref, userDto) async {
  final AuthHttpClient authHttpClient = sl<AuthHttpClient>();
  final AuthStore<User> localDataSource = sl<AuthStore<User>>();
  // declare the asyncValue is loading
  AsyncValue<SingleMResponse<User, UserMeta>> asyncValue =
      const AsyncValue.loading();
  // The problem is that we implement register request in the constructor of FutureProvider
  // and then in each once read , watch or listen for the provider change we implement the request
  try {
    final response = await authHttpClient.register(userDto.body);
    asyncValue = AsyncData(response);
    localDataSource.user = response.data;
    localDataSource.token = response.meta.token;
    log('User registered${localDataSource.user.toString()}');
  } on ServerException catch (error, stackTrace) {
    asyncValue = AsyncValue.error(error, stackTrace);
  } catch (error, stackTrace) {
    asyncValue = AsyncValue.error(error, stackTrace);
  }
  return asyncValue;
});
