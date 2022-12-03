import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';

import 'data/datasource/post_data_source.dart';
import 'data/models/post.dart';

class PostServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => PostDataSource(it()));

    sl<PostDataSource>().posts();
    sl<PostDataSource>().post('dAka7cInsHo');
    sl<PostDataSource>().random();
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
