import 'package:flutter/material.dart';

import '../data/models/post.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {},
        child: Hero(
          tag: post.urls.regular,
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
