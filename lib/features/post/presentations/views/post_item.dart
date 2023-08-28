import 'package:bond/features/post/data/models/post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () => context.pushRoute(PostDetailsRoute(post: post)),
        child: Hero(
          tag: post.uuid,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              post.urls.small,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
