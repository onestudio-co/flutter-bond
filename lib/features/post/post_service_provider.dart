import 'package:bond_core/bond_core.dart';
import 'package:get_it/get_it.dart';

import 'data/api.dart';
import 'data/models/post.dart';

class PostServiceProvider extends ServiceProvider with ResponseDecoding {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => PostsApi(it()));
  }

  @override
  Map<Type, JsonFactory> get factories => {
        Post: Post.fromJson,
      };
}
