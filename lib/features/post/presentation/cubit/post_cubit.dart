import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bond/features/post/data/models/post.dart';
import 'package:bond/features/post/data/repositories/post_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:one_studio_core/core.dart';

part 'post_state.dart';

class PostCubit extends Cubit<ListState<Post>> {
  PostCubit(this._postRepository) : super(ListState.initial()) {
    scrollController.addListener(_scrollControllerListener);
  }

  final PostRepository _postRepository;

  final ScrollController scrollController = ScrollController();

  Future<void> loadPosts() async {
    emit(state.loading());
    final response = await _postRepository.posts();
    emit(
      response.fold(
        (failure) => state.failed(failure.toMessage()),
        (data) {
          log('data ${data.runtimeType}');
          return state.success(data);
        },
      ),
    );
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
      loadPosts();
    }
  }
}
