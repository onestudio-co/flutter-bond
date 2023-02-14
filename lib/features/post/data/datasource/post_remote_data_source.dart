import 'package:bond/features/post/data/models/post.dart';
import 'package:one_studio_core/core.dart';

class PostRemoteDataSource extends DataSource {
  final ApiClient _client;

  PostRemoteDataSource(this._client);

  Future<ListResponse<Post>> posts() async {
    return mapListResponse<Post>(await _client.get(
      PostsApi.posts,
      headers: Api.headers(),
    ));
  }

  Future<SingleResponse<Post>> post(String id) async {
    return mapSingleResponse<Post>(await _client.get(
      PostsApi.post(id),
      headers: Api.headers(),
    ));
  }

  Future<SingleResponse<Post>> random() async {
    return mapSingleResponse<Post>(await _client.post(
      PostsApi.randomPost,
      headers: Api.headers(),
    ));
  }
}

extension PostsApi on Api {
  static String get posts => 'posts?term=sky';

  static String post(String id) => 'posts/$id';

  static String get randomPost => '/posts/random';
}
