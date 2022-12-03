import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/repositories/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._postRepository) : super(PostInitial());

  final PostRepository _postRepository;
}
