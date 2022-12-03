import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/post.dart';
import '../../data/repositories/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._postRepository) : super(PostState.initial()) {
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
        (data) => state.success(data.data),
      ),
    );
  }

  @override
  Future<void> close() async {
    scrollController.dispose();
    super.close();
  }

  void _scrollControllerListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double delta = 200.0;
    if (maxScroll - currentScroll <= delta &&
        state.status != PostStatus.loading) {
      loadPosts();
    }
  }
}
