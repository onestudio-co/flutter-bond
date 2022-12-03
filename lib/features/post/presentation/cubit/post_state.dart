part of 'post_cubit.dart';

enum PostStatus { initial, loading, success, failed }

class PostState extends Equatable {
  const PostState(this.posts, this.status, this.error);

  final List<Post> posts;

  final PostStatus status;
  final String? error;

  factory PostState.initial() => const PostState([], PostStatus.initial, null);

  PostState loading() => copyWith(status: PostStatus.loading);

  PostState success(List<Post> data) => copyWith(
        status: PostStatus.success,
        posts: List.of(
          posts.followedBy(data),
        ),
      );

  PostState failed(String error) => copyWith(
        status: PostStatus.failed,
        error: error,
      );

  PostState copyWith({
    List<Post>? posts,
    PostStatus? status,
    String? error,
  }) {
    return PostState(
      posts ?? this.posts,
      status ?? this.status,
      error ?? this.error,
    );
  }

  Widget when({
    required Widget Function() initial,
    required Widget Function(List<Post>, bool loading) success,
    required Widget Function(String) failed,
  }) {
    switch (status) {
      case PostStatus.initial:
        return initial();
      case PostStatus.loading:
        return success(posts, true);
      case PostStatus.success:
        return success(posts, false);
      case PostStatus.failed:
        return failed(error!);
    }
  }

  @override
  List<Object?> get props => [
        posts,
        posts.hashCode,
        posts.length,
        status,
        error,
      ];
}
