import 'package:bond_network/bond_network.dart';

import 'models/post.dart';

class PostsApi {
  final BondFire _bondFire;

  PostsApi(this._bondFire);

  Future<ListResponse<Post>> posts([String? url]) => _bondFire
      .get<ListResponse<Post>>(url ?? '/posts')
      .cache()
      .header(Api.headers())
      .factory(ListResponse<Post>.fromJson)
      .errorFactory(ServerError.fromJson)
      .execute();

  Future<SingleResponse<Post>> random() => _bondFire
      .get<SingleResponse<Post>>('/posts')
      .factory(SingleResponse<Post>.fromJson)
      .header(Api.headers())
      .errorFactory(ServerError.fromJson)
      .execute();

  Future<SingleResponse<Post>> post(String id) => _bondFire
      .get<SingleResponse<Post>>('/posts/$id')
      .cache()
      .queryParameters({'id': id})
      .factory(SingleResponse<Post>.fromJson)
      .header(Api.headers())
      .errorFactory(ServerError.fromJson)
      .execute();
}
