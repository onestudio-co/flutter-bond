import 'package:bond/features/post/data/datasource/post_client.dart';
import 'package:bond/features/post/presentation/cubit/post_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import 'data/models/post.dart';

class PostServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => PostCubit());
    it.registerFactory(() => PostClient(it()));
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
