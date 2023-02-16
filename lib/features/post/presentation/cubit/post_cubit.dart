import 'package:bloc/bloc.dart';
import 'package:bond/features/post/data/datasource/post_client.dart';
import 'package:bond/features/post/data/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:one_studio_core/core.dart';

part 'post_state.dart';

class PostCubit extends Cubit<ListState<Post>> {
  PostCubit() : super(ListState.initial()) {
    scrollController.addListener(_scrollControllerListener);
  }

  final PostClient? postClient = PostClient(sl<ApiClient>().client);

  final ScrollController scrollController = ScrollController();

  Future<void> loadAllPosts() async {
    emit(state.loading());
    final response = await postClient?.getPosts();
    emit(state.success(response ?? const ListResponse(data: [])));
  }

  @override
  Future<void> close() async {
    scrollController.dispose();
    scrollController.removeListener(_scrollControllerListener);
    super.close();
  }

  void _scrollControllerListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double delta = 200.0;
    if (maxScroll - currentScroll <= delta &&
        state.status != ListStatus.loading) {
      // loadPosts();
      loadAllPosts();
    }
  }
}
