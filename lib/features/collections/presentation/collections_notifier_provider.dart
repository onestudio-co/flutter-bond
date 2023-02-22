import 'package:bond/features/collections/presentation/collections_state.dart';
import 'package:bond/features/post/data/datasource/post_client.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';

final itemListNotifierProvider =
    StateNotifierProvider<ItemListNotifier, CollectionsState>(
        (ref) => ItemListNotifier(GetIt.I.get()));

class ItemListNotifier extends StateNotifier<CollectionsState> {
  ItemListNotifier(this.postClient) : super(const CollectionsState()) {
    fetchNextPage();
  }

  final PostClient postClient;

  Future<void> fetchNextPage() async {
    final pageNumber = state.currentPage + 1;
    final response = await postClient.getPosts();

    state = state.copyWith(
      posts: ListResponse(data: [...state.posts.data, ...response.data]),
      currentPage: pageNumber,
      hasMoreItems: true,
    );
  }
}
