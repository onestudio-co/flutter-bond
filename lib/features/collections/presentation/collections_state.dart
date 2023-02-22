import 'package:bond/features/post/data/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';

class CollectionsState extends Equatable {
  final ListResponse<Post> posts;
  final int currentPage;
  final bool hasMoreItems;

  const CollectionsState({
    this.posts = const ListResponse(data: []),
    this.currentPage = 0,
    this.hasMoreItems = false,
  });

  CollectionsState copyWith({
    ListResponse<Post>? posts,
    int? currentPage,
    bool? hasMoreItems,
  }) {
    return CollectionsState(
      posts: posts ?? this.posts,
      currentPage: currentPage ?? this.currentPage,
      hasMoreItems: hasMoreItems ?? this.hasMoreItems,
    );
  }

  @override
  List<Object?> get props => [posts, currentPage, hasMoreItems];
}
