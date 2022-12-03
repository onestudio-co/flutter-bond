import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../data/models/post.dart';
import '../data/repositories/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._postRepository) : super(PostState.initial());

  final PostRepository _postRepository;

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
}
