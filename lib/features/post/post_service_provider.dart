import 'package:bond/features/post/presentation/post_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import 'data/datasource/post_remote_data_source.dart';
import 'data/models/post.dart';
import 'data/repositories/post_repository.dart';

class PostServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => PostRemoteDataSource(it()));
    it.registerFactory(() => PostRepository(it()));
    it.registerFactory(() => PostCubit(it()));
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    switch (T) {
      case Post:
        return Post.fromJson(json) as T;
      default:
        return null;
    }
  }
}
