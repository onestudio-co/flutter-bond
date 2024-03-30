import 'package:bond/features/post/data/post_faker.dart';
import 'package:bond_network/bond_network.dart';

import 'models/post.dart';

class PostsApi {
  final BondFire _bondFire;

  PostsApi(this._bondFire);

  Future<ListResponse<Post>> fakePosts() => Future.delayed(
        const Duration(seconds: 1),
        () => ListResponse<Post>.fromJson(PostFaker.posts()),
      );

  Future<SingleResponse<Post>> fakePost() => Future.delayed(
        const Duration(seconds: 1),
        () => SingleResponse<Post>.fromJson({'data': PostFaker.post()}),
      );

  Future<ListResponse<Post>> posts() => _bondFire
      .get<ListResponse<Post>>('/posts')
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
