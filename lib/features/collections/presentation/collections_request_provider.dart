import 'package:bond/core/request_provider/request_provider.dart';
import 'package:bond/features/post/data/datasource/post_client.dart';
import 'package:bond/features/post/data/models/post.dart';
import 'package:get_it/get_it.dart';
import 'package:one_studio_core/core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final collectionsRequestProvider = ChangeNotifierProvider.autoDispose(
  (ref) => CollectionsRequestProvider(GetIt.I.get()),
);

class CollectionsRequestProvider extends RequestProvider<ListResponse<Post>> {
  final PostClient postClient;

  CollectionsRequestProvider(this.postClient){
    getAllPosts();
  }

  void getAllPosts() {
    executeRequest(requestBuilder: () => postClient.getPosts());
  }
}
