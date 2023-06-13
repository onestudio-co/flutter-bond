import 'package:bond_core/core.dart';

import 'models/post.dart';

class PostsApi {
  final BondFire _bondFire;

  PostsApi(this._bondFire);

  Future<ListResponse<Post>> posts() => _bondFire
      .get<ListResponse<Post>>('/posts?term=sky')
      .cache()
      .factory(ListResponse<Post>.fromJson)
      .errorFactory(ServerError.fromJson)
      .execute();

  Future<SingleResponse<Post>> random() => _bondFire
      .get<SingleResponse<Post>>('/posts?term=sky')
      .factory(SingleResponse<Post>.fromJson)
      .errorFactory(ServerError.fromJson)
      .execute();

  Future<SingleResponse<Post>> post(String id) => _bondFire
      .get<SingleResponse<Post>>('/posts')
      .cache()
      .queryParameters({'id': id})
      .factory(SingleResponse<Post>.fromJson)
      .errorFactory(ServerError.fromJson)
      .execute();
}
