import 'dart:developer';

import 'package:bond/core/request_provider/request_state.dart';
import 'package:bond/features/collections/presentation/scroll_provider.dart';
import 'package:bond/features/post/data/datasource/post_client.dart';
import 'package:bond/features/post/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_studio_core/core.dart';

typedef PostRequestState = RequestState<ListResponse<Post>, ServerException>;

final itemListNotifierProvider = StateNotifierProvider.family<ItemListNotifier,
    PostRequestState, ScrollController>(
  (ref, scrollController) {
    final provider = ItemListNotifier(sl());
    final isReachBottom = ref.watch(scrollProvider(scrollController));
    log('isReachBottom$isReachBottom');
    if (isReachBottom) {
      provider.loadPosts();
    }
    return provider;
  },
);


class ItemListNotifier extends StateNotifier<PostRequestState> {
  ItemListNotifier(this.postClient) : super(const RequestStateInitial()) {
    loadPosts();
  }

  final PostClient postClient;

  Future<void> loadPosts() async {
    state = RequestState.loading(resultMaybe: state.value);
    try {
      final response = await postClient.getPosts();

      state = RequestState.success(
        state.value == null
            ? response
            : state.value!.copyWith(
                data: state.value!.data.followedBy(response.data).toList(),
                meta: response.meta,
                links: response.links,
              ),
      );
    } on ServerException catch (error) {
      state = RequestState.failure(error);
    } catch (error) {
      log('error on load posts $error');
    }
  }
}
