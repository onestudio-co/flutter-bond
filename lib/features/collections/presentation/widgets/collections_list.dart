import 'package:bond/features/post/data/models/post.dart';
import 'package:bond/features/post/presentation/post_item.dart';
import 'package:flutter/material.dart';

class CollectionsList extends StatelessWidget {
  final List<Post> posts;
  final bool loading;
  final ScrollController scrollController;

  const CollectionsList(
      {required this.posts,
      required this.loading,
      required this.scrollController,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            mainAxisSpacing: 6.0,
            crossAxisSpacing: 6.0,
            children: posts.map((post) {
              return PostItem(post: post);
            }).toList(),
          ),
          if (loading) const CircularProgressIndicator.adaptive()
        ],
      ),
    );
  }
}
