import 'package:flutter/material.dart';

import 'views/share_button.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.author.name),
        actions: [
          ShareButton(
            postImageUrl: post.urls.full, // Pass the post image URL
          )
        ],
      ),
      body: SizedBox(
        height: double.maxFinite,
        child: Hero(
          tag: post.uuid,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              post.urls.full,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
