import 'package:bond/features/post/data/models/post.dart';
import 'package:one_studio_core/core.dart';

class PostDataSource extends DataSource {
  final ApiClient _client;

  PostDataSource(this._client);

  Future<ListResponse<Post>> posts() async {
    return mapListResponse<Post>(await _client.get(
      AuthApis.posts,
      headers: Api.headers(),
    ));
  }

  Future<SingleResponse<Post>> post(String id) async {
    return mapSingleResponse<Post>(await _client.get(
      AuthApis.post(id),
      headers: Api.headers(),
    ));
  }

  Future<SingleResponse<Post>> random() async {
    return mapSingleResponse<Post>(await _client.post(
      AuthApis.randomPost,
      headers: Api.headers(),
    ));
  }
}

extension AuthApis on Api {
  static String get posts => 'posts';

  static String post(String id) => 'posts/$id';

  static String get randomPost => '/posts/random';
}
