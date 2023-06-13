import 'package:bloc/bloc.dart';
import 'package:bond/features/post/data/api.dart';
import 'package:bond/features/post/data/models/post.dart';
import 'package:bond_core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'post_state.dart';

class PostCubit extends Cubit<ListState<Post>> {
  PostCubit(this.api) : super(ListState.initial()) {
    scrollController.addListener(_scrollControllerListener);
  }

  final PostsApi api;

  final ScrollController scrollController = ScrollController();

  Future<void> loadAllPosts() async {
    emit(state.loading());
    final response = await api.posts();
    emit(state.success(response));
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
      loadAllPosts();
    }
  }
}
